# Prompt Search

## Local enviroment setup
To setup the application locally:

```bash
# This will create the database and populate it with some seed data
rails db:create db:setup

# This will download and start elasticsearch on docker (requires docker installed)
./bin/elasticsearch_docker

# You probably know what this one does 😂
rails server

```

## Considerations
### Asynchronous document update
Doing an HTTP request inside of a application request lifecycle might not be optimal in large scale and usually for searching a small delay in updated indexes is completely fine, so I would definitely pursue async document updates instead. But since this is just a small app I opted for the simplest route.

### Other filters
I also considered including other filters like synonyms, but in the end opted to keep it simple with just a basic fuzzyness setup since I didn't know if additional features were desireable.

### Automated tests
Since the overwhelming majority of the application is just elasticsearch configuration I feel like there was nothing worth to test.
In a real-life scenario with business logic and more advanced behavior I would certainly add automated tests, but for this app it felt a bit overkill.

### My experience with Elasticsearch
Actually this is my first time directly playing around with it, I worked in systems in the past that had Elasticsearch up and running but I was never the one that implemented/maintained it.
It was interesting to learn some new things 😄
