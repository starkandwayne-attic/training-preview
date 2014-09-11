#Lab - Managing Organizations, Spaces, and Accounts

###What You Will Learn

At the end of this lab, you will be able to perform the following tasks:

1. Use Organizations to provide a logical hierarchy for managing and hosting your applications
1. Use Spaces to provide separation between your application environments (Development, Testing, Staging, and Production)
1. Manage accounts and control access to various Cloud Foundry resources

**Set Environment Variables**

Once you SSH in using your student user, set the environment variables based on information given to you by your instructor.

###Exercises

**Exercise 1:	Create An Organization**

We will once again need to log in as **admin** using the **cf login** command:

```bash
cf api $cfapiendpoint --skip-ssl-validation
cf login -u $cfuser -p $cfpassword -o default -s development
```

First, show the current list of organizations - the list that is returned will vary, depending on how far you and everyone else is in the lab:

```bash
cf orgs
```

Sample output:

```bash
$ cf orgs
Getting orgs as admin...

default
```

Next, create an organization for yourself - normally, an organization would be for your entire company (on a shared install) or department (on an internal install).  In this case, we will use the $orgname environment variable, which is set to your student user name:

```bash
cf create-org $orgname
```

Sample output:

```bash
$ cf create-org $orgname

Creating org student1 as admin...
OK

TIP: Use 'cf target -o student1' to target new org
```

**<u>Hint</u>**:  If you mis-type an organization name, you can always use **cf delete-org** or **cf rename-org** to fix it.

Now, let's see the list of organizations and filter it for your name:

```bash
cf orgs | grep $orgname
```

If your org was properly created, it should be returned:

```bash
$ cf orgs | grep $orgname
student1
```

## For more information

Want to more information or to schedule a training? Please feel free to [contact us](http://starkandwayne.com/contact-us.html)!
