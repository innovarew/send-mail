::
:: @file send-mail.bat
:: @version v1.1
::
:: @url https://innovarew.appspot.com/
:: @author Innovarew <innovarew.solutions (at) gmail (dot) com>
:: @copyright (C) 2013 Innovarew Solutions. All Rights Reserved.
:: @license Proprietary and confidential
::     Unauthorized copying of this file, via any medium is strictly prohibited.
:: Contact us if you are interested in using our products and services.
::
:: Changelog:
::
:: [dd/mm/yyyy]        [author]
:: [brief description]
::
:: 26/12/2018        innovarew.solutions
:: v1.0 Initial version

@echo off

:: Prevent double-click execution
if %0 == "%~0" (
    pause
)

:: Configurable options

set smtpserver=localhost
set from=from@localhost
set to=to@localhost
set cc=""
set expectedlogstr="Command finished"
set body=failed

set cwd=%~dp0
set batfile="%cwd%\send-mail-batfile.bat"
set sendmail=%cwd%\send-mail.exe
set logdir="%cwd%\log\"
set logfile="%logdir%\logfile.log"
set lastlog="%logdir%\lastlog.log"
set hostname=%COMPUTERNAME%
set subject="[%batfile%] %sendmail% at %hostname% (%batfile%)"

:: End of Configurable options

mkdir %logdir%

:: Invoke the batfile
call %batfile% > %logfile%

:: Check the logfile
if exist %logfile% (
    findstr /C:%expectedlogstr% %logfile% > %lastlog%
    set /p body= < %lastlog%
)

:: Check the logfile for the expected string and report status through send-mail
findstr /C:%expectedlogstr% %logfile%
if ERRORLEVEL 0 (
    %sendmail% -smtpserver %smtpserver% -from %from% -to %to% -cc %cc% -subject %subject% -body "INFO %body%"
) else (
    %sendmail% -smtpserver %smtpserver% -from %from% -to %to% -cc %cc% -subject %subject% -body "INFO %body%" -attachment %lastlog%
)

::del %lastlog%
