:: TIA Portal Test Runner Console
:: Execute test cases and style guide checks with TIA Portal TestSuite

@echo off
set TESTRUNNER_FOLDER="c:\jenkins\workspace\test\TestRunner"
C:\jenkins\workspace\test
set TIAP_PROJ="C:\jenkins\workspace\test\DemoProject_V17.ap17"
set REPORT_FILE_PATH="C:\jenkins\workspace\test\Report.xml"
:: set REPORT_FILE_PATH="C:\jenkins\ThesisProject-TIA-Portal\Report.xml"
set LOGGING_FILE_PATH="C:\jenkins\workspace\test\runner.log"

:: change to the Test Runner Console executable folder
pushd %TESTRUNNER_FOLDER%
@echo on
C:\jenkins\workspace\test
:: Call Test Runner
:: run all test cases in project
:: run only SiemensProgrammingStyleguide style guide in project
Siemens.TestRunner.Console.exe ^
 --logfile %LOGGING_FILE_PATH% ^
 --report %REPORT_FILE_PATH% ^
 --format=JUNIT_HUDSON ^
 --project=%TIAP_PROJ% ^
 --test-style ProgrammingStyleRules ^
 --test-application all ^
 --test-application-plc-scope PLC_1