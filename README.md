# test-sinatra
Test Sinatra in a container

Each file should be run from the directory itself.

Install the chef_dk to get all the requirements for testing

### App

```cd app && ./run-local.sh - this will run it for you ```

```./test-local.sh - this will run the rspec test```

### Build and Tag Image

build.sh 

OR

```./build.sh CHOSEN_TAG```

just calling build.sh will create an image as latest

calling with tag will build latest and then tag it

### Run

Maybe use tmux or -d

```docker run -it -e "ENVIRONMENT=test" -p 4567:4567 daraghmartin/test-sinatra:latest```

### Testing Manually

Test root:

```curl http://localhost:4567/```

Test with a name:

```curl http://localhost:4567/?name=some_name```

Test api:

```curl http://localhost:4567/api/hello/```

### Rspec

```cd app && ./test-local.sh```


### Environment behaviour

Specifying different Environment Variables will change the behaviour

e.g. -e "ENVIRONMENT=test"

Call ```curl http://localhost:4567/api/hello/ ``` and you will see ```{"hello":"world","environment":"test"}``` versus ```{"hello":"world","environment":"no-env"}```

### Compose

```docker-compose up```

### Run remotely

At https://hub.docker.com/r/daraghmartin/test-sinatra/

The images are on docker hub so just do a: ```docker pull daraghmartin/test-sinatra```

Drop into your favourite local repo or store and run.
