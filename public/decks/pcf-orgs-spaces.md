# PivotalCF: Organizations, Spaces, and Roles

---

## Agenda

- Orgs, spaces, roles
- Account quotas
- Administering Users

---

## Overview

Orgs, spaces, and roles allow:

- Flexible organizational structure for projects

- Scaling from single person instances up to large corporate environments

- Control of what users can see and do


---

## Orgs

What is an Org?

The top tier in the organizational hierarchy. Users at this level are grouped by:

- Quotas
- Custom domains

---

## Org Commands

View organization details

```bash
$ cf orgs
$ cf org &lt;name&gt;
  domains: mycompany.com
  quota:   runaway (153600M memory limit, 1000 routes, -1 services, paid services allowed)
  spaces:  development, training
```

---

## Roles

What roles types are there?

**Org**

* Managers
* Billing Manager
* Auditors

**Space**

* Managers
* Auditors
* Developers

---

## Organization Roles

There are three org roles:

**OrganizationManager**: Invite and manage users, select and change plans, and set spending limits

**Billing Manager**: Create and manage the billing account and payment info

**Organization Auditor**: Read-only access to org info and reports

---

## For more information

Want to more information or to schedule a training? [Contact us](http://starkandwayne.com/contact-us.html) today!
