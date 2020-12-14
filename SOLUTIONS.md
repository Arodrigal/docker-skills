# Solution:

## First step

### Database

The downloaded project didn't work and I built the Mongo DB with docker directly.

I used the following command for begining:
```bash
    docker run -d \
      -e MONGODB_PASS="r1td8WeZeS" \
      -p 27017:27017 -p 28017:28017 \
      --network intel-network \
	  --name mongodb mongo:3.6.21 
```

Added a new database and new user for app.

I copied data to container and check the app data.
```bash
docker cp data/restaurant.json mongodb:/tmp
docker exec -ti mongodb bash
mongoimport -d intel-db --file /tmp/restaurant.json
```

### App
I reused the test docker image for deploying app.
```bash
docker build -t intel-image -f Dockerfile.v1 .
docker run -d -v $(pwd):/tmp/app --rm -p 8080:8080 --network intel-network --name intel-app intel-image
```

## Challenge 1

I am a Senior Java developer and Junior Python developer.

I tried to improve code and I wanted to do more changes like divide method (with unique function), unit tests (jUnit in Java) and more documentation in each method (java doc in Java). My develop speed is slow and I didn't have the enought time.

Anyway I got this challengue. 

## Challenge 2

I don't have experience in these cicd systems. I use Jenkins in my job and Azure Devops in personal projects.

## Challenge 3 and Challenge 4

I love Docker, for this reason I used docker in the first step. I was able to update the dockerfiles for getting challenge.

## Challenge 5

I built the docker compose file. I wanted to use more variables from env file but I didn't see an easy way because some variables were into files.

