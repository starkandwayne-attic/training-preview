CF Workshop Service Broker Lab
==============================

Prerequisites
-------------

- Logged into Cloud Foundry as an admin
- Java JDK is installed
- `$JAVA_HOME` variable set

```
$ java -version
java version "1.7.0_55"
OpenJDK Runtime Environment (IcedTea 2.4.7) (7u55-2.4.7-1ubuntu1)
OpenJDK 64-Bit Server VM (build 24.51-b03, mixed mode)

$ echo $JAVA_HOME
/usr/lib/jvm/java-7-openjdk-amd64
```

In missing, on Ubuntu, install OpenJDK 7.

```
sudo apt-get install openjdk-7-jdk
```

Next, set the $JAVA_HOME in your environment:

```
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
```

###Set Environment Variables

Once you SSH in using your student user, set the environment variables based on information given to you by your instructor.

Intro
-----

This lab will guide you through:

- deploying a Service Broker as an app to Cloud Foundry
- registering the Broker with the Cloud Controller
- making the single plan in the catalog ``public''
- creating an instance of a service
- pushing and binding a test app to that service
- testing the app's interaction with the service

The Service Broker for this lab is for a service called HashMap as a Service (HaaSh). It wraps a minimal REST API around a Java HashMap implementation, and each service creation event results in a newly allocated Map.

Deploy Broker
-------------

Login as `admin`.

```
cf auth admin $cfpassword
```

Target your student Cloud Foundry organization.

```
cf target -o $(whoami)
```

Create a new Space for your broker.

```
cf create-space brokers
```

Create a new Space for an example client app.

```
cf create-space development
```

Target the `brokers` space.

```
cf target -s brokers
```

## For more information

Want to more information or to schedule a training? Please feel free to [contact us](http://starkandwayne.com/contact-us.html)!
