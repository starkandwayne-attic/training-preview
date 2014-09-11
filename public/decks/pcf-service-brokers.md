# PivotalCF Service Brokers

---

## Agenda

- What is a Service Broker?
- What does a Service Broker Provide?
- Service Broker API

---

## What is a Service Broker?

- A daemon process which exposes an HTTP API
- Implements the "Cloud Foundry Services V2 API"
- "Cloud Foundry Services V2 API" defines the contract between the Cloud Controller (CC) API and the Service Broker
- Publish a catalog, create/delete service instances, create/delete service bindings

---

## How can a broker be hosted?

- May be implemented over HTTP or HTTPS
- May have a URI prefix
- May be hosted on Cloud Foundry
- May be implemented within a larger web application
- May support multiple Cloud Foundries

---

## What does a Service Broker Provide?

* A listing of Service Plans
* 'brokers' access to any number of Service Instances
* Creates Service Instances when a Service Plan is requested
* Returns credentials and dashboard URL (if one exists) for each service created

---

## For more information

Want to more information or to schedule a training? [Contact us](http://starkandwayne.com/contact-us.html) today!
