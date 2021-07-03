@echo off
@setlocal EnableDelayedExpansion
color 0A
mode con: cols=54 lines=30

::Welcome to the Game Twitch Integration Installer
::Programmed by FierceThundr_#3063
::Feel free to share!

::V1.1

     -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

:main
Title [WTTG2 Integration] Main Menu
call :end
if not defined enabled (set temp1=Enable) else (if "%enabled%"=="0" (set temp1=Enable) else (set temp1=Disable))
CLS
echo.
echo.
echo     Welcome to the WTTG2 Twitch Integration Manager
echo.
echo.
echo   [0] What This Is
echo   [1] Guided Installation
echo   [2] Update Mod File
echo   [3] %temp1% Integration
echo   [4] Troubleshoot
echo   [5] Update Information
echo   [6] Clear Sound Cache
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p ans=[#]:
CLS
call :strip ans
if "%ans%"=="0" (goto about )
if "%ans%"=="1" (goto installmain )
if "%ans%"=="2" (goto modupdate )
if "%ans%"=="3" (goto toggleintegration )
if "%ans%"=="4" (goto troubleshoot )
if "%ans%"=="5" (goto updateinformation )
if "%ans%"=="6" (goto clearcache )
echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto main



::==============================================About
:about
Title [WTTG2 Integration] About
CLS
echo.
echo.
echo                    [About the Mod]
echo.
echo     The Welcome to the Game II Twitch Integration
echo   mod is a project created by nasko222n which brings 
echo   a feature from the first game into the second.
echo.
echo     In a similar vein to the first game, it allows
echo   viewers on twitch to vote in chat polls to 
echo   influence a streamers game.
echo.
echo     These polls range from the humble troll sound,
echo   taking or giving DosCoin, to releasing a killer at
echo   the start of a game.
echo.
echo     In addition to this, the mod introduces some new 
echo   mechanics created for the mod such as new viruses, 
echo   an easy mode, and the ability to alter some game 
echo   elements.
echo.
echo.
echo.
echo.
pause
CLS
echo.
echo.
echo                  [About the Installer]
echo.
echo     This installer made by fiercethundr_ was meant 
echo   to aid players wanting to try the mod avoid the 
echo   annoying mistakes that can occur during the 
echo   installation process. It can also help manage the 
echo   files if the need ever arises.
echo.
echo     In addition it includes mild troubleshooting
echo   information if an error is ever to occur.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
CLS
goto main



::==============================================Troubleshooting
:troubleshoot
Title [WTTG2 Integration] Troubleshooting
CLS
echo.
echo.
echo               [Troubleshooting guide]
echo.
echo     Please open your game, if it is currently open
echo   please restart it.
echo.
echo     Go to your options menu, if you do not see new 
echo   modded options it means the mod did not install
echo   correctly, please contact FierceThundr_#3063 in
echo   the discord provided on the next page. 
echo.
echo     If you saw new options, start a new game and
echo   watch your twitch chat. If you do not see a 
echo   message a couple things may be happening...
echo.
echo   1. DosTwitch failed to successfully connect to
echo      twitch...
echo   2. The information you provided to the installer
echo      is invalid or currently out of date...
echo   3. Either the installer or mod did not function
echo      correctly...
echo.
echo.
pause
:troubleshoot_mid
CLS
echo.
echo.
echo               [Troubleshooting guide]
echo.
echo     To fix the issue, first try restarting your game
echo   and starting a new session. If the issue persists 
echo   verify the information given to the mod in the 
echo   main menu under "Update Information". If issues
echo   continue please contact FierceThundr_#3063 in
echo   the following discord...
echo.
echo            https://discord.gg/fcufAUXcnm
echo.
echo     You can type "open" and press enter to open the
echo   discord invite automatically, "restart" to return
echo   to the first page, or "exit" to exit this menu.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="restart" (goto troubleshoot )
if "%ans%"=="exit" (goto main )
if "%ans%"=="open" (start "" "https://discord.gg/fcufAUXcnm"&goto troubleshoot_mid )
echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto troubleshoot_mid



::==============================================Mod Update
:modupdate
if not defined enabled (goto installwarn )
if not exist "%data2:~0,-9%Twitch" (goto installerror )
if not exist "%data2:~0,-9%WTTG2.exe" (goto installerror )
Title [WTTG2 Integration] Mod Update
call :end
CLS
echo.
echo.
echo     To update the mod please retrieve the proper 
echo   file from the discord server below. After you have 
echo   accepted the invite download the latest copy of 
echo   the file "Assembly-CSharp.dll" in the channel 
echo   named #integration-stable under WTTG2 Twitch 
echo   Integration. Once you have done this drag the mod 
echo   file onto this program and press enter.
echo.
echo            https://discord.gg/fcufAUXcnm
echo.
echo     You can type "open" and press enter to open the
echo   discord invite automatically!
echo.
echo   You can also type "cancel" to exit this menu.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="cancel" (goto main )
if "%ans%"=="open" (start "" "https://discord.gg/fcufAUXcnm"&goto modupdate )
if not "%ans:~-19%"=="Assembly-CSharp.dll" (echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto modupdate )
copy /y "%ans%" "%data2:~0,-9%Twitch\Backups\Modded_Assembly-CSharp.dll" 1>NUL
copy /y "%data2:~0,-9%Twitch\Backups\Modded_Assembly-CSharp.dll" "%data2:~0,-9%WTTG2_Data\Managed\Assembly-CSharp.dll" 1>NUL
>>"%~f0"  (echo set enabled=1)
CLS
echo.
echo.
echo     Mod File Updated...
echo.
echo.
timeout 5 /nobreak 1>NUL
goto main



::==============================================Update Information
:updateinformation
if not defined enabled (goto installwarn )
if not exist "%data2:~0,-9%Twitch" (goto installerror )
if not exist "%data2:~0,-9%WTTG2.exe" (goto installerror )
Title [WTTG2 Integration] Update Information
call :end
CLS
echo.
echo.
echo     Please enter a number to update information...
echo.
echo.
echo   [1 Username] %data3%
echo   [2 Auth Key] %data4:~0,11%--------^<Redacted^>--------
echo.
echo   [3] Return to Main Menu
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p ans=[#]:
CLS
call :strip ans
if "%ans%"=="1" (goto update1 )
if "%ans%"=="2" (goto update2 )
if "%ans%"=="3" (goto main )
echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto main

:update1
Title [WTTG2 Integration] Update Username
CLS
echo.
echo.
echo     Please type your twitch username below. 
echo               (In Lowercase)
echo.
echo   You can also type "cancel" to exit this menu.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="cancel" (goto updateinfo )
del "%data2:~0,-9%Twitch\username.txt"
<NUL set /p=!ans!>>"%data2:~0,-9%Twitch\username.txt"
>>"%~f0"  (echo set data3=%ans%)
CLS
echo.
echo.
echo     Username Updated...
echo.
echo.
timeout 5 /nobreak 1>NUL
goto main

:update2
Title [WTTG2 Integration] Update Oauth Code
CLS
echo.
echo.
echo   [WARNING] THE CODE FOR THIS STEP IS SENSITIVE 
echo   AND SHOULD NOT BE SHARED UNLESS YOU KNOW WHAT 
echo   YOU ARE DOING^^!
echo.
echo     To update your oauth code, please paste your 
echo   full oauth code below. If you do not have one, 
echo   you can generate one from the link below.
echo.
echo            https://twitchapps.com/tmi/
echo.
echo   [Example Code] oauth:2gvimmlq753vo8dbud1bxl4trg46q
echo.
echo   [Note] If you have previously generated a code for
echo   another application, generating a new code will 
echo   make that code invalid.
echo.
echo     You can type "open" and press enter to open the
echo   website automatically! 
echo.
echo   You can also type "cancel" to exit this menu.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="cancel" (goto updateinfo )
if "%ans%"=="open" (start "" "https://twitchapps.com/tmi/"&goto update2 )
if not "%ans:~0,6%"=="oauth:" (echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto update2 )
del "%data2:~0,-9%Twitch\oauth.txt"
<NUL set /p=!ans!>>"%data2:~0,-9%Twitch\oauth.txt"
>>"%~f0"  (echo set data4=%ans%)
CLS
echo.
echo.
echo     Oauth Code Updated...
echo.
echo.
timeout 5 /nobreak 1>NUL
goto main



::==============================================Toggle Integration
:toggleintegration
if not defined enabled (goto installwarn )
if not exist "%data2:~0,-9%Twitch" (goto installerror )
if not exist "%data2:~0,-9%WTTG2.exe" (goto installerror )
Title [WTTG2 Integration] Toggling Integration...
CLS
echo.
echo.
if "%enabled%"=="0" (
  echo     Enabling Integration...
  copy /y "%data2:~0,-9%Twitch\Backups\Modded_Assembly-CSharp.dll" "%data2:~0,-9%WTTG2_Data\Managed\Assembly-CSharp.dll" 1>NUL
  >>"%~f0"  (echo set enabled=1)
) else (
  echo     Disabling Integration...
  copy /y "%data2:~0,-9%Twitch\Backups\Original_Assembly-CSharp.dll" "%data2:~0,-9%WTTG2_Data\Managed\Assembly-CSharp.dll" 1>NUL
  >>"%~f0"  (echo set enabled=0)
)
echo.
echo.
timeout 5 /nobreak 1>NUL
goto main



::==============================================Clear Sound Cache
:clearcache
if not defined enabled (goto installwarn )
if not exist "%data2:~0,-9%Twitch" (goto installerror )
if not exist "%data2:~0,-9%WTTG2.exe" (goto installerror )
del /q "%data2:~0,-9%WTTG2_Data\Resources\custom_audio\*.wav"
Title [WTTG2 Integration] Clearing Sound Cache...
CLS
echo.
echo.
echo     Sound Cache Deleted...
echo.
echo.
timeout 5 /nobreak 1>NUL
goto main



::==============================================Installation
:installquit
Title [WTTG2 Integration] Closing Installer...
CLS
echo.
echo.
echo     Closing the installer...
echo.
echo.
timeout 5 /nobreak 1>NUL
goto main

:installmain
if defined data2 (if exist "%data2:~0,-9%Twitch" (
  Title [WTTG2 Integration] Install paused...
  :installmulti
  CLS
  echo.
  echo.
  echo             [Mod is already installed]
  echo.
  echo     It appears that the twitch integration mod has
  echo   already been installed on this device. If you are
  echo   attempting to use this for the purposes of the
  echo   features provided by this program and you have
  echo   already installed the mod manually, please be sure
  echo   the un-modified "Assembly-CSharp.dll" is in your
  echo   WTTG2_Data\Managed folder.
  echo.
  echo     If you are trying to update the version of the
  echo   mod you are using please select "Update Mod File"
  echo   in the main menu.
  echo.
  echo     Otherwise, feel free to continue installation...
  echo.
  echo     If you wish to continue installation please type
  echo   "continue" or if you wish to cancel installation 
  echo   please type "cancel".
  echo.
  echo.
  echo.
  set /p ans=[-]:
  CLS
  call :strip ans
  if "%ans%"=="cancel" (goto installquit )
  if not "%ans%"=="continue" (echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto installmulti )
  ))
Title [WTTG2 Integration] Install Step 1/5
:step1
CLS
echo.
echo.
echo     To begin installing please retrieve the mod from
echo   the discord server below. After you have accepted
echo   the invite download the latest copy of the file 
echo   "Assembly-CSharp.dll" in the channel named 
echo   #integration-stable. Once you have done this drag 
echo   the mod file onto this program and press enter.
echo.
echo            https://discord.gg/fcufAUXcnm
echo.
echo     You can type "open" and press enter to open the
echo   discord invite automatically! You can also type
echo   "cancel" to cancel the installation at any time.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="cancel" (goto installquit )
if "%ans%"=="open" (start "" "https://discord.gg/fcufAUXcnm"&goto step1 )
if not "%ans:~-19%"=="Assembly-CSharp.dll" (echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto step1 )
set data1=%ans%

Title [WTTG2 Integration] Install Step 2/5
:step2
CLS
echo.
echo.
echo     To continue installing, please open your wttg2 
echo   files by finding wttg2 in your steam games list, 
echo   opening the properties, looking under "Manage", 
echo   then "Browse Local Files". After this is done find 
echo   "WTTG2.exe" or "WTTG2", drag it onto this program, 
echo   and press enter. 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="cancel" (goto installquit )
if not "%ans:~-9%"=="WTTG2.exe" (echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto step2 )
if not exist "%data2:~0,-9%WTTG2_Data\Managed\Assembly-CSharp.dll" (echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto step2 )
set data2=%ans%

Title [WTTG2 Integration] Step 3/5
:step3
CLS
echo.
echo.
echo     To continue installing please type your twitch
echo   username below. (In Lowercase)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="cancel" (goto installquit )
set data3=%ans%

Title [WTTG2 Integration] Install Step 4/5
:step4
CLS
echo.
echo.
echo   [WARNING] THE CODE FOR THIS STEP IS SENSITIVE 
echo   AND SHOULD NOT BE SHARED UNLESS YOU KNOW WHAT 
echo   YOU ARE DOING^^!
echo.
echo     To continue installing, please paste your full
echo   oauth code below. If you do not have one, you can
echo   generate one from the link below.
echo.
echo            https://twitchapps.com/tmi/
echo.
echo   [Example Code] oauth:2gvimmlq753vo8dbud1bxl4trg46q
echo.
echo   [Note] If you have previously generated a code for
echo   another application, generating a new code will 
echo   make that code invalid.
echo.
echo     You can type "open" and press enter to open the
echo   website automatically! 
echo.
echo.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="cancel" (goto installquit )
if "%ans%"=="open" (start "" "https://twitchapps.com/tmi/"&goto step4 )
if not "%ans:~0,6%"=="oauth:" (echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto step4 )
set data4=%ans%

Title [WTTG2 Integration] Install Step 5/5
:step5
CLS
echo.
echo.
echo     Please verify the information below...
echo.
echo   [Mod File] ...%data1:~-36%
echo   [Game EXE] ...%data2:~-36%
echo   [Username] %data3%
echo   [Auth Key] %data4:~0,11%---------^<Redacted^>---------
echo.
echo   If the information is correct enter "continue"
echo   If the information is incorrect enter "cancel"
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="cancel" (goto installquit )
if not "%ans%"=="continue" (echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto step5 )

Title [WTTG2 Integration] Installing...
echo.
echo.
echo     Installing...
echo.
echo.
if exist "%data2:~0,-9%Twitch" (
 if exist "%data2:~0,-9%Twitch\Backups\Original_Assembly-CSharp.dll" (
  copy /y "%data2:~0,-9%Twitch\Backups\Original_Assembly-CSharp.dll" "%data2:~0,-9%WTTG2_Data\Managed\Assembly-CSharp.dll" 1>NUL )
 rd /s /q "%data2:~0,-9%Twitch" )
md "%data2:~0,-9%Twitch"
md "%data2:~0,-9%Twitch\Backups"
<NUL set /p=!data3!>>"%data2:~0,-9%Twitch\username.txt"
<NUL set /p=!data4!>>"%data2:~0,-9%Twitch\oauth.txt"
copy /y "%data1%" "%data2:~0,-9%Twitch\Backups\Modded_Assembly-CSharp.dll" 1>NUL
copy /y "%data2:~0,-9%WTTG2_Data\Managed\Assembly-CSharp.dll" "%data2:~0,-9%Twitch\Backups\Original_Assembly-CSharp.dll" 1>NUL
copy /y "%data2:~0,-9%Twitch\Backups\Modded_Assembly-CSharp.dll" "%data2:~0,-9%WTTG2_Data\Managed\Assembly-CSharp.dll" 1>NUL
>>"%~f0"  (
  echo ::Installation completed on %date% %time%
  echo set data1=%data1%
  echo set data2=%data2%
  echo set data3=%data3%
  echo set data4=%data4%
  echo ::==========
  echo set enabled=1)

Title [WTTG2 Integration] Installation Complete^^!
:installdone
CLS
echo.
echo.
echo     Installation Complete^^!
echo.
echo     The mod should now be ready to play^^! Please note
echo   that the first time you start a new game, the mod
echo   will download some sound files. This will cause
echo   your load time to be somewhat longer than normal.
echo.
echo     In the event the program hangs, please be
echo   patient and let it run.
echo.
echo     If you suspect the program may have crashed,
echo   please type "clear" below and try to start a
echo   new game.
echo.
echo   [Note] If you believe the mod may not have been
echo   installed correctly, please choose the trouble-
echo   shooting option in the main menu.
echo.
echo     You can type "clear" to clear the sound cache
echo   or "done" to exit this menu.
echo.
echo.
set /p ans=[-]:
CLS
call :strip ans
if "%ans%"=="clear" (del /q "%data2:~0,-9%WTTG2_Data\Resources\custom_audio\*.wav"&goto installdone )
if "%ans%"=="done" (goto main )
echo.&echo.&echo   Please enter a valid response...&echo.&echo.&timeout 2 /nobreak 1>NUL&goto installdone



::==============================================Miscellaneous
:installwarn
CLS
echo.
echo.
echo     Installation not complete...
echo.
echo.
timeout 2 /nobreak 1>NUL
goto main

:installerror
CLS
echo.
echo.
echo     Installation could not be found...
echo     Please re-install the mod to continue^^!
echo.
echo.
timeout 5 /nobreak 1>NUL
goto main

:strip
if "!%~1!"=="" goto end
set temp1=!%~1!
set temp1=!temp1:"=!
set temp1=!temp1:(=!
set temp1=!temp1:)=!
set temp1=!temp1:%%=!
set temp1=!temp1:^>=!
set temp1=!temp1:^<=!
set temp1=!temp1:^&=!
set temp1=!temp1:^|=!
set temp1=%temp1:!=%
set %~1=%temp1%
set temp1=&set temp2=
:end
