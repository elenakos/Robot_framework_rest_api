*** Settings ***
Documentation     This file contains GET test cases
Library           RequestsLibrary
Library           Collections
Resource          ../Resources/Resource.robot
Default Tags      get    smoke

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
    ${length}=  Get length  ${posts}
    Should be equal as numbers  ${length}  5

Verify Get Posts 1 Comment Data
    ${response}=    GET   url=${API_URL}/comments?postId=1
    Should Be Equal As Strings    ${response.status_code}    200
    ${posts}    Set Variable    ${response.json()}
    Dictionary Should Contain Key        ${posts}[0]    email
    Dictionary Should Contain Value      ${posts}[0]    Eliseo@gardner.biz

Verify Get Albums Reply Structure
    ${response}=    GET   url=${API_URL}/photos?albumId=1
    Should Be Equal As Strings    ${response.status_code}    200
    ${posts}    Set Variable    ${response.json()}
    ${length}=  Get length  ${posts}
    Should be equal as numbers  ${length}  50
    FOR    ${item}    IN    @{posts}
        Dictionary Should Contain Key    ${item}    albumId
        Dictionary Should Contain Key    ${item}    id
        Dictionary Should Contain Key    ${item}    title
        Dictionary Should Contain Key    ${item}    url
    END