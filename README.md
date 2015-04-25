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

Enter your own IMDB username and uid in the `env.development` file. You can find the uid by visiting the IMDB ratings page. The url will look like *http://www.imdb.com/user/{{user_uid}}/ratings?ref_=nv_usr_rt_4* 

```
MOVIE_GRAPH_IMDB_USERNAME=ryreitsma
MOVIE_GRAPH_IMDB_USER_UID=ur8282058
```

Now you are ready to import the ratings and movies into the graph database. 
