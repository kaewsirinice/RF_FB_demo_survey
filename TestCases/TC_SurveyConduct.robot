*** Settings ***
Library  Selenium2Library

Test Template    SurveyConduct

*** Variables ***
${urlSurveyConduct}    https://surveyconduct.feedback180.com/pz5df73e
# Link Production : https://surveyconduct.feedback180.com/ly0nay7w?eventcode=E1
# Link Survey Mockup : https://surveyconduct.feedback180.com/pz5df73e
${BROWSER}    headlesschrome    

# Elements
${btnStart}    xpath=//button
${btnNextS}    xpath=//div[@class='survey_buttons']//button[2]
${btnNext}    xpath=//div[@class='survey-navigate']//button[2]
${btnSubmit}    xpath=//div/button[@class='survey_button button_next']
${inputText}    xpath=//textarea
${ThankYouText}    xpath=//div[@class='thank_you_description']

*** Test Cases ***        ${npsScore}    ${ratingVote}    ${Text}
TC_01_01	1	1	อาหารหมด พนักงานไม่ค่อยดู
TC_01_02	2	2	อาหารรู้สึกไม่ค่อยสด
TC_01_03	3	3	อาหารมีให้เลือกน้อย
TC_01_04	4	4	อาหารน้อยลง
TC_01_05	5	5	อาหารควรหลากหลายกว่านี้
TC_01_06	6	5	อิ่มอร่อย
TC_01_07	7	4	อร่อยมากๆขอให้ได้รางวัล
TC_01_08	8	3	รสชาติดีค่ะ
TC_01_09	9	2	พนักงานบริการดีมากค่ะ
TC_01_10	10	1	ผักไม่ค่อยสด

*** Keywords ***
SurveyConduct    
    [Arguments]    ${npsScore}    ${ratingVote}    ${Text}
    Open Browser    ${urlSurveyConduct}    ${BROWSER}    
    #options=add_argument("--headless")  
    Wait Until Page Contains Element    ${btnStart}    20  None
    Click Button    ${btnStart}
    Click Element    xpath=//div[@class='page_body']/descendant::div[@class='question_element'][1]/div/div/descendant::div[${npsScore}]    
    Click Element    xpath=//div[@class='page_body']/descendant::div[@class='question_element'][2]/div/div/descendant::div[${ratingVote}]    
    Input Text    ${inputText}    ${Text}    
    Click Button    ${btnSubmit}
    Sleep    5s
    #Wait Until Page Contains Element    ${ThankYouText}    20  None     
    Close Browser  