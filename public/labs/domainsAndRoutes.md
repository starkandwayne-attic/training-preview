Lab - Domains and Routes
========================

What You Will Learn
-------------------

At the end of this lab, you will be able to perform the following tasks: 1. Create custom domains for your Cloud Foundry organizations. 1. Use domains to separate duties in the software development lifecycle (SDLC). 1. Use domains and routes to optimally manage application version deployments

Premise
-------

For this and future labs, we will follow the exploits of 3 coworkers at the **spörks** Corporation who have just started using Cloud Foundry. We met these intrepid individuals in the “Managing Organizations, Spaces, and Accounts” Lab: Tony (the developer), Bruce (the tester), and <you> (the systems administrator). The system they've written manages their company's customer list.

Up until now, the customer list application has been hosted on a conventional instance. Your job as the OrgManager will be to set up the different environments in Cloud Foundry that will be used in the development lifecycle. You've already done some of this through the Spaces you created: development, testing, staging, and production. You have also created the necessary accounts for your team members.

Please Note: The domains used in this lab will be in the form: <some subdomain>.<ip address>.xip.io. The reasoning behind this is that these addresses automatically resolve back to the Load Balancer, without you having to spend valuable lab time managing DNS (which you will have to do when you actually use your own domain in Cloud Foundry).

Exercises
---------

**Set Environment Variables**

Once you SSH in using your student user, set the environment variables based on information given to you by your instructor.

Exercise 1: Confirm DNS
-----------------------

Confirm to yourself that all the domains we will use in this lab all reference the same IP address:

```bash
dig 1.2.3.4.xip.io
dig $rootdomain
```

Expected output may look like:

```bash
$ dig 1.2.3.4.xip.io +short
1.2.3.4

$ dig $rootdomain +short
123.123.123.123
```

```bash
dig $orgdomain +short
dig someapp.$orgdomain +short
```

Expected output may look like:

```bash
$ dig $orgdomain +short
123.123.123.123

$ dig someapp.$orgdomain +short
123.123.123.123
```

---

Exercise 2: Create Domains
--------------------------

First, login as the user you created for yourself in **Managing Organizations, Spaces, and Accounts**. Next, ensure that you target the production space:

```bash
cf target -s production
```

Expected output:

```bash

$ cf target -s production
API endpoint: https://api.example.com (API version: 2.2.0)
User:         <self>@student1.com
Org:          student1
Space:        production
```

Create the domain for the production environment:

```bash
cf create-domain $orgname $orgdomain
```

Expected output:

```bash
$ cf create-domain $orgname $orgdomain
Creating domain student1.123.123.123.123.xip.io for org student1 as <self>@student1.com...
OK
```

Next, create the subdomains for the dev, test, and staging environments:

```bash
cf create-domain $orgname dev.$orgdomain
cf create-domain $orgname test.$orgdomain
cf create-domain $orgname stg.$orgdomain
```

Expected output:

```bash
$ cf create-domain $orgname dev.$orgdomain
Creating domain dev.student1.123.123.123.123.xip.io for org student1 as <self>@student1.com...
OK
$ cf create-domain $orgname test.$orgdomain
Creating domain test.student1.123.123.123.123.xip.io for org student1 as <self>@student1.com...
OK
$ cf create-domain $orgname stg.$orgdomain
Creating domain stg.student1.123.123.123.123.xip.io for org student1 as <self>@student1.com...
OK
```

## For more information

Want to more information or to schedule a training? Please feel free to [contact us](http://starkandwayne.com/contact-us.html)!
