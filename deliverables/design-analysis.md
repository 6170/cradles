# Design Analysis

## Overview

### Key Design Challenges

1. Making the service useful for teachers and volunteers
2. Making "good" connections between teachers and volunteers
3. Making an intuitive app ui/ux
4. How to handle scheduling (data representation+ interface + matching)
5. Making the volunteers searchable

## Details

### Key design decisions
Our app has the potential to make a big difference in the lives of the teachers, volunteers and most importantly the children we are trying to help. Making the application usable and simple is one of our big design goals. If the application makes the teacher's lives harder in any way its not doing its job. It is imperative that the interface be obvious and intuitive. Additionally one of the biggest features is the matching between volunteers and volunteer opportunities. Both the visual representation and interface for the scheduling need to be spot on. Additionally the backend that handles the matching needs to perform. Because of these requirements we have elected to make the interface to the problem as simple as possible. We have looked at other scheduling apps and borrowed ideas from their designs to use in our own implemntation. These ideas include allowing specific dates and times to be specified along with repeated availability, location and proximity specifications and class topic and age requests. Additionally we have implemented a feature that allows teachers and volunteers to communicate with each other on the application (email notifications are sent). This way communication can happen as soon as a teacher finds a volunteer to connect with. 

##Data Representation

Our data is represented by a few models: Teachers, Volunteers, Schools, Interests, Messages and Conversations. Each follows the standard rest interface. Teachers and Volunteers are the standard users of the platform. Each communicates with the other via messages and conversations. Volunteers belong to many schools and have many interests. Teachers belong to one school and use the platform to search for volunteers to connect with. The schools are matched with interests and when teachers search for volunteers only appropriate volunteers show up. 

##Key Design Choices
Some of our key design choices were:
1. Using a simplistic and friendly UI - to create a more enjoyable user experience for users. 
2. To create an in-app messaging/communication platform for users to connect - We made this decision because some users expressed concern about having their emails exposed and asked that we provide a buffer. Additionally the in-app messaging system allows teachers to quickly contact and then communicate with volunteers. 
3. Geospatial representation/selection of schools -  We thought that if when picking schools to volunteer at, if a volunteer was presented with a geographical breakdown of schools in Boston they'd be more likely to volunteer at more schools that are closer to them because they can see how close they are. We asked a few test subjects to create profiles and when the schools were layed out on a map they tended to pick more schools near their location. 

4. Fast Search - The application has incredibly fast search and the results are easy to understand and interact with. We opted for a simple data model and relationship structure and it resulted in faster search and better search interface. 

##Design Critique
We unfortunately were unable to implement the teacher/volunteer reviews in time for the final product. This extra feature would have added another dimension of functionality to the application. This is a future addition to the application. Additionally we wish the homepage was a little cleaner. I'd also like the search to have a bit more interactability. We're proud of the communication platform but I think the email notifications could be improved a bit. Our object model has messages and conversations, this could have just been done with just a message model but we elected to break it down further.  
