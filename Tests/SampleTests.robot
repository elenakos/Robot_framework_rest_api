*** Settings ***
Library           RequestsLibrary
Resource          ../Resources/Resource.robot

*** Test Cases ***

Quick Get Request Test
    ${response}=    GET  ${URLTOUSE}

Quick Get Request With Parameters Test
    ${response}=    GET  ${URLTOUSE}/search  params=query=ciao  expected_status=200
    Log    ${response}
    Should Be Equal As Strings    <Response [200]>  ${response}

Quick Get A JSON Body Test
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    1  ${response.json()}[id]