*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot


Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Model Creation Test

*** Test Cases ***

