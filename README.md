## Deliverables
1. [Problem Analysis](https://github.com/6170/cradles/blob/master/deliverables/problem-analysis.md)
2. [Team Work Contract](https://github.com/6170/cradles/blob/master/deliverables/team-work.md)
3. [Slides](http://6170.github.com/cradles/)
4. [Design Analysis](https://github.com/6170/cradles/blob/master/deliverables/design-analysis.md)

##Project Setup
1. Create ```cradles``` user for your postgres db.

##Development
1. Run ```rake sunspot:solr:start``` to start solr
2. Run ```rake load_schools``` to load seed list of boston schools
3. Run ```rake sunspot:solr:reindex``` to reindex all of the data (its autoupdated while the server is running).