@echo off
setlocal enabledelayedexpansion
cls
echo.
echo VERIFICANDO SE VOCE ESTA COMO ADMINISTRADOR.
echo AGUARDE UM POUCO.
echo.

::Batch como Admin, Partially created by Ankh Tech==================================
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Executando como administrador...
    powershell start -verb runas '%0' am_admin
    exit /b
)
::==================================================================================
goto scripty
::==================================================================================

:menuseg
cls
echo.
echo.
echo.
echo   %b%"----------------------------------------------------------------------------"%w%
echo   %b%"----------------------------------------------------------------------------"%w%
echo              ===-{ ACESSO PERMITIDO - BEM-VINDO Sr. ADMN } -===
echo.
echo          %g%Senha correta!  Acessando as Ferramentas Administrativas...%w%
echo   %g%"----------------------------------------------------------------------------"%w%
echo   %g%"----------------------------------------------------------------------------"%w%
echo.
echo.
timeout /t 2 >nul
cls

color 9
title LimpezaTotalTI2025
mode 96,25

:: Configuracoes de cores otimizadas
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
    set "DEL=%%a"
)

set "g=[92m"
set "r=[91m"
set "red=[04m"
set "l=[1m"
set "w=[0m"
set "b=[94m"
set "m=[95m"
set "c=[35m"
set "d=[96m"
set "u=[0m"
set "z=[91m"
set "n=[96m"
set "y=[40;33m"
set "g2=[102m"
set "r2=[101m"
set "t=[40m"
set "gg=[93m"
set "q=[90m"
set "gr=[32m"
set "o=[38;5;202m"
set "bb=[38;5;74m"
set "nn=[38;5;82m"
set "rr=[1;91m"
set "blb=[1;94m"
set "neon_vp=[1;38;5;129m"
set "ha=[38;5;203m"

::==================================================================================
::==================================================================================
cls
:start1
echo.
echo %b%"----------------------------------------------------------------------------"%w%
echo              ===-{ AVISO IMPORTANTE ANTES DE CONTINUAR } -===
echo.  
echo.  Crie um ponto de restauracao antes de utilizar os comandos deste Script.
echo   Ai, caso ocorra algum problema no sistema, vc podera voltar ao ponto antes das alteracoes.
echo.
echo   Em hipotese alguma continue sem antes criar um ponto de restauracao.
echo   Mas, se preferir nao criar, tudo bem, faca por sua conta e risco.
echo   Nao nos responsabilizamos por quaisquer problemas advindos do uso deste Script.
echo.  
echo. %o%[ 1 ]%neon_vp% CRIAR UM PONTO DE RESTAURACAO   %b%-  %o%[ 2 ]%neon_vp% ABRIR RESTAURACAO DO SISTEMA
echo.
echo                             %o%[ 3 ]%neon_vp% IGNORAR E CONTINUAR???
echo.
echo %b%"----------------------------------------------------------------------------"%w%
set /p "op=Selecionar:%bb%"
if "%op%"=="1" goto criarp
if "%op%"=="2" goto criarp02
if "%op%"=="3" goto ncriarp
if "%op%"=="0" goto menu
goto teclaerrada1

:teclaerrada1
cls
echo.
echo     Ops, tecla errada...
timeout /t 2 >nul
goto start1

:criarp
cls
echo        %y%Criando Ponto de Restauracao...%w%
echo.
powershell "Checkpoint-Computer -Description 'Nodes Limpeza Total 2025'
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Ponto de restauracao criado com sucesso, press "OK" para continuar', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"powershell "Checkpoint-Computer -Description 'NodesLimpezaTotal2025'
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Point de restauracao completado com sucesso, press "OK" para continuar', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
timeout /t 3 >nul
goto menu

:criarp02
cls
echo        %y%Abrindo ferramenta de restauracao do Sistema...%w%
echo.
rstrui.exe
echo.
timeout /t 3 >nul
goto menu

:ncriarp
cls.
echo.
echo.
echo %gg%"----------------------------------------------------------------------------"%w%
echo %gg%"----------------------------------------------------------------------------"%w%
echo.
echo        VC ESTA PROSSEGUINDO SEM CRIAR UM PONTO DE RESTAURACAO.
echo        TEM CERTEZA DE QUE QUER MESMO PROSSEGUIR?
echo.
echo        Pressione CTRL+C para cancelar a operacao.
echo              Ou tecle ENTER para prosseguir.
echo.
echo %b%"----------------------------------------------------------------------------"%w%
echo %b%"----------------------------------------------------------------------------"%w%
pause
::==================================================================================
::==================================================================================

