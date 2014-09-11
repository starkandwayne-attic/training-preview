#Lab - Deploying An Application

###What You Will Learn

1. At the end of this lab, you will be able to perform the following tasks:
2. Deploy a sample application (cf-env) to test your Cloud Foundry environment
3. Start and stop your application
4. Re-deploy an application after making changes
5. Use the manifest.yml file to save your deployment settings

**Set Environment Variables**

Once you SSH in using your student user, set the environment variables based on information given to you by your instructor.

###Exercises

**Exercise 1: Deploy your first Cloud Foundry Application**

At this point, we can deploy our first application. We will be deploying **cf-env**, a simple Ruby application that shows you the values of key environment variables used by Cloud Foundry.

First, create a folder in your home directory for the application repository:

```bash
mkdir -p workspace/apps
cd workspace/apps
git clone https://github.com/cloudfoundry-community/cf-env.git
```

Expected output:

```bash
$ mkdir -p workspace/apps
$ cd workspace/apps
$ git clone https://github.com/cloudfoundry-community/cf-env.git
Cloning into 'cf-env'...
remote: Reusing existing pack: 71, done.
remote: Total 71 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (71/71), done.
```

Next, run Ruby's bundler. This checks that the required RubyGems are available, and thus should be available to Cloud Foundry to download during deployment:

```bash
cd cf-env
bundle
```

Expected output:

```bash
$ cd cf-env
$ bundle
Fetching gem metadata from https://rubygems.org/..........
Fetching additional metadata from https://rubygems.org/..
Using json_pure 1.8.1
Using rack 1.5.2
Installing rack-protection 1.5.2
Using tilt 1.4.1
Installing sinatra 1.4.4
Using bundler 1.6.3
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

Finally, we will push cf-env to Cloud Foundry. To do this, we will need to log in as **admin** using the **cf** command. The CF API URL will also be supplied by your instructor.


## For more information

Want to more information or to schedule a training? Please feel free to [contact us](http://starkandwayne.com/contact-us.html)!
