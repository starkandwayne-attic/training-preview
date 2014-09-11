Schedules
=========

This folder documents training schedules for past and upcoming training courses.

Convert to index.html
---------------------

Install the `buildschedule` tool to convert one of these schedules to a `public/index.html`.

```
go get -u github.com/cloudfoundry-community/buildschedule
```

From the root of this project:

```
buildschedule schedules/FILE 2> public/index.html
cf push
```
