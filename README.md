# express-server-template-typescript
A template with with EspressJS application running and [Docker](https://docker.com/).

# Requirements

## .env file

The application includes several docker-compose configuration .env file for local environment

# Running

```
yarn && yarn start:{dev|prod}
```

# Running with Docker

## Run with default environment file

```
docker-compose up -d --build
```

## Run with environment file

```
docker-compose -f docker-compose.yml up -d --build
```

## Running a new container every time and then log output (default environment):

```
docker-compose up -d --build --force-recreate; docker-compose logs -f
```

## Running a new container every time and then log output (with environment):
```
docker-compose -f docker-compose.yml up -d --build --force-recreate; docker-compose -f docker-compose.yml logs -f
```

## Reference Links

+ [docker-compose Documentation](https://docs.docker.com/compose/)