:menu
cls
echo.
echo          %gg%------------------------------------------------------------------------
echo          ------------------------------------------------------------------------
echo.
echo                  _   _           _             ____  ____
echo                 ^| \ ^| ^|         ^| ^|           ^|  _ \^|  _ \
echo                 ^|  \^| ^| ___   __^| ^| ___  ___  ^| ^| \ ^| ^|_) ^|
echo                 ^| . ` ^|/ _ \ / _` ^|/ _ \/ __^| ^| ^| ^| ^|  _ ^<
echo                 ^| ^|\  ^| ^| ^| ^| ^| ^| ^|  __/\__ \ ^| ^|_/ ^| ^|_) ^|
echo                 ^|_^| \_^ \___/ \__,_^ \___/^|___/ ^|____/^|____/
echo.
echo          ------------------------------------------------------------------------
echo          ------------------------------------------------------------------------
echo.
echo.
echo 	   %o%[ 1 ]%neon_vp% Limpeza Basica     %o%[ 2 ]%neon_vp% Limpar Mais    %o%[ 3 ]%neon_vp% Otimizar Windows
echo                 %o%[ 4 ]%neon_vp% Otimizar RAMs               %g%[ 5 ] +Ferramentas do TI%neon_vp%
echo.
echo    %w%[ 0 ]%neon_vp% Sair?
echo. 
echo. 	                                  
echo.
echo.%gg%
set /p "op=Selecionar:%bb%"
if "%op%"=="1" goto limpeza1
if "%op%"=="2" goto limpeza2
if "%op%"=="3" goto otmz
if "%op%"=="4" goto rams
if "%op%"=="5" goto menu2
if "%op%"=="0" goto sair
goto teclaerrada

:teclaerrada
cls
echo.
echo     Ops, tecla errada...
timeout /t 2 >nul
goto menu
::==================================================================================
::==================================================================================

:limpeza1
cls
echo.
echo     EM 5 SEGUNDOS, SERA FEITA UMA LIMPEZA GERAL DE TEMPORARIOS
echo     REMOVENDO APENAS LIXO DO SISTEMA, FIQUE TRANQUILO
echo.
echo                  CTRL+C para cancelar.
echo.
timeout /t 5 /nobreak >nul
if errorlevel 1 (
    echo Operacao cancelada pelo usuario.
    timeout /t 2 >nul
    goto menu
)

cls
echo Limpando arquivos temporarios...

:: Definicao de variaveis de caminho
set "windows=%windir%"
set "systemdrive=%systemdrive%"
set "userprofile=%userprofile%"
set "temp=%temp%"
set "localappdata=%localappdata%"
set "appdata=%appdata%"

echo.
echo Limpando arquivos temporarios do sistema...
call :CleanPath "%windows%\temp\*.*"
call :CleanPath "%windows%\Prefetch\*.*"
call :CleanPath "%systemdrive%\Temp\*.*"
call :CleanPath "%temp%\*.*"
call :CleanPath "%userprofile%\AppData\Local\Temp\*.*"

echo.
echo Limpando historico e cookies...
call :CleanPath "%userprofile%\AppData\Local\Microsoft\Windows\History\*.*"
call :CleanPath "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
call :CleanPath "%userprofile%\AppData\Local\Microsoft\Windows\Recent\*.*"
call :CleanPath "%userprofile%\AppData\Roaming\Microsoft\Windows\Recent\*.*"
call :CleanPath "%userprofile%\AppData\Local\Microsoft\Windows\Cookies\*.*"

echo.
echo Limpando logs do sistema...
call :ClearEventLogs

echo.
echo Removendo arquivos temporarios diversos...
for %%E in (etl log tmp old bak bac bup chk dmp temp) do (
    if exist "%systemdrive%\*.%%E" (
        echo Removendo .%%E
        del /f /s /q "%systemdrive%\*.%%E" >nul 2>&1
    )
)

echo.
echo Limpando cache do Windows Defender...
call :CleanPath "%ProgramData%\Microsoft\Windows Defender\Scans\History\*.*"

echo Limpando logs de atualizacoes...
call :CleanPath "%windir%\SoftwareDistribution\DataStore\Logs\*.*"
call :CleanPath "%windir%\Logs\CBS\*.*"

echo.
echo Executando limpeza do disco (modo silencioso)...
start /wait cleanmgr /sagerun:1 >nul 2>&1

echo.
echo %g%Limpeza basica concluida com sucesso!%w%
timeout /t 3 >nul
goto menu

