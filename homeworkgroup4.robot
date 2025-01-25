*** Settings ***
Library    SeleniumLibrary

Test Setup    open web browser to shoppingmall

*** Variables ***
${URL}    https://www.allonline.7eleven.co.th
${BROWSER}    chrome

*** Test Cases ***
ลูกค้าสั่งซื้อสินค้าสำเร็จด้วย QR Payment
    [Documentation]    ทดสอบการสั่งซื้อสินค้าสำเร็จโดยใช้ QR Payment
    เข้าสู่ระบบ7-11
    ค้นหาสินค้าด้วยชื่อสินค้า    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N
    ตรวจสอบผลการค้นหา
    เลือกดูสินค้า
    เพิ่มสินค้าลงตะกร้า
    ตรวจสอบสินค้าในตะกร้า
    ใส่ที่อยู่จัดส่งสินค้า    
    ตรวจสอบค่าจัดส่ง
    เลือกวิธีการชำระเงินแบบ QR Payment
    ตรวจสอบยอดรวมการชำระเงิน
    ยืนยันคำสั่งซื้อ
    ตรจสอบ QR Code  


*** Keywords ***
open web browser to shoppingmall 
    Open Browser    url=${URL}    browser=${BROWSER} 

เข้าสู่ระบบ7-11
    Click Element    xpath://*[@id="page"]/header/div[4]/div/div/div/ul/li[4]
    Input Text    xpath://*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[4]/input    yukiza_hahahaha@hotmail.com
    Input Text    xpath://*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[5]/input    yukiza12345
    Click Element    xpath://*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]
    Wait Until Element Is Visible    xpath://*[@id="login-dropdown"]/span[1]    timeout=10  
    Element Should Contain    xpath://*[@id="login-dropdown"]/span[1]    ปุณยวีร์ ทองกลัด

ค้นหาสินค้าด้วยชื่อสินค้า
    [Arguments]    ${search}
    Input Text    xpath://*[@id="search_id_form"]/div/div[1]/input    ${search}
    Click Element    xpath://*[@id="search_id_form"]/div/span

ตรวจสอบผลการค้นหา
    Element Should Contain    xpath://*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N    399.00

เลือกดูสินค้า
    Click Element    xpath://*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]

เพิ่มสินค้าลงตะกร้า
    Click Element    xpath://*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button

ตรวจสอบสินค้าในตะกร้า
    Click Element    xpath://*[@id="mini-basket"]/a/i
    Click Element    xpath://*[@id="mini-basket"]/a/i
    Element Should Contain    xpath://*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[2]/a    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N
    Element Should Contain    xpath://*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[9]/div/div[2]/span[1]    ฿ 399
    Click Element    xpath://*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[10]/div/div/div/a    
    
ใส่ที่อยู่จัดส่งสินค้า
    Click Element    xpath://*[@id="address-tabs"]/ul/li[2]/a
    Click Element    xpath://*[@id="address"]/div[1]/div[2]
    Wait Until Element Is Visible    id:new-address-name    timeout=10
    Click Element    id:new-address-name
    Input Text    id:new-address-name    กาญจนา
    Input Text    xpath://*[@id="new-address-lastname"]    มงคล
    Input Text    xpath://*[@id="new-address-mobile"]    0903958789
    Input Text    xpath://*[@id="new-address-addrno"]    56/89 ซ.สามเสน   
    Select From List By Value    id:new-address-province    กรุงเทพ
    Select From List By Value    id:new-address-district    ดุสิต
    Select From List By Value    id:new-address-sub-district    ดุสิต
    Wait Until Element Is Visible    id:gcp-map    timeout=15s
    Wait Until Element Is Visible    id:selected-location    timeout=10s
    Wait Until Element Is Enabled    id:selected-location    timeout=10s
    Sleep    2s
    Click Element    id:selected-location
    Wait Until Element Is Visible    id:def-locate    timeout=10s
    Click Element    xpath://*[@id="conf-dif-addr"]

ตรวจสอบค่าจัดส่ง
    Element Should Be Visible    xpath://*[@id="js-invoice-details-tbody"]/tr[2]/td[2]/b    ฿ 35      
เลือกวิธีการชำระเงินแบบ QR Payment
    Click Element    xpath://*[@id="payment-options"]/div[4]/button
    
ตรวจสอบยอดรวมการชำระเงิน
    Element Should Be Visible    xpath://*[@id="js-invoice-details-tbody"]/tr[15]/td[2]    ฿ 434    

ยืนยันคำสั่งซื้อ
    Wait Until Element Is Visible    xpath://*[@id="payment-options"]/div[4]/button    timeout=10
    Click Element    xpath://*[@id="payment-options"]/div[4]/button

ตรจสอบ QR Code
    Wait Until Element Is Visible    xpath://*[@id="csModalWindow"]/div/div/div/div/app-thaiqrcode/div[1]/div[1]/h2
    