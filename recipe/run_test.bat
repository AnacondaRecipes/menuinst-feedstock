@ECHO ON

:: Pip check
python -m pip check
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

:: Create a .nonadmin file so that the menuinst tests
:: do not try to run with admin privileges
echo. > "%PREFIX%\.nonadmin"
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

:: Run the tests
:: Cannot run tests in test_schema.py
:: hypothesis-jsonschema is not on defaults
:: Cannot run others due to elevation requirements
pytest tests\ -vvv --ignore=tests\test_schema.py --ignore=tests\test_elevation.py -k "test_create_remove_shortcut"
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
