*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close Browser


*** Variables ***
${URL}    https://rahulshettyacademy.com/seleniumPractise/#/
${BROWSER}  chrome
${COUNT}  4
${ADD_CLICK}  //*[@id="root"]/div/div[1]/div/div[1]/div[2]/a[2]
${ADD_TO_CARD_BUTTON}  //*[@id="root"]/div/div[1]/div/div[1]/div[3]/button
${STORE_CLICK}  //*[@id="root"]/div/header/div/div[3]/a[4]
${PROCCED_TO_CHECKOUT_BUTTON}  //*[@id="root"]/div/header/div/div[3]/div[2]/div[2]/button
${PLACE_ORDER_BUTTON}  //*[@id="root"]/div/div/div/div/button
${SELECTION_COUNTRY}  //*[@id="root"]/div/div/div/div/div/select
${COUNTRY}  Iraq
${AGREEMENT_CHECK}  //*[@id="root"]/div/div/div/div/input
${PROCCED_BUTTON}  //*[@id="root"]/div/div/div/div/button
${TABLE_TO_VERIFY}  //*[@id="productCartTables"]



*** Test Cases ***
Automate Broccoli Purchase
    Maximize Browser Window
    Add Broccoli To Cart  ${COUNT}
    Procced To Check Out
    Verify Table Result
    Place Order And Procced



*** Keywords ***
Add Broccoli To Cart
    [Arguments]    ${quantity}
    FOR    ${index}    IN RANGE    ${quantity}
        Click Element    ${ADD_CLICK}
        sleep  1s
    END

    click button  ${ADD_TO_CARD_BUTTON}


Procced To Check Out
    click link  ${STORE_CLICK}
    sleep  3s
    click button  ${PROCCED_TO_CHECKOUT_BUTTON}
    sleep  2s

Verify Table Result
    Wait Until Element Is Visible    ${TABLE_TO_VERIFY}   timeout=10s
    ${table} =    Get WebElement    //*[@id="productCartTables"]
    ${rows} =     Get WebElements    ${table}/tbody/tr
    ${row_count} =    Get Length    ${rows}

    Log    Number of items in cart: ${row_count}
    Log    Expected count: ${COUNT}, Actual count: ${row_count}


Place Order And Procced
    click button  ${PLACE_ORDER_BUTTON}
    sleep  3s
    select from list by value   ${SELECTION_COUNTRY}    ${COUNTRY}
    Sleep    2s
    click element  ${AGREEMENT_CHECK}
    sleep  3s
    click button  ${PROCCED_BUTTON}
    sleep  3s