::==================================================================================
::==================================================================================

:limpeza2
cls
echo.
echo     EM 5 SEGUNDOS, SERA FEITA UMA LIMPEZA COMPLEMENTAR MAIS PROFUNDA
echo     ESTA ACAO PODERA REMOVER ALGUNS DADOS TEMPORARIOS UTEIS...
echo.
echo                  CTRL+C para cancelar.
echo.
timeout /t 5 /nobreak >nul
if errorlevel 1 (
    echo Operacao cancelada pelo usuario.
    timeout /t 2 >nul
    goto menu
)

cls
echo Limpando cache de atualizacoes do Windows...
call :ManageService "wuauserv" "stop"
call :ManageService "bits" "stop"
if exist "%windir%\SoftwareDistribution" (
    rd /s /q "%windir%\SoftwareDistribution" >nul 2>&1
)
call :ManageService "wuauserv" "start" 
call :ManageService "bits" "start"
echo Cache de atualizacoes limpo!

echo.
echo Limpando cache de impressoras...
call :ManageService "spooler" "stop"
call :CleanPath "%windir%\System32\spool\PRINTERS\*.*"
call :ManageService "spooler" "start"
echo Cache de impressoras limpo!

echo.
echo Limpando cache do explorador de arquivos...
call :CleanPath "%localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db"
call :CleanPath "%appdata%\Microsoft\Windows\Recent\*.*"
echo Cache do explorador limpo!

echo.
echo   Limpando Prefetch...
call :ManageService "sysmain" "stop"
call :CleanPath "%systemroot%\Prefetch\*.*"
call :ManageService "sysmain" "start"
echo Prefetch limpo!
echo.
echo %g%Limpeza avancada concluida com sucesso!%w%
timeout /t 3 >nul
goto menu

::==================================================================================
::==================================================================================

:otmz
cls
echo Verificando arquivos corrompidos no Windows...
sfc /scannow
echo.
echo Iniciando reparo da imagem do Windows...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo %g%Verificacao e reparo concluidos!%w%
timeout /t 3 >nul
goto menu

::==================================================================================
::==================================================================================


:rams
cls
echo As memorias rams serao otimizadas...
echo.
set "emptyStandbyList=%~dp0EmptyStandbyList.exe"
if not exist "%emptyStandbyList%" (
    echo [ERRO] O arquivo EmptyStandbyList.exe nao foi encontrado.
    echo Certifique-se de que ele esta na mesma pasta deste script.
    pause
    exit /b
)
echo Limpando o cache de memoria RAM...
"%emptyStandbyList%" workingsets
"%emptyStandbyList%" modifiedpagelist
"%emptyStandbyList%" standbylist
echo.
echo Memoria RAM otimizada com sucesso!
echo.
goto menu

:: =============================================================================
::  MENU SECUNDÁRIO
:: =============================================================================
:menu2
cls
echo.
echo   ------------------------------------------------------------------------
echo.
echo           _   _           _             ____  ____
echo          ^| \ ^| ^|         ^| ^|           ^|  _ \^|  _ \
echo          ^|  \^| ^| ___   __^| ^| ___  ___  ^| ^| \ ^| ^|_) ^|
echo          ^| . ` ^|/ _ \ / _` ^|/ _ \/ __^| ^| ^| ^| ^|  _ ^<
echo          ^| ^|\  ^| ^| ^| ^| ^| ^| ^|  __/\__ \ ^| ^|_/ ^| ^|_) ^|
echo          ^|_^| \_^ \___/ \__,_^ \___/^|___/ ^|____/^|____/
echo.
echo   ------------------------------------------------------------------------
echo.
echo.
echo.
echo       %o%[ 1 ]%neon_vp% +Services.W    %o%[ 2 ]%neon_vp% +Limpar Navegadores    %o%[ 3 ]%neon_vp% +Debloaters
echo.
echo       %o%[ 4 ]%neon_vp% +Avancados demais (%u%Kuidado%o%)
echo.
echo       %w%[ 0 ]%neon_vp% Menu Principal
echo. 
echo. 	                                  
echo.
echo.%gg%
set /p "op=Selecionar:%bb%"
if "%op%"=="1" goto fti
if "%op%"=="2" goto limpeza3
if "%op%"=="3" goto dblnv
if "%op%"=="4" goto avanc1
if "%op%"=="0" goto menu
goto menu2

