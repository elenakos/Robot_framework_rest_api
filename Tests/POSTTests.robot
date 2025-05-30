*** Settings ***
Documentation     This file contains POST test cases
Library           RequestsLibrary
Library           Collections
Resource          ../Resources/Resource.robot
Default Tags      post     smoke

*** Variables ***
${title}    Set Variable    Hello

*** Test Cases ***

Verify New Post Can Be Created
    ${title}          Set Variable         Hello from Robot
    ${body_text}      Set Variable         Post from Robot Framework
    ${user}           Set Variable         1
    ${headers}        Create Dictionary    Content-Type    application/json
    ${body}           Create Dictionary    title   ${title}      body     ${body_text}     userId    ${user}
    ${response}       POST                 ${API_URL}/posts    json=${body}    headers=${headers}
    Should Be Equal As Strings             ${response.status_code}    201
    # Verify the response JSON
    ${response_json}    Set Variable       ${response.json()}
    Dictionary Should Contain Item         ${response_json}    title    ${title}