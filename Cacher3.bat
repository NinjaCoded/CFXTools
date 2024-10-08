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
@echo off
echo '
echo '
echo '
goto 2
:1
cls
goto 2
:2
echo Select the game cache you want to clean:
echo 		1. GTA5 and FiveM
echo 		2. RDR2 and RedM
echo 		Press CTRL+C at any time to quit.
echo '
set /p dirChoice=Type 1 for GTA/FIVEM or type 2 for RDR2/REDM: 
cls
if "%dirChoice%"=="1" (
    set dirPath=%LocalAppData%\FiveM\FiveM.app\Data
	set dirVar="FiveM"
    echo ****You chose to clean the FIVEM directory****
) else if "%dirChoice%"=="2" (
    set dirPath=%LocalAppData%\RedM\RedM.app\Data
	set dirVar="RedM"
    echo ****You chose to clean the REDM directory****
) else (
    echo You can only use option 1 or 2 - Returning to main menu
    pause
	cls
    goto 1
)


cd %dirPath%
echo ""
echo ""
echo This will delete caches for %dirVar% 
echo These are the current files in your %dirVar% data directory
echo ----------------------------------------
echo ""
dir /b
echo ""
echo ----------------------------------------

echo Options
echo 	1. Delete all cache related folders (safest option - will preserve settings/keybinds)
echo 	2. Delete everything possible - Requires redownload of scripts when reconnecting to the server
echo 	3. Delete ONLY the nui-storage - For UI issues - May require UI reconfig in game
echo '
echo If you're not sure which to choose Option 1 is the safest
echo Press 'CTRL+C' at ANY time to cancel and quit
echo ...
set /p choice=	Please type in 1, 2,or 3 to select your choice and press Enter: 
echo ...

if "%choice%"=="1" (
    echo You chose Option 1 
    pause
	for %%D in (cache server-cache server-cache-priv) do (
    IF EXIST %%D (
        rmdir %%D /S /Q
    ) ELSE (
        echo '%%D' Does not exist! Exiting
		timeout /t 5 /nobreak
		echo Restarting script
		goto 1
		
    )
)
    REM rmdir cache /S /Q
    REM rmdir server-cache /S /Q
    REM rmdir server-cache-priv /S /Q
) else if "%choice%"=="2" (
    echo You chose Option 2
    echo This will remove all caches and require a download when you reconnect to the server
    echo If you get errors, it means the folders are already gone
	echo Press any key to continue
    pause
	for %%D in (cache server-cache server-cache-priv nui-storage) do (
    IF EXIST %%D (
        rmdir %%D /S /Q
        echo Successfully removed '%%D'
    ) ELSE (
        echo '%%D' does not exist! Exiting
		timeout /t 5 /nobreak
		echo Restarting script
		goto 1
    )
)
    REM rmdir cache /S /Q
    REM rmdir server-cache /S /Q
    REM rmdir server-cache-priv /S /Q
    REM rmdir nui-storage /S /Q
) else if "%choice%"=="3" (
    echo You chose Option 3
    echo This will remove only the nui-storage
	IF EXIST nui-storage (
    rmdir nui-storage /S /Q
    echo Successfully removed 'nui-storage'
) ELSE (
    echo 'nui-storage' does not exist! Exiting
		timeout /t 5 /nobreak
		echo Restarting script
	goto 1
)

    REM rmdir nui-storage /S /Q
) else (
    echo Invalid choice. Please enter 1, 2, or 3.
)
echo ...
Echo 	Files deleted!
echo 	This is your directory after removal of all cache files relevant to your game
echo 	This step is to verify visually that the folder from step 1 is no longer there
echo ----------------------------------------
dir /b
echo ----------------------------------------
echo Operation complete...Now Exiting
pause