:: =============================================================================
:: SERVIÇOS DO WINDOWS - ACESSAR
:: =============================================================================
:fti
cls
echo    %b%==========================
echo      Escolha uma opcao:
echo    ==========================
echo.
echo     %o%1. Adaptadores de Rede 
echo     2. Ferramenta de Remocao de Malware 
echo     3. Editor de Diretiva de Grupo
echo     4. Abre o Services do Windows
echo     5. Painel de Controle do Windows
echo     6. Opcoes de desempenho do Windows
echo     7. Abrir o msconfig
echo     8. Limpeza de Disco
echo     9. Gerenciamento Avancado
echo     10. UAC - Controle de Contas
echo     11. Contas de Usuarios
echo     12. Configuracoes Avancadas do Windows
echo     13. Ferramenta de Backup
echo     14. Agendador de Tarefas
echo.
echo         %w%0. Menu anterior%neon_vp%
echo.
echo    %b%===============================================%neon_vp%
echo.%gg%
set /p "choice=Digite sua escolha (de 1 a 14 ou 0 para sair):%bb% "

if /I "%choice%"=="1" start ncpa.cpl
if /I "%choice%"=="2" start mrt.exe
if /I "%choice%"=="3" start gpedit.msc
if /I "%choice%"=="4" start services.msc
if /I "%choice%"=="5" start control.exe
if /I "%choice%"=="6" start SystemPropertiesPerformance.exe
if /I "%choice%"=="7" start msconfig
if /I "%choice%"=="8" start cleanmgr.exe
if /I "%choice%"=="9" start compmgmt.msc
if /I "%choice%"=="10" start UserAccountControlSettings.exe
if /I "%choice%"=="11" start netplwiz
if /I "%choice%"=="12" start SystemPropertiesAdvanced.exe
if /I "%choice%"=="13" start sdclt.exe
if /I "%choice%"=="14" start taskschd.msc
if "%choice%"=="0" goto menu2

echo %r%Opcao invalida! Tente novamente.%w%
pause
goto fti

:: =============================================================================
:: LIMPANDO NAVEGADORES
:: =============================================================================
:dblnv
cls
echo.
echo.
echo.
echo 	 %b%===============================================
echo            DEBLOAT DOS NAVEGADORES e APPS WINDOWS
echo 	 ===============================================
echo.
echo                 %o%[1] do Google Chrome
echo 		[2] do Microsoft Edge
echo 		[3] do Mozilla Firefox
echo 		[4] do Brave
echo 		[5] de TODOS navegadores
echo 		[6] %g%Debloater Apps Windows++
echo.
echo 		%w%[0] Menu anterior
echo.
echo 	 %b%===============================================%neon_vp%
echo.%gg%
set /p "escolha=Escolha uma opcao:%bb% "

if "%escolha%"=="1" goto dchrome
if "%escolha%"=="2" goto dedge
if "%escolha%"=="3" goto dfirefox
if "%escolha%"=="4" goto dbrave
if "%escolha%"=="5" goto dtodos
if "%escolha%"=="6" goto dbapps
if "%escolha%"=="0" goto menu2
goto dblnv

:dchrome
call :DebloatChrome
goto dblnv

:dedge
call :DebloatEdge
goto dblnv

:dfirefox
call :DebloatFirefox
goto dblnv

:dbrave
call :DebloatBrave
goto dblnv

:dtodos
cls
echo Executando debloat em todos os navegadores...
echo.
call :DebloatChrome
call :DebloatEdge
call :DebloatFirefox
call :DebloatBrave
echo.
echo %g%Debloat de todos os navegadores concluido!%w%
pause
goto dblnv

:: =============================================================================
:: REMOVENDOS APPS INUTEIS
:: =============================================================================
:dbapps
cls
echo.
echo.
echo.
echo 	 %b%===============================================
echo         DEBLOATERS DE APPS DO WINDOWS
echo 	 ===============================================
echo.
echo 		%o%[1] Remover Apps inuteis
echo 		[2] Remover Xbox
echo 		[3] Remover Fotos
echo 		[4] Remover Store Windows
echo.
echo 		%w%[0] Menu anterior
echo.
echo 	 %b%===============================================%neon_vp%
echo.%gg%
set /p "escolha=Escolha uma opcao:%bb% "

if "%escolha%"=="1" goto algunss
if "%escolha%"=="2" goto xbox
if "%escolha%"=="3" goto phot
if "%escolha%"=="4" goto stor
if "%escolha%"=="0" goto dblnv
goto dbapps

