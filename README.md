# Robot_framework_rest_api
This repository contains a sample of testing REST API using Robot Framework. 

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

To execute all test cases, open a terminal in PyCharm and run this command to run test cases and save all results in Results folder
```
robot -d Results .
```

To execute only test cases with a specific tag:
```
robot -i tag  -d Results .
```

![img.png](Execution.png)


## Reviewing results
Results will be saved in generated html files, and you can open them by clicking on links in a terminal:

![img.png](Reports.png)