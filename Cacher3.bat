@echo off
setlocal
echo ".·:''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''':·.";
echo ": :  ______     ______     ______     __  __     ______                           : :";
echo ": : /\  ___\   /\  __ \   /\  ___\   /\ \_\ \   /\  ___\                          : :";
echo ": : \ \ \____  \ \  __ \  \ \ \____  \ \  __ \  \ \  __\                          : :";
echo ": :  \ \_____\  \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \_____\                        : :";
echo ": :   \/_____/   \/_/\/_/   \/_____/   \/_/\/_/   \/_____/                        : :";
echo ": :                                                                               : :";
echo ": :  ______     ______     __    __     ______     __   __   ______     ______    : :";
echo ": : /\  == \   /\  ___\   /\ "-./  \   /\  __ \   /\ \ / /  /\  ___\   /\  == \   : :";
echo ": : \ \  __<   \ \  __\   \ \ \-./\ \  \ \ \/\ \  \ \ \'/   \ \  __\   \ \  __<   : :";
echo ": :  \ \_\ \_\  \ \_____\  \ \_\ \ \_\  \ \_____\  \ \__|    \ \_____\  \ \_\ \_\ : :";
echo ": :   \/_/ /_/   \/_____/   \/_/  \/_/   \/_____/   \/_/      \/_____/   \/_/ /_/ : :";
echo "'·:...............................................................................:·'";
Echo ""
Echo ""
@echo off
goto menu
:menu
echo Select the game cache you want to clean:
echo 1. GTA5 FiveM
echo 2. Red Dead 2 RedM
echo Press CTRL+C and confirm with Y at any time to quit.
echo ""
set /p dirChoice=Please type 1 or 2 and press Enter to select: 
echo ""
echo ""
echo ""
cls
if "%dirChoice%"=="1" (
    set dirPath=%LocalAppData%\FiveM\FiveM.app\Data
	set dirVar="FiveM"
    echo ****You chose FiveM directory****
) else if "%dirChoice%"=="2" (
    set dirPath=%LocalAppData%\RedM\RedM.app\Data
	set dirVar="RedM"
    echo ****You chose RedM directory****
) else (
    echo Invalid choice. Returning to main menu
    timeout /t 5 /nobreak
	cls
    goto menu
)

cd %dirPath%
echo ""
echo ""
echo This remove your caches for this game directory: %dirVar% 
echo Normally you will see 3 to 5 different folders. 
echo If you have ran this already there will be fewer folders listed
echo Folder : %dirPath%
echo ----------------------------------------
dir /b
echo ----------------------------------------
Echo .
Echo.
goto menu2
:menu2
cls
echo %dirVar% is your current selected game
echo Please choose an option:
echo 1. Delete only cache folders
echo 2. Delete nui-storage - Useful if you have problems with your UI in game
set /p choice=Enter your choice 1 or 2: 

if "%choice%"=="1" (
    echo You chose Option 1
    echo This will only delete your cache folders
    pause
	if not exist *cache* ( 
		pause
		echo paused
		goto no_cache
	) 	else ( goto 1logic
	:1logic
			rmdir cache /S /Q
			rmdir server-cache /S /Q
			rmdir server-cache-priv /S /Q
			goto post
		)
) else if "%choice%"=="2" (
    echo You chose Option 2
    echo This will remove only the nui-storage
	echo Reminder - You may need to reconfigure your in game UI settings
	pause
	if not exist *nui* (
		goto no_cache
	)	else (
			goto 2logic
			:2logic    
			rmdir nui-storage /S /Q
			goto post
		)
) else (
    echo Invalid choice. Please enter 1 or 2
    pause
    goto menu2
)

:post
echo ...
echo This is your directory after removal of all cache files relevant to your game
echo ----------------------------------------
echo ""
dir /b
echo ""
echo ----------------------------------------
echo Operation complete...Now Exiting
pause
exit


:no_cache
cls
echo This selection does not exist.
echo No files have been removed.
echo Returning to main menu...
timeout /t 9 /nobreak
cls
goto menu