:algunss
cls
echo %r%REMOVENDO APPS INUTEIS DO WINDOWS...%w%
echo.
call :RemoveWindowsApps
echo.
echo %g%Apps inuteis do Windows removidos.%w%
pause
goto dbapps

:xbox
cls
echo.
echo %r%Removendo o Xbox app do Sistema.%w%
powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage" >nul 2>&1
echo %g%Xbox removido com sucesso.%w%
pause
goto dbapps

:phot
cls
echo.
echo %r%Removendo o Photos app do Sistema.%w%
powershell -Command "Get-AppxPackage *photos* | Remove-AppxPackage" >nul 2>&1
echo %g%Photos removido com sucesso.%w%
pause
goto dbapps

:stor
cls
echo.
echo %r%A Loja App Windows sera removida.%w%
echo.
echo %y%Tem certeza que deseja remover a Loja do Windows?%w%
echo %r%Esta acao e irreversivel!%w%
echo.
echo Pressione qualquer tecla para CONTINUAR ou CTRL+C para CANCELAR
pause >nul
echo.
powershell -Command "Get-AppxPackage *store* | Remove-AppxPackage" >nul 2>&1
echo %g%Loja Windows removida com sucesso.%w%
pause
goto dbapps

:: =============================================================================
:: LIMPEZA DE CACHE DE NAVEGADORES
:: =============================================================================
:limpeza3
cls
echo.
echo.
echo.
echo 	 %b%===============================================
echo                 LIMPEZA DE CACHE DE NAVEGADORES
echo 	 ===============================================
echo.
echo 		%o%[1] Limpar cache do Google Chrome
echo 		[2] Limpar cache do Microsoft Edge
echo 		[3] Limpar cache do Mozilla Firefox
echo 		[4] Limpar cache do Opera
echo 		[5] Limpar cache do Brave
echo 		[6] Limpar TODOS os caches
echo.
echo 		%w%[0] Menu Principal
echo.
echo 	 %b%===============================================%neon_vp%
echo.%gg%
set /p "escolha=Escolha uma opcao:%bb% "

if "%escolha%"=="1" goto chrome
if "%escolha%"=="2" goto edge
if "%escolha%"=="3" goto firefox
if "%escolha%"=="4" goto opera
if "%escolha%"=="5" goto brave
if "%escolha%"=="6" goto todos
if "%escolha%"=="0" goto menu2
goto limpeza3

:chrome
call :CleanBrowser "Google\Chrome\User Data\Default\Cache" "Google Chrome" "chrome.exe"
goto limpeza3

:edge
call :CleanBrowser "Microsoft\Edge\User Data\Default\Cache" "Microsoft Edge" "msedge.exe"
goto limpeza3

:firefox
call :CleanFirefox
goto limpeza3

:opera
call :CleanBrowser "Opera Software\Opera Stable\Cache" "Opera" "opera.exe"
goto limpeza3

:brave
call :CleanBrowser "BraveSoftware\Brave-Browser\User Data\Default\Cache" "Brave" "brave.exe"
goto limpeza3

:todos
cls
echo Limpando cache de todos os navegadores...
echo.
call :CleanBrowser "Google\Chrome\User Data\Default\Cache" "Google Chrome" "chrome.exe"
call :CleanBrowser "Microsoft\Edge\User Data\Default\Cache" "Microsoft Edge" "msedge.exe"
call :CleanFirefox
call :CleanBrowser "Opera Software\Opera Stable\Cache" "Opera" "opera.exe"
call :CleanBrowser "BraveSoftware\Brave-Browser\User Data\Default\Cache" "Brave" "brave.exe"
echo.
echo %g%Limpeza de todos os navegadores concluida!%w%
pause
goto limpeza3


:: =============================================================================
:: FERRAMENTAS AVANÇADAS
:: =============================================================================
:avanc1
cls
echo.
echo.
echo.
echo 	 %b%===============================================
echo           FERRAMENTAS AVANCADAS DEMAIS - CUIDADO
echo 	 ===============================================
echo.
echo 		%o%[1] Desativar Hibernacao
echo 		[2] BIOS pelo CMD
echo 		[3] Infos. completas Sistema e Hardware
echo 		[4] Forcar Reiniciar o PC
echo 		[5] Reiniciar PC em Modo Seguro (Kuidado aki)
echo 		[6] Sair do Modo Seguro (Korrige o acima)
echo 		[7] Restauracao do Sistema (reinicie pressionando SHIFT para isso)
echo 		[8] %g%+ Planos de Energia%o%
echo 		[9] Remover Pontos de Restauracao
echo.
echo 		%w%[0] Menu anterior
echo.
echo 	 %b%===============================================%neon_vp%
echo.%gg%
set /p "escolha=Escolha uma opcao:%bb% "

