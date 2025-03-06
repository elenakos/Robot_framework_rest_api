# Robot_framework_rest_api
#### This repository contains a sample of testing REST API using Robot Framework
All information about the API that is used in this example: https://jsonplaceholder.typicode.com/

## Setup

Install Robot Framework:
```
pip install robotframework
```

Install Request library:
```
pip install robotframework-requests
```
Documentation for all keywords is [here](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)


## Developing tests
You can use PyCharm to review and update test cases. Add **Hyper RobotFramework Support** plug-in:
```
PyCharm -> Settings -> Plug-ins 
```

## Running tests

To execute test cases, open a terminal in PyCharm and run this command to run and save all results in Results folder
```
robot -d Results .
```

