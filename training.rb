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
