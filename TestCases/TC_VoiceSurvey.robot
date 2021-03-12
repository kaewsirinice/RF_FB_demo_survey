*** Settings ***
Library  Selenium2Library

Test Template    VoiceSurvey

*** Variables ***
${urlVoiceSurvey}    https://surveyconduct.feedback180.com/51dxhj0o
# Link Production : https://app-cxvoicesurveyweb-uat.azurewebsites.net/E1/1
# Link Survey Mockup : https://surveyconduct.feedback180.com/51dxhj0o
${BROWSER}    chrome    

# Elements
${btnStart}    xpath=//button
${btnNexT}    xpath=//button[contains(text(),'ถัดไป')]
${btnSubmit}    xpath=//div/button[@class='survey_button button_next']
${inputText}    xpath=//textarea
${ThankYouText}    xpath=//div[@class='thank_you_description']

*** Test Cases ***    ${Text1}    ${Text2}    ${Text3}
TC_02_01	Test_01    ทดสอบตอบ 1	    อาหารหมด พนักงานไม่ค่อยดู
TC_02_02    ${EMPTY}    ${EMPTY}    ${EMPTY} 
TC_02_03	Test_01    ทดสอบตอบ 1	    อาหารหมด พนักงานไม่ค่อยดู
    
*** Keywords ***
VoiceSurvey
    [Arguments]    ${Text1}    ${Text2}    ${Text3}
     Open Browser    ${urlVoiceSurvey}    ${BROWSER}    options=add_argument("--use-fake-ui-for-media-stream")    
     Wait Until Page Contains Element    ${btnStart}    20  None
     Click Button    ${btnStart}
     Wait Until Page Contains    1. กรุณาบอกเล่าความคิดเห็นที่คุณมีต่อการใช้บริการหรือผลิตภัณฑ์ของเราในครั้งล่าสุด     
     Input Text    ${inputText}    ${Text1}
     Click Button    ${btnNexT}
     Wait Until Page Contains    2. ขออภัยหากคุณไม่ได้รับประสบการณ์ที่ดีจากการใช้บริการหรือผลิตภัณฑ์ของเรา กรุณาระบุรายละเอียดเพื่อช่วยให้เราปรับปรุงและพัฒนาการบริการหรือผลิตภัณฑ์ของเราให้ดียิ่งขึ้น 
     Input Text    ${inputText}    ${Text2}   
     Click Button    ${btnNexT}
     Wait Until Page Contains    3. คุณมีคำแนะนำเพิ่มเติมหรือไม่ เพื่อที่เราจะมั่นใจว่าคุณจะได้รับการบริการที่ดีจากเรา
     Input Text    ${inputText}    ${Text3}
     Click Button     ${btnSubmit}
     Sleep    5s
     #Wait Until Page Contains Element    ${ThankYouText}    20  None 
     Close Browser