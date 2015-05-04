### README

This is a basic Rails app to experiment with a Neo4j graph database. It combines the IMDB rss rating service with the OMDB movie API to get data into the graph database. 

## Getting started
First, install a recent version of the Neo4j database on your computer, or use a cloud provider like Graphenedb (http://www.graphenedb.com/). For development, create a `.env.development` file and (only) add the Neo4j details that differ from the default `.env` file: 

```
MOVIE_GRAPH_NEO4J_HOST=http://localhost
MOVIE_GRAPH_NEO4J_PORT=7474
MOVIE_GRAPH_NEO4J_USERNAME=neo4j
MOVIE_GRAPH_NEO4J_PASSWORD=neo4j
```
## Importing movies and ratings: from IMDb RSS ratings feed
Find your own IMDB username and uid by visiting your IMDb ratings page. The url will look like *http://www.imdb.com/user/{{user_uid}}/ratings?ref_=nv_usr_rt_4* You will have to make them publicly available to run the importers.

Run the rake task. Fill the username and user_uid in brackets and make sure there are no spaces. 
```
rake importer:from_rss[username,user_uid]
```
If you have spaces in your username, put the whole rake command between double quotes (for example: `rake "importer:from_rss[ryreitsma, ur8282058]"`) The rake task may take a long time depending on how many movies you have rated.

## Importing movies and ratings: from IMDb ratings csv file
Visit the IMDb ratings page. Scroll down to end of the list, in the right bottom corner you will find a link 'Export this list'. Download the resulting CSV file and put it into the csv directory in the root of this application.

Run the rake task. Fill the username and filename in brackets and make sure there are no spaces. 
```
rake importer:from_csv[username,filename]
```
If you have spaces in your username or in the filename, put the whole rake command between double quotes (for example: `rake "importer:from_rss[ryreitsma,ryreitsma ratings.csv]"`) The rake task may take a long time depending on how many movies you have rated.