if "%escolha%"=="1" goto desth
if "%escolha%"=="2" goto bcmd
if "%escolha%"=="3" goto infs
if "%escolha%"=="4" goto restt
if "%escolha%"=="5" goto msegu
if "%escolha%"=="6" goto msegu2
if "%escolha%"=="7" goto reststm
if "%escolha%"=="8" goto penergias
if "%escolha%"=="9" goto rpoints

if "%escolha%"=="0" goto menu2
goto avanc1

:desth
cls
echo Desativando hibernacao...
powercfg.exe /hibernate off
echo %g%Hibernacao desativada.%w%
timeout /t 3 >nul
goto avanc1

:bcmd
cls
echo.
echo    %y%Reiniciando para acessar a BIOS...%w%
echo    O computador sera reiniciado em 10 segundos.
echo.
echo    Pressione CTRL+C para cancelar.
echo.
timeout /t 10 /nobreak >nul
if errorlevel 1 goto avanc1
shutdown /r /fw /t 0
goto avanc1

:infs
cls
echo Abrindo informacoes do sistema...
start msinfo32
timeout /t 3 >nul
goto avanc1

:restt
cls
echo %r%O computador sera reiniciado forçadamente em 10 segundos.%w%
echo Pressione CTRL+C para cancelar.
timeout /t 10 /nobreak >nul
if errorlevel 1 goto avanc1
shutdown /r /f /t 0
goto avanc1

:msegu
cls
echo %y%Reiniciando em Modo Seguro em 10 segundos.%w%
echo Pressione CTRL+C para cancelar.
timeout /t 10 /nobreak >nul
if errorlevel 1 goto avanc1
bcdedit /set {current} safeboot minimal >nul 2>&1
shutdown /r /f /t 0
goto avanc1

:msegu2
cls
echo %y%Reiniciando para sair do Modo Seguro em 10 segundos.%w%
echo Pressione CTRL+C para cancelar.
timeout /t 10 /nobreak >nul
if errorlevel 1 goto avanc1
bcdedit /deletevalue {current} safeboot >nul 2>&1
shutdown /r /f /t 0
goto avanc1

:reststm
cls
echo %y%Abrindo Restauracao do Sistema...%w%
echo.
rstrui.exe
echo.
echo %g%Restauracao do Sistema iniciada.%w%
timeout /t 3 >nul
goto avanc1

:rpoints
cls
echo.
echo.
echo    Quer mesmo remover os Pontos de Restauraco Criados?
echo    Entenda que:
echo     depois desta acao nao sera mais possivel restaurar os pontos antigos.
echo.
echo          Para cancelar esta acao tecle CTRL+C.
echo          Para continuar tecle ENTER.
echo.
echo.
pause
cls
echo.
echo         DELETANDO OS PONTOS DE RESTAURACAO CRIADOS.
vssadmin delete shadows /all /quiet
echo.
echo      JA ERA, AMIGO.
echo      OS PONTOS DE RESTAURACAO DELETADOS.
timeout /t 3 >nul
goto avanc1


:: =============================================================================
::             PLANOS DE ENERGIA
:: =============================================================================
:penergias
cls
echo.
echo.
echo.
echo 	 %b%===============================================
echo           PLANOS DE ENERGIA - OTIMIZACAO DO SISTEMA
echo 	 ===============================================%neon_vp%
echo.
echo 		%o%[1]%neon_vp% Plano Ultra Performance
echo 		%o%[2]%neon_vp% Modo Desempenho Maximo
echo 		%o%[3]%neon_vp% Economia de Energia
echo.
echo 		%r%[9]%neon_vp% Restaurar Planos Padrao do Windows
echo.
echo 		%w%[0] Menu anterior%neon_vp%
echo.
echo 	 %b%===============================================%w%
echo.%gg%
set /p "escolha=Escolha uma opcao:%bb% "

if "%escolha%"=="1" goto ultra
if "%escolha%"=="2" goto Dmaxm
if "%escolha%"=="3" goto econom
if "%escolha%"=="9" goto rpnergs
if "%escolha%"=="0" goto avanc1
goto penergias

