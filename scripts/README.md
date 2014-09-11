Student Account Management Scripts
==================================

The purpose of these scripts is to create a set of student accounts for a shared training environment. The steps performed are:

1. Create an SSH keypair to be shared by all students.
2. Given a student count, create an account for each student.
3. Associate the new keypair with each student account.
4. Add each student account to the sudoers file.

The "destroy students" script simply removes the student accounts and their associated home directories.

Global setup
------------

```
sudo apt-get install openjdk-7-jdk maven -y

mkdir -p /opt/app/cloudfoundry/repos/
cd /opt/app/cloudfoundry/repos/
git clone https://github.com/drnic/tools-cf-plugin.git -b patches
cd tools-cf-plugin
bundle install
rvmsudo bundle install
```

The initial labs assume there is a `default` organization:

```
cf create-org default
cf target -o default
cf create-space production
cf target -o default -s production
```

Global profile change
---------------------

Add the following to bottom `/etc/bash.bashrc` adjusted for environment configuration:

```bash
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export PATH=$PATH:/usr/local/go/bin

export GOROOT=/usr/local/go

COMMON_PASSWORD="MTdlMThmNTI5"
NATS_HOST=10.3.1.212
NATS_URI=nats://nats:$COMMON_PASSWORD@$NATS_HOST:4222

function dea_ads {
  cd /opt/app/cloudfoundry/repos/tools-cf-plugin
  bundle exec cf dea-ads -h $NATS_HOST -p $COMMON_PASSWORD
}

function nats_sub {
  cd /opt/app/cloudfoundry/repos/tools-cf-plugin
  bundle exec nats-sub $1 -s $NATS_URI
}

source /etc/profile.d/rvm.sh
```

Testing errands
---------------

If the "run errands" lab is to be performed, then create `/opt/app/cloudfoundry/cf-errands/cf-errands.yml` with just the CF errands in it.

To Create Accounts:
-------------------

To create a set of student accounts (and a new key, if desired), run the following command:

```
./create_students.sh 15
```

To Delete Accounts:
-------------------

To delete the user accounts from the system, simply run:

```
./destroy_students.sh
```

TODO
----

- Currently, the destroy_accounts.sh file does not remove the sudoers entries.
