:: TIA Portal Test Runner Console
:: Execute test cases and style guide checks with TIA Portal TestSuite

cd C:\jenkins
git clone https://github.com/faaiz777/ThesisProject-TIA-Portal.git

cd C:\jenkins\ThesisProject-TIA-Portal


@echo off
set TESTRUNNER_FOLDER="C:\jenkins\ThesisProject-TIA-Portal\TestRunner"
set TIAP_PROJ="C:\jenkins\ThesisProject-TIA-Portal\DemoProject_V17.ap17"
set REPORT_FILE_PATH="C:\jenkins\workspace\Report.xml"
:: set REPORT_FILE_PATH="C:\jenkins\ThesisProject-TIA-Portal\Report.xml"
set LOGGING_FILE_PATH="C:\jenkins\ThesisProject-TIA-Portal\runner.log"

:: change to the Test Runner Console executable folder
pushd %TESTRUNNER_FOLDER%
@echo on

:: Call Test Runner
:: run all test cases in project
:: run only SiemensProgrammingStyleguide style guide in project
Siemens.TestRunner.Console.exe ^
 --logfile %LOGGING_FILE_PATH% ^
 --report %REPORT_FILE_PATH% ^
 --format=JUNIT_HUDSON ^
 --project=%TIAP_PROJ% ^
 --test-style SiemensProgrammingStyleGuideRules ^
 --test-application all ^
 --test-application-plc-scope PLC_1