:ultra
cls
echo.
echo    %y%Ativando Plano de energia - ULTRA PERFORMANCE%w%
echo    Aplicando configuracoes de alto desempenho...
echo.
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 3ff9831b-6f80-4830-8178-736cd4229e7b >nul 2>&1
powercfg -changename 3ff9831b-6f80-4830-8178-736cd4229e7b "Ultra Performance" "Windows's Ultimate Performance with additional changes." >nul 2>&1
powercfg -s 3ff9831b-6f80-4830-8178-736cd4229e7b >nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFINCPOL 2 >nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFDECPOL 1 >nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFINCTHRESHOLD 10 >nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFDECTHRESHOLD 8 >nul 2>&1
powercfg /setactive scheme_current >nul 2>&1
echo       %g%Plano Ultra Performance ativado com sucesso!%w%
timeout /t 2 >nul
goto penergias

:Dmaxm
cls
echo.
echo    %y%Ativando Modo Desempenho Maximo...%w%
echo.
powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo.
echo      %g%Plano Desempenho Maximo ativado com sucesso!%w%
timeout /t 2 >nul
goto penergias

:econom
cls
echo.
echo    %y%Ativando Economia de Energia...%w%
echo.
powercfg -setactive a1841308-3541-4fab-bc81-f71556f20b4a >nul 2>&1
echo       %g%Plano Economia de Energia ativado com sucesso!%w%
timeout /t 2 >nul
goto penergias

:rpnergs
cls
echo.
echo      %r%RESTAURANDO PLANOS PADRAO DO WINDOWS%w%
echo.
echo    Esta acao removera todos os planos personalizados.
echo.
echo    Pressione CTRL+C para cancelar ou ENTER para continuar...
pause >nul
echo.
powercfg -restoredefaultschemes >nul 2>&1
if errorlevel 1 (
    echo %r%Erro ao restaurar planos padrao!%w%
) else (
    echo %g%Planos padrao do Windows restaurados com sucesso!%w%
)
timeout /t 3 >nul
goto penergias

::==================================================================================
::==================================================================================
:scripty
cls
echo.
echo   %b%"----------------------------------------------------------------------------"%w%
echo              ===-{ ESTA APLICACAO PODE SER DANOSA AO SEU PC } -===
echo.  
echo.  Por este motivo, sera necessario entrar com uma senha de acesso.
echo   Caso vc nao tenha a senha correta, ela e a mesma que abre uma porta no filme Sr. dos Aneis.
echo.
echo   Nao tente chutar uma senha, pois a reacao deste Script podera ser nociva.
echo   Caso nao tenha como conseguir a senha, nao tente mexer no Script, algo pode dar errado.
echo   Somente o ADMN deste app podera acessar e utilizar as ferramentas.
echo.
echo.
echo   %b%"----------------------------------------------------------------------------"%w%
set /p "op=Digite a senha de acesso:%bb%"
if "%op%"=="nodes" goto menu
if "%op%"=="000" goto menuseg
if "%op%"=="amigo" goto menuseg
if "%op%"=="mellon" goto menuseg
goto teclaerrada0
:teclaerrada0
cls
echo.
echo.
echo          %r%A SENHA ESTA INCORRETA.%w%
echo          %r%VC NAO E O ADMN DESTE APP.%w%
echo.
echo             %y%tente novamente, meu amigo.%w%
timeout /t 3 >nul
goto scripty2

:scripty2
cls
echo.
echo.
echo   %b%"----------------------------------------------------------------------------"%w%
echo   %b%"----------------------------------------------------------------------------"%w%
echo              ===-{ RESTA SOMENTE MAIS 1 TENTATIVA APOS ESTA } -===
echo   %b%"----------------------------------------------------------------------------"%w%
echo   %b%"----------------------------------------------------------------------------"%w%
echo.
echo.
set /p "op=Digite a senha de acesso:%bb%"
if "%op%"=="nodes" goto menu
if "%op%"=="000" goto menuseg
if "%op%"=="amigo" goto menuseg
if "%op%"=="mellon" goto menuseg
goto teclaerrada1
:teclaerrada1
cls
echo.
echo.
echo          %r%A SENHA ESTA INCORRETA NOVAMENTE.%w%
echo          %r%VC NAO E MESMO O ADMN DESTE APP.%w%
echo.
echo             %y%tente novamente, meu amigo.%w%
timeout /t 3 >nul
goto scripty3

