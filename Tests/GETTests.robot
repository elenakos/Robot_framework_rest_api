*** Settings ***
Documentation     This file contains GET test cases
Library           RequestsLibrary
Library           Collections
Resource          ../Resources/Resource.robot
Default Tags      get    smoke

*** Test Cases ***

Verify Get Posts Returns Results
    ${response}    GET     ${API_URL}/posts
    Should Be Equal As Strings    ${response.status_code}    200
    ${posts}    Set Variable    ${response.json()}
    Should Be True    len(${posts}) > 0

Verify Get Posts Returns Correct ID
    ${response}=    GET    ${API_URL}/posts/1
    Status Should Be        200        ${response}
    Should Be Equal As Strings    1  ${response.json()}[id]

Verify Get Posts Comments Returns All Comments
    ${response}=    GET    ${API_URL}/posts/1/comments
    Should Be Equal As Strings    ${response.status_code}    200
    ${posts}    Set Variable    ${response.json()}
    ${length}=  Get length  ${posts}
    Should be equal as numbers  ${length}  5

Verify Get Comments Returns Correct Comments Data
    ${response}=    GET     url=${API_URL}/comments?postId=1
    Should Be Equal As Strings    ${response.status_code}    200
    ${posts}    Set Variable    ${response.json()}
    Dictionary Should Contain Key        ${posts}[0]    email
    Dictionary Should Contain Value      ${posts}[0]    Eliseo@gardner.biz

Verify Get Albums Reply Structure
    ${response}=    GET     url=${API_URL}/photos?albumId=1
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