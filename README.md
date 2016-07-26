# Catequesis
## Introduction
This application tries to make it possible to reserve places in aurch school or similar system. Parents can sign up and then add their offspring, and then ask for a particular shift where they want to be assigned.

##TODO
There is a [**TODO**](TODO.md) file describing what is still missing

## Configuration
This application has been created to be deployed in OpenShift online v 2.
You need:
- An OpenShift online account
- A Rails cartridge (currently only supported 4.1)
- A PostgreSQL cartridge (to connect to)
- Environment variables (rhc env set):
  - GMAIL_DOMAIN
  - GMAIL_PASSWORD
  - GMAIL_USERNAME


## Description
Catequesis is a simple program to make it possible distributed assignment of shifts to students that can not do it by themselves, so their parents do it in their behalf.
There are different rooms that hold classes in parallel, and each of those rooms have a shift. A new student needs to be assigned to one of the shifts for the full course. Rooms have a capacity, but some of the shifts can have some places reserved (prebooked) for different reasons, and the parent is free to choose any shift that has some free space left.

### Users
Users are identified with parents. They can add and delete offspring and assing them so a shift. Only one parent is in the syste, there is no space for the two parents (although it could be added). They can sign up and add children into the system, and they can assign those children to shifts that has some space available. They can also delete those children from the system.
The amount of information requested is the minimum possible.

### Offsprings
Offsprings are related to parents and they are the subject that is assigned to a shift. An offspring is assigned to a single shift for the year.

### Room and shift
There are different rooms that can be assigned. Each one has different shifts that corresponds to a group of students and a teacher.

An offspring can only be assigned to a shift in a single room.
