*** Settings ***
Library    SeleniumLibrary
Test Setup    openAllonline
Test Teardown    Close Browser
*** Variables ***
${URL}    https://www.allonline.7eleven.co.th
${BROWSER}    chrome

*** Test Cases ***

test search ไฟน์ไลน์ should fine ไฟน์ไลน์
    fineandtest    ไฟน์ไลน์    ผลการค้นหาสำหรับ »ไฟน์ไลน์«

*** Keywords ***
openAllonline
    Open Browser    ${URL}    ${BROWSER}

fineandtest
    [Arguments]    ${search}    ${result}
    Input Text  name=q  ${search}
    Pass Enter
    Check Result    ${result}

Pass Enter
    Press Keys    name=q    RETURN

Check Result
    [Arguments]    ${result}
    Wait Until Page Contains    ${result}
