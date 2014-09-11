require 'sinatra'
require 'json'
require 'base64'
require 'yaml'

class MDPressto
  def self.Brand
    unless @Brand
        @Brand = File.read("brand.html")
    end
    @Brand
  end

  def self.ParseDir(dirname)
    Dir.foreach(dirname) do |x|
        if x != "." && x != ".."
            if Dir.exist?(File.join(dirname,x))
                MDPressto.ParseDir(File.join(dirname,x))
            elsif x.end_with?(".md")
                `cd #{dirname}; mdpress -s obtvse -i images #{x}`
            end
        end
    end
  end

  def self.BrandHTML(path)
    branded = File.read(path).gsub!("<div id=\"impress\">",self.Brand()).gsub!("class='step'", "class='step slide'")
    File.open(path, 'w') {|file| file.write(branded); file.close }
  end

  def self.BrandDir(dirname)
    Dir.foreach(dirname) do |x|
        if x != "." && x != ".."
            if Dir.exist?(File.join(dirname,x))
                MDPressto.BrandDir(File.join(dirname,x))
            elsif x.end_with?("index.html")
                begin
                    MDPressto.BrandHTML(File.join(dirname,x))
                rescue
                    #raise "Could not parse #{File.join(dirname,x)}"
                end
            end
        end
    end
  end
end

if ENV["TRAINING_BASICAUTH"] != nil
    use Rack::Auth::Basic, "Restricted Area" do |username, password|
        encoded = Base64.strict_encode64("#{username}:#{password}")
        encoded == ENV["TRAINING_BASICAUTH"]
    end
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/labs' do
  send_file File.join(settings.public_folder, 'mdwiki.html')
end

configure do
  MDPressto.Brand
  workingDir = "public/decks"

  MDPressto.ParseDir(workingDir)
  MDPressto.BrandDir(workingDir)
end

# Reads in YAML schedule and creates shell script with environmental variables

schedule_filename = "schedules/20140818-att-seattle-openstack.yml"
schedule = YAML.load_file(schedule_filename)

courseEnvVar = File.new "public/cfCredentials.sh","w"

courseEnvVar.puts "#!/bin/bash\n"
courseEnvVar.puts "export cfapiendpoint=api." + schedule['cloudfoundry']['domain']
courseEnvVar.puts "export uaaendpoint=uaa." + schedule['cloudfoundry']['domain']
courseEnvVar.puts "export cfuser=" + schedule['cloudfoundry']['user']
courseEnvVar.puts "export cfconsole=console." + schedule['cloudfoundry']['domain']
courseEnvVar.puts "export uaaendpoint=https://uaa." + schedule['cloudfoundry']['domain']
courseEnvVar.puts "export firstname=CHANGEME"
courseEnvVar.puts "export orgname=$(whoami)"
courseEnvVar.puts "export cforg=default"
courseEnvVar.puts "export rootdomain=$(dig $cfapiendpoint +short | head -n1).xip.io"
courseEnvVar.puts "export orgdomain=$(whoami).$rootdomain"
courseEnvVar.puts '[ "$firstname" == "CHANGEME" ] && printf "\n***Change \$firstname from CHANGEME!***\n"'
courseEnvVar.puts "printf '\\n'"
courseEnvVar.puts "echo 'the cf admin password is: " + schedule['cloudfoundry']['password'] + "'"
courseEnvVar.puts "echo 'the cf admin secret is: " + schedule['cloudfoundry']['secret'] + "'"
courseEnvVar.puts "echo 'the cf console url is: ' $cfconsole"
courseEnvVar.puts "printf '\\n'"
courseEnvVar.puts "export bosh_ip=" + schedule['bosh']['ipaddress']
courseEnvVar.puts "echo 'the bosh user is: " + schedule['bosh']['admin_user'] + "'"
courseEnvVar.puts "echo 'the bosh password is: " + schedule['bosh']['admin_password'] + "'"
courseEnvVar.puts "echo 'the bosh UUID is: " + schedule['bosh']['UUID'] + "'"
courseEnvVar.puts "export microbosh_config=" + schedule['bosh']['microbosh_config']

courseEnvVar.close
