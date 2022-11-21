:: TIA Portal Test Runner Console
:: Execute test cases and style guide checks with TIA Portal TestSuite
:: Use this batch file in case of errors for better debugging
:: TIA Portal starts with GUI and TIA Portal Project is kept open after test execution

@echo off
:: Adapt the variable to your needs
set TESTRUNNER_FOLDER="C:\Users\Siemens\Desktop\Test Runner"
set TIAP_PROJ="C:\Users\Siemens\Documents\Automation\Standardization_Library_LBC_V17\Standardization_Library_LBC_V17.ap17"
set REPORT_FILE_PATH="C:\Users\Siemens\Documents\Automation\Standardization_Library_LBC_V17\UserFiles\Report.xml"
set LOGGING_FILE_PATH="C:\Users\Siemens\Documents\Automation\Standardization_Library_LBC_V17\UserFiles\Runner.log"

:: change to the Test Runner Console executable folder
pushd %TESTRUNNER_FOLDER%
@echo on

:: Call Test Runner
:: run all test cases in project
:: run only SiemensProgrammingStyleguide style guide in project
Siemens.TestRunner.Console.exe ^
 --debug
 --final-behavior KEEP_PROJECT
 --logfile %LOGGING_FILE_PATH% ^
 --report %REPORT_FILE_PATH% ^
 --format=JUNIT_HUDSON ^
 --project=%TIAP_PROJ% ^
 --test-style SiemensProgrammingStyleguide ^
 --test-application all ^
 --test-application-plc-scope Plc1500_Std