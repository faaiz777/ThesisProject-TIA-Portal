:: TIA Portal Test Runner Console
:: Execute test cases and style guide checks with TIA Portal TestSuite

@echo off
set TESTRUNNER_FOLDER="C:\Users\User\Desktop\Thesis\Project\DemoProject_V17\TestRunner"
set TIAP_PROJ="C:\Users\User\Desktop\Thesis\Project\DemoProject_V17\DemoProject_V17.ap17"
set REPORT_FILE_PATH="C:\Users\User\Desktop\Thesis\Project\DemoProject_V17\Report.xml"
set LOGGING_FILE_PATH="C:\Users\User\Desktop\Thesis\Project\DemoProject_V17\runner.log"

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