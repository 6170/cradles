#Problem Analysis

##Overview
### Purpose and goals
Many teachers in poorer school districts have found that having a volunteer aid in the classroom makes a tremendous difference. It doesn't matter if the volunteer was knowledgable in the subject matter. All they had to do was be there for the kids. These volunteers make a big difference in the lives of many students. 

The only problem is that it is difficult to organize and train these volunteers. Most of the effort falls on the already overworked teachers. We hope to make an application that aids teachers in the registration, training and scheduling of classroom volunteers. We want to provide a portal through which willing volunteers can be linked to the teachers that need them the most.

### Context diagram
![Context Diagram](http://www.gliffy.com/pubdoc/4068676/L.png)

##Domain
### Object model
![Object Model](http://www.gliffy.com/pubdoc/4068705/L.png)

**Review** -- A form filled out by the teacher to rate a volunteer they have interacted with.  
**Episode** -- A volunteering session


### Event model
    Volunteer ::= (Register)(Accept Volunteering Session | Deny)*
    Teacher ::= (Register)(Search for Volunteer | Review Volunteer | Request a specific volunteer | Favorite a Volunteer)*

##Behavior
### Feature descriptions
- A volunteer profile page where prospective volunteers can list information about their location, interests and availibility.
- A volunteer search page that allows teachers to search for the volunteer that they think would be right for their class.
- A volunteer review page that allows teachers to leave reviews about volunteers that they have interacted with.
- A favorites page where a teacher can view the availibility of their favorite volunteers.

##### Unusual Requirements
In Massachusetts all public school volunteers must pass a CORI background check, while outside the scope of our application it would be nice to make the background check process as easy as possible for all parties involved.

### Security concerns
**Requirements:**
1. A user's personal information should never be revealed except to those with access (e.g. teachers in their area)
2. Registering as a teacher should require external validation.

### User interfaces
##### Volunteer Story
A volunteer registers for our application giving their location, interests and availibility. After this they will recieve email notifications alerting them of teachers who want their service. 

##### Volunteer Wireframes
![Volunteer Wireframes](http://6170.github.com/cradles/volunteer_mockups.png)
##### Teacher Story
A teacher registers for our application listing their location. They use a search interface to find volunteers that are availible for their classroom. Once they have found a volunteer, they send a request for that volunteer to come in. After interacting with the volunteer, they are asked to rate the volunteer.
##### Teacher Wireframes
![Teacher Wireframes](http://6170.github.com/cradles/teacher_story.png)



