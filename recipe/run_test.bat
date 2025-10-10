@ECHO ON

:: Create a .nonadmin file so that the menuinst tests
:: do not try to run with admin privileges
echo. > "%PREFIX%\.nonadmin"
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

:: Run the tests
:: Cannot run tests in test_schema.py
:: hypothesis-jsonschema is not on defaults
pytest tests/ -vvv --ignore=tests/test_schema.py
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
