if not exist psb_configversion1.txt (
  cls
  color 0f
  title Configuring - Protectish Safebrowse
  echo Protectish Safebrowse
  echo.
  echo Better internet
  echo.
  echo.
  echo Thank you for downloading Protectish Safebrowse!
  echo It was detected that you either:
  echo - have outdated configuration files or
  echo - installed Protectish Safebrowse for the first time.
  echo Please wait until we finish configuring your Protectish.

  if not exist psb_configversion1.txt (
    aaaa > psb_configversion1.txt
    echo Protectish Safebrowse settings - DO NOT CHANGE THIS FILE > psb_configversion1.txt
    echo Version Of Configuration Files 1 >> psb_configversion1.txt
  )
  if not exist psb_lkused1.txt (
    aaaa > psb_lkused1.txt
    echo Protectish Safebrowse settings - DO NOT CHANGE THIS FILE > psb_lkused1.txt
    echo License Key not used >> psb_lkused1.txt
  )
  if not exist psb_gendetect1.txt (
    aaaa > psb_gendetect1.txt
    echo Protectish Safebrowse settings - DO NOT CHANGE THIS FILE > psb_gendetect1.txt
    echo Piracy not detected >> psb_gendetect1.txt  
  )
  cls
  echo Protectish Safebrowse
  echo.
  echo Better internet
  echo.
  echo.
  echo Thank you for downloading Protectish Safebrowse!
  echo It was detected that you either:
  echo - have outdated configuration files or
  echo - installed Protectish Safebrowse for the first time.
  echo Please wait until we finish configuring your Protectish.
  echo Configuration complete. You can now continue.
  pause
)
find /i /c "License Key not used" pts_lkused1.txt >NUL
if %errorlevel% equ 1 goto start

:license_key
  cls
  color 0f
  title License Key - Protectish Safebrowse
  echo Protectish Safebrowse
  echo.
  echo Better internet
  echo.
  echo.
  echo It's time to insert your license key!
  echo.
  echo If you don't have a license key, close this window, contact Protectish 
  echo staff and pay 20 CZK to acquire a life-time license key to Protectish 
  echo Safebrowse.
  echo.
  rem echo You can also type "trial" to activate a 7-day free trial of Protectish
  rem echo Safebrowse, containing all of its functions, if you haven't already.
  rem echo This message will appear again in 7 days if you do so.
  rem echo.
  set /p check_key="If you do have a license key, insert it here: "
  if "%check_key%" == "SetAdminModeOn" (
    echo Admin mode activated.
    pause
    goto start
  )
  if /i "%check_key%" == "trial" (
    rem for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
    rem echo %mydate%
    
    set day=%date:~4,5%
    set month=%date:~7,8%
    set year=%date:~10,13%
    echo.%day%
    echo.%month%
    echo.%year%
    
    pause
    echo.%DATE%
    pause
    exit

  )
  aaaa > check_license_key.txt
  echo %check_key% > check_license_key.txt
  @CertUtil -hashfile check_license_key.txt MD5 > md5.txt
  for /f "tokens=1*delims=:" %%G in ('findstr /n "^" md5.txt') do if %%G equ 2 set check_key=%%H
  echo %check_key% > check_license_key.txt
  @CertUtil -hashfile check_license_key.txt MD5 > md5.txt
  for /f "tokens=1*delims=:" %%G in ('findstr /n "^" md5.txt') do if %%G equ 2 set check_key=%%H
  del md5.txt
  del check_license_key.txt
  cls
  echo Protectish Safebrowse
  echo.
  echo Better internet
  echo.
  echo.
  echo It's time to insert your license key!
  echo.
  echo If you don't have a license key, close this window, contact Protectish 
  echo staff and pay 20 CZK to acquire a life-time license key to Protectish 
  echo Safebrowse.
  echo.
  rem echo You can also type "trial" to activate a 7-day free trial of Protectish
  rem echo Safebrowse, containing all of its functions, if you haven't already.
  rem echo This message will appear again in 7 days if you do so.
  rem echo.
  if "%check_key%" == "ca 2f a9 74 9b 7c 75 3d c0 cb a9 30 05 2d 13 da" (
    aaaa > psb_lkused1.txt
    echo Protectish Safebrowse settings - DO NOT CHANGE THIS FILE > psb_lkused1.txt
    echo License Key used >> psb_lkused1.txt
    aaaa > psb_lkinserted1.txt
    echo Protectish Safebrowse settings - DO NOT CHANGE THIS FILE > psb_lkinserted1.txt
    echo License Key inserted >> psb_lkinserted1.txt
    echo License key accepted. Thank you!
    pause
    goto start
  )
  set /a license_attempts=%license_attempts%+1
  echo This is not a valid license key.
  pause
  goto license_key
  
:start
  cls
  color 0f
  title Protectish Safebrowse
  echo Protectish Safebrowse
  echo.
  echo Better internet
  echo.
  echo.
  echo You're fully protected.
  echo.
  echo (EXIT) - exit
  echo (QUIT) - exit
  echo (END) - exit
  echo (KONEC) - exit
  echo.
  set /p choice="Enter your choice or a website: "

  if /i "%choice%" == "exit" exit
  if /i "%choice%" == "quit" exit
  if /i "%choice%" == "end" exit
  if /i "%choice%" == "konec" exit
  echo.
  echo %choice% is not a valid choice.
  pause
  goto start
