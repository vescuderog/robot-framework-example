*** Settings ***
Library  SwingLibrary
Suite Setup  Start Test Application
Documentation   A test suite with a single test for java swing

*** Test Cases ***
Test Add Todo Item
    Insert Todo Item buy milk
    Select From List  todolist  0
    ${item}=  Get Selected Value From List  todolist
    Should Be Equal  ${item}  buy milk
    Push Button  delete

Test Delete Todo Item
    Insert Todo Item to be deleted
    Select From List  todolist  0
    Push Button  delete
    ${items}=  Get List Item Count  todolist
    Should Be Equal As Numbers  ${items}  0

*** Keywords ***
Start Test Application
    Start Application  com.merkone.robot.framework.java.swing.App
    Select Window  Todo List

Insert Todo Item ${arg}
    Insert Into Text Field  description  ${arg}
    Push Button  add