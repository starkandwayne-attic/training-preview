#Lab - Scaling An Application

###What You Will Learn

At the end of this lab, you will be able to perform the following tasks:

1. Scale an application up to handle increased load
2. Scale an application down to handle decreased load
3. Use the **cf app** command to monitor application health

###Set Environment Variables

Once you SSH in using your student user, set the environment variables based on information given to you by your instructor.

###Exercises

**Exercise 1: Scale Instances**

At this point, we have deployed our first application. Let’s check its health:

```bash
cf app env-$(whoami)
```

Expected output:

```bash
$ cf app env-$(whoami)
Showing health and status for app env-student1 in org default / space development as admin...
OK

requested state: started
instances: 1/1
usage: 1G x 1 instances
urls: env-student1.<domain name>.com

     state     since                    cpu    memory        disk
#0   running   2014-07-21 12:12:09 PM   0.0%   73.6M of 1G   53.2M of 1G
```

As you can see, there is only 1 instance of cf-env running. So, if by chance, the Warden container running this application dies, we will have an outage.

Let’s fix that by scaling up to 10 instances:

```bash
cf scale env-$(whoami) -i 10
```

Expected output:

```bash
$ cf scale env-$(whoami) -i 10
Scaling app env-student1 in org default / space development as admin...
OK
```

## For more information

Want to more information or to schedule a training? Please feel free to [contact us](http://starkandwayne.com/contact-us.html)!
