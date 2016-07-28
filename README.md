# test-sinatra
Test Sinatra in a container

Each file should be run from the directory itself.

Install the chef\_dk to get all the requirements for testing

** App

./run-local.sh - this will run it for you 

./test-local.sh - this will run the rspec test

** Container

build.sh 

OR

./build.sh CHOSEN\_TAG

just calling build.sh will create an image as latest

calling with tag will build latest and then tag it

** Quick test

Maybe use tmux

docker run -it -e "ENVIRONMENT=test" -p 4567:4567 daraghmartin/test-sinatra:latest

curl http://localhost:4567/

curl http://localhost:4567/?name=y

curl http://localhost:4567/api/hello/

** Environment behaviour

specifying different Environment Variables will change the behaviour

e.g. -e "ENVIRONMENT=test"