:scripty3
cls
echo.
echo.
echo   %b%"----------------------------------------------------------------------------"%w%
echo   %b%"----------------------------------------------------------------------------"%w%
echo              ===-{ ULTIMA TENTATIVA DISPONIVEL NESTA VEZ } -===
echo   %b%"----------------------------------------------------------------------------"%w%
echo   %b%"----------------------------------------------------------------------------"%w%
echo.
echo.
set /p "op=Digite a senha de acesso:%bb%"
if "%op%"=="nodes" goto menu
if "%op%"=="000" goto menuseg
if "%op%"=="amigo" goto menuseg
if "%op%"=="mellon" goto menuseg
goto teclaerrada2
:teclaerrada2
cls
echo.
echo.
echo          %r%A SENHA ESTA COM CERTEZA INCORRETA.%w%
echo          %r%VC NAO E DE JEITO DE FORMA ALGUMA O ADMN DESTE APP.%w%
echo.
echo             %y%caindo fora, meu amigo.%w%
timeout /t 3 >nul
goto sair
::==================================================================================
::==================================================================================

:sair
cls
echo.
echo.
echo.
echo.
echo.
echo                         %b%BYE, meu amigo. E ate logo!%w%
timeout /t 3 >nul
exit /b

:: =============================================================================
:: FUNCOES AUXILIARES
:: =============================================================================

:CleanPath
if exist "%~1" (
    del /s /f /q "%~1" >nul 2>&1
)
exit /b

:CleanBrowser
set "browser_path=%~1"
set "browser_name=%~2"
set "process_name=%~3"
taskkill /f /im "%process_name%" >nul 2>&1
timeout /t 1 >nul
if exist "%localappdata%\%browser_path%" (
    rmdir /s /q "%localappdata%\%browser_path%" >nul 2>&1
    echo %g%%browser_name% limpo com sucesso.%w%
) else (
    echo %r%%browser_name% nao encontrado ou ja limpo.%w%
)
exit /b

:CleanFirefox
taskkill /f /im "firefox.exe" >nul 2>&1
set "parentfolder=%appdata%\Mozilla\Firefox\Profiles\"
for /f "tokens=*" %%a in ('dir /b "%parentfolder%" 2^>nul ^| findstr ".*\.default.*"') do (
    call :CleanPath "%parentfolder%%%a\cache2\entries\*.*"
    call :CleanPath "%parentfolder%%%a\startupCache\*.*"
)
echo %g%Firefox limpo com sucesso.%w%
exit /b

:ClearEventLogs
wevtutil el | findstr /i "application system security" >nul && (
    for /f "tokens=*" %%A in ('wevtutil el ^| findstr /i "application system security"') do (
        wevtutil cl "%%A" >nul 2>&1
    )
)
exit /b

:ManageService
set "service=%~1"
set "action=%~2"
if "%action%"=="stop" (
    net stop %service% >nul 2>&1
) else if "%action%"=="start" (
    net start %service% >nul 2>&1
)
exit /b

:DebloatChrome
taskkill /f /im "chrome.exe" >nul 2>&1
taskkill /f /im "GoogleUpdate.exe" >nul 2>&1
net stop gupdate >nul 2>&1
sc config gupdate start= disabled >nul 2>&1
reg delete "HKLM\SOFTWARE\Google\Update" /f >nul 2>&1
echo %g%Chrome desbloatado com sucesso.%w%
exit /b

:DebloatEdge
taskkill /f /im "msedge.exe" >nul 2>&1
call :CleanPath "%localappdata%\Microsoft\Edge\User Data\Default\Cache\*.*"
call :CleanPath "%localappdata%\Microsoft\Edge\User Data\Default\Service Worker\*.*"
echo %g%Edge desbloatado com sucesso.%w%
exit /b

:DebloatFirefox
taskkill /f /im "firefox.exe" >nul 2>&1
taskkill /f /im "maintenanceservice.exe" >nul 2>&1
sc config MozillaMaintenance start= disabled >nul 2>&1
call :CleanPath "%appdata%\Mozilla\Firefox\Profiles\*.default*\cache2\*.*"
echo %g%Firefox desbloatado com sucesso.%w%
exit /b

:DebloatBrave
taskkill /f /im "brave.exe" >nul 2>&1
call :CleanPath "%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\Cache\*.*"
call :CleanPath "%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\Service Worker\*.*"
reg delete "HKLM\SOFTWARE\BraveSoftware" /f >nul 2>&1
echo %g%Brave desbloatado com sucesso.%w%
exit /b

:RemoveWindowsApps
set "apps=Microsoft.Windows.Cortana officehub phone people music messaging maps groove getstarted calendar calculator alarms 3dbuilder camera news onedrive"
(for %%a in (%apps%) do (
    powershell -Command "Get-AppxPackage *%%a* | Remove-AppxPackage" >nul 2>&1
))
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Copilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
exit /b