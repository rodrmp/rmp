
mode con: cols=1600 lines=900
@set PROMPT=[$d]....
@echo off
echo. [%date%]   %0    %1  (%*) 
color 7a

REM custom log
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) %C(bold green)%ar%C(reset) %C(white)%s%C(reset) %C(dim white)%an%C(reset)%C(bold yellow)%d%C(reset)' --all"

REM setting mergetool to kdiff3
git config --global --add merge.tool kdiff3
git config --global --add mergetool.kdiff3.path "C:/Program Files/KDiff3/kdiff3.exe"
git config --global --add mergetool.kdiff3.trustExitCode false

git config --global --add diff.guitool kdiff3
git config --global --add difftool.kdiff3.path "C:/Program Files/KDiff3/kdiff3.exe"
git config --global --add difftool.kdiff3.trustExitCode false


:start_parse
IF "%~1"=="" GOTO end_parse
IF "%~1"=="-unlock" GOTO action_git_unLock
IF "%~1"=="-lfsu" GOTO action_lfs_unistall
IF "%~1"=="-lfsi" GOTO action_lfs_install
IF "%~1"=="-lfsr" GOTO action_lfs_reset
IF "%~1"=="-update" GOTO action_git_update
IF "%~1"=="-updorig" GOTO action_git_update_origin
IF "%~1"=="-updloc" GOTO action_git_update_local
IF "%~1"=="-discardchanges" GOTO action_git_discardchanges_local
IF "%~1"=="-ps2pdf" GOTO action_ps2pdfa1b
action_git_init
SHIFT
GOTO parse
:end_parse
color 8a
echo. ready for action!
echo.
echo. USAGE: 
echo. %0 [options]
echo.
echo. OPTIONS:
echo. -unlock" GOTO action_git_unLock
echo. -lfsu" GOTO action_lfs_unistallpause
echo. -lfsi" GOTO action_lfs_installrem. goto noparse
echo. -lfsr" GOTO action_lfs_resetgoto action_git_update_local
echo. -update" GOTO action_git_update
echo. -updorig" GOTO action_git_update_origin
echo. -updloc" GOTO action_git_update_local
echo. -discardchanges" GOTO action_git_discardchanges_local
echo. -ps2pdf" GOTO action_ps2pdfa1b
echo.
echo.

echo. local branch:
set /p LOCAL_BRANCH = "N11_branch_TEST"
echo. origin branch:
set /p ORIGIN_BRANCH = "N11_branch"
echo. remote branch:
set /p UPSTREAM_BRANCH = "N11_branch"


echo. local path:
set /p LOCAL_PATH = "c:\dev\repo\nitroapp"
subst x: c:\dev\repo\nitroapp
set /p LOCAL_PATH_SUBST% = "x"
%LOCAL_PATH_SUBST%


pause
:action_ps2pdfa1b
c:/path/to/gswin32c.exe -sDEVICE=pdfwrite -o c:/path/to/output.pdf c:/path/to/input.eps
gswin32c -sDEVICE=pdfwrite -o output.pdf input.eps
rem. -dPDFSETTINGS=/default ........ roughly the same settings as Adobe Distiller uses for "screen" with the following differences:
rem. -r720x720 .................................. resolution: 720 dpi (bitmaps/fonts requiring conversion to bitmap)
rem. -dColorConversionStrategy=/LeaveColorUnchanged ... (Distiller's "screen" uses =/sRGB)
rem. -dCompatibilityLevel=1.4 .... (Distiller's "screen" uses =1.3)
rem. -dEmbedAllFonts=true [*]......... (Distiller's "screen" uses =false)
rem. -dOptimize=false [**] ............... (Distiller's "screen" uses =true)
rem. -dDownsample{Color,Gray,Mono}Images=false ... (Distiller's "screen" uses =true)
goto noparse

:action_git_unLock
set /p UIDrive = Drive letter(x) ?
set /p UIPath = Directory path (doc\txt) ?
cd %Drive%:\%UIPath%
cd x:\.git\
del index.lock 
goto noparse

:action_git_update
rem. :action_git_update
rem. git  fetch --all --v
rem. checkout upstream/%ORIGIN_BRANCH% --v
pause
color f4
git  fetch --all --v
git  checkout upstream/%ORIGIN_BRANCH% --v
goto noparse


:action_git_showcommit
git show <HASH>
goto noparse

:action_git_UnstageFile
git rm --cached <FILENAME>
goto noparse

REM Uncommit
git reset HEAD~1 --soft
goto noparse

:action_git_Editmessagelastcommit
git commit --amend
goto noparse

:action_git_Restartbranchasremote
git fetch --all
git reset --hard origin/master
goto noparse

:action_git_Removeremotebranch
git push origin --delete <branch_name>
goto noparse

:action_git_Stash
git stash
git stash pop
git stash drop
goto noparse


:action_git_hardReset
git remote add %remoteUser% git@github.com:%remoteUser%/%remoteBranch%.git
git remote -v
git fetch %remoteUser%/%remoteBranch%
git checkout %remoteUser%/%remoteBranch%
goto noparse


:action_git_hardReset
git clean -f -d (force including directories)
Git reset --hard
goto noparse

:action_git_update_origin
color 4d 
echo updating origin from local...
rem. git  checkout origin/%ORIGIN_BRANCH% --v
goto noparse

:action_git_update_local
color 4d 
echo updating local branch from upstream...
echo. git  checkout upstream/%UPSTREAM_BRANCH% --v
pause
goto noparse

:action_lfs_unistall
rem. git lfs uninstall
goto noparse
:action_lfs_install
rem. git lfs install
rem. git lfs pull
goto noparse
:action_lfs_reset
rem. git lfs uninstall
rem. git lfs install
rem. git lfs pull
goto noparse

:action_launchsecondBatchWLog
echo. log file:
set /p LOG_FILE = "log.txt"
set /P id=Enter id: 
jstack %id% > %LOG_FILE%
goto noparse

:action_git_discardchanges_local
git checkout --.
goto noparse

:action_push
rem. git push origin %ORIGIN_BRANCH%
rem. git push --force origin %ORIGIN_BRANCH%
rem. git checkout -b localBr
rem. git push origin %3
rem. git cherry-pick %3
goto noparse









:noparse
color 35
echo. -----------
x:
:action_git_init
git  init
git  remote --v
echo. ------remote-----
echo.
pause
echo.
:action_git_status
echo. -----status------
echo.
git status
echo.
pause
echo.
:action_git_log_tree
echo. -----log tree------
echo.
git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"
echo.
pause
:action_git_log
echo. -----log------
echo.
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) %C(bold green)%ar%C(reset) %C(white)%s%C(reset) %C(dim white)%an%C(reset)%C(bold yellow)%d%C(reset)' --all
echo.
echo. Bye!
echo.
pause



