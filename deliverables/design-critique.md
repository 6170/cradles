## Summary assessment from user’s perspective
#### Positive
- Coverage of the usescases of the client
- Volunteer registration makes it easy identify which schools you are availible for.
- Email notifications make it easy to use the app (they take me directly to the page).

#### Negative
- No way to actually schedule recuring events

## Summary assessment from developer’s perspective
- Clean simple code, utilizing technology such as solr.
- Making two different models for Volunteers and Teachers allows easy separation of concerns, but makes integrating with the authentication library more difficult.
- Code is clean with nice user of before_filters to filter actions.



## Most and least successful decisions
### Most
- Solr integration with autocomplete makes it very easy to select schools

### Least
- Lack of a verified manager for each school, there is no way to verify if a school exists or if a teacher actually belongs to that school.


## Analysis of design faults in terms of design principles
- The majority of the problems occuered because of difficulty in getting a spec from the client
- Cradle's uses case for reviewing volunteers and registering schools was not well defined, so for the sake of this class we had to come up with a reasonable alternative.

## Priorities for improvement
1. Further flesh out requirements from client
2. Make a third user type that manages schools and the teachers who belong to them.