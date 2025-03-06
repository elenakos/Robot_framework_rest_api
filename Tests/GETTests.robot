*** Settings ***
Documentation     This file contains GET test cases
Library           RequestsLibrary
Library           Collections
Resource          ../Resources/Resource.robot

*** Test Cases ***

Verify Get Posts
    Create Session    jsonplaceholder    ${API_URL}
    ${response}    GET On Session    jsonplaceholder    /posts
    Should Be Equal As Strings    ${response.status_code}    200
    ${posts}    Set Variable    ${response.json()}
    Should Be True    len(${posts}) > 0

Verify Get Posts 1
    ${response}=    GET  ${API_URL}/posts/1
    Status Should Be        200        ${response}
    Should Be Equal As Strings    1  ${response.json()}[id]

Verify Get Posts 1 All Comments
    ${response}=    GET  ${API_URL}/posts/1/comments
    Should Be Equal As Strings    ${response.status_code}    200
    ${posts}    Set Variable    ${response.json()}
    Dictionary Should Contain Value      ${posts}[4]    Hayden@althea.biz

Verify Get Posts 1 Comment 1
    ${response}=    GET   url=${API_URL}/comments?postId=1
    Should Be Equal As Strings    ${response.status_code}    200
    ${posts}    Set Variable    ${response.json()}
    Dictionary Should Contain Value      ${posts}[0]    Eliseo@gardner.biz