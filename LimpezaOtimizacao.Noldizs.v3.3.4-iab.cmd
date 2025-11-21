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
echo       %o%[ 4 ]%neon_vp% +Avancados demais (%u%Kuidado%o%)  -   %o%[  ]%neon_vp% +OtmiGusst
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
::==================================================================================
::==================================================================================
:: =============================================================================
::            REMOVER PLANOS DE ENERGIA
:: =============================================================================
:remplan
cls
echo                                      %w%+--------------------+%r%
echo                                      %w%¦%r%%c%aMathyzin PowerClean%r%%w%¦%r%
echo                                      %w%+--------------------+%r%
echo                                        %w%Escolha uma opção:%r%
echo %c%         ------------------------- ------------------------- ------------------------- %r%
echo                                       %g%Feito por aMathyzin%r%
echo. 
echo                        %gr%1-%r% %w%Deletar todos os planos de energia, exceto o ativo.%r%
echo                        %v%2-%r% %w%Restaurar os planos de energia padrões do Windows.%r%
echo.
echo %c%---------------------------------------------+%r%

set /p opcao=%w%Digite sua opção (1 ou 2) e pressione Enter: %r%%c%¦%r%
if "%opcao%"=="1" goto deletarPlanos
if "%opcao%"=="2" goto restaurarPlanos
echo.
echo %v%Opção inválida, tente novamente.%r% && timeout /t 2 >nul
goto remplan

:deletarPlanos
cls
REM Captura o GUID do plano de energia ativo
for /f "tokens=2 delims=:(" %%i in ('powercfg /getactivescheme') do set "activeScheme=%%i"
set activeScheme=!activeScheme:~1,-1!

echo %w%Plano de energia ativo (não será deletado):%r% !activeScheme!

REM Lista todos os planos de energia e deleta um por um, exceto o ativo
for /f "tokens=2 delims=:()" %%i in ('powercfg /list ^| find /v "Power Scheme GUID"') do (
    set "schemeGUID=%%i"
    set schemeGUID=!schemeGUID:~1,-1!
    if not "!schemeGUID!"=="!activeScheme!" (
        echo %v%Deletando o plano de energia:%r% !schemeGUID!
        powercfg /delete !schemeGUID!
    )
)

echo %gr%Todos os planos de energia, exceto o ativo, foram deletados.%r%
timeout /t 3 >nul
cls
goto inicio

:restaurarPlanos
REM Restaura os planos de energia padrão do Windows
powercfg -restoredefaultschemes
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo.
echo.
echo %p% - Planos de energia padrões do Windows restaurados.%r%
timeout /t 3 >nul
cls
goto inicio




::==================================================================================
::==================================================================================
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
::==================================================================================
::==================================================================================
::==================================================================================
::==================================================================================











:otmiguss
:menuwindows
cls
set "ESC="
cls
echo(
set "lines[0]=      =============================================================================="
set "lines[1]=                                OTIMIZAÇÃO DE WINDOWS"
set "lines[2]=      =============================================================================="

for /L %%j in (0,1,82) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,2) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                          Escolha a opção que você quer otimizar:
echo.
echo                                 %o%[ %o%0 %o%]%o% Usar todas opções!%w%
echo.
echo        %o%[ %b%1 %o%]%w% Otimizar Energia                %o%[ %b%2 %o%]%w% Desat. Efeitos Visuais
echo.
echo        %o%[ %b%3 %o%]%w% Tweaks de Privacidade           %o%[ %b%4 %o%]%w% Desat. tarefas e serviços de Telemetria
echo.
echo        %o%[ %b%5 %o%]%w% Desative TOTALMENTE a XBOX      %o%[ %b%6 %o%]%w% Desativar Relatórios de Erro
echo.
echo        %o%[ %b%7 %o%]%w% Otimizar ALT +TAB               %o%[ %b%8 %o%]%w% Desat. Relógio do Windows
echo.
echo        %o%[ %b%9 %o%]%w% Desative Serviços Inúteis       %o%[ %b%10 %o%]%w% Desat. Hibernação
echo.
echo        %o%[ %b%11 %o%]%w% Otimizar Explorer              %o%[ %b%12 %o%]%w% Desativar Indexação de arquivos 
echo.
echo        %o%[ %b%13 %o%]%w% Debloater                      %o%[ %b%14 %o%]%w% Desativar Notificações
echo.   
echo        %o%[ %b%15 %o%]%w% Desativar Cortana              %o%[ %b%16 %o%]%w% Bloquear Envio de feedback automático
echo.      
echo        %o%[ %b%17 %o%]%w% Desativar SmartScreen          %o%[ %b%18 %o%]%w% Desativar Overlays (Steam/Xbox/)
echo.
echo        %o%[ %b%19 %o%]%w% Otimizar rede para jogos       %o%[ %b%20 %o%]%w% Resetar Cache de Miniaturas
echo.
echo        %o%[ %b%21 %o%]%w% Desativar Cortana              %o%[ %b%22 %o%]%w% Desat. Prefetch e Superfetch
echo.
echo        %o%[ %b%23 %o%]%w% Fechar Explorer                %o%[ %b%24 %o%]%w% Iniciar Explorer
echo.
echo        %o%[ %b%25 %o%]%w% Desat. UAC                     %o%[ %b%26 %o%]%w% Desativar Hyper-V
echo.
echo        %o%[ %b%27 %o%]%w% Verificar/Arrumar arquivos     %o%[ %b%28 %o%]%w% Configurar um melhor DNS
echo.
echo        %o%[ %b%29 %o%]%w% Limpar Cache de Rede           %o%[ %b%30 %o%]%w% Arrumar Windows
echo.
echo        %o%[ %b%31 %o%]%w% Atualizar Drivers              %o%[ %b%32 %o%]%w% Limpar Arquivos Temporários  
echo.
echo        %o%[ %b%33 %o%]%w% Desat. Anti-Malware            %o%[ %b%34 %o%]%w% Desat. Download Maps Manager               
echo.
echo        %o%[ %b%35 %o%]%w% Desat. TimeStamp               %o%[ %b%36 %o%]%w% Desat. Aero Peek   
echo.
echo        %o%[ %b%37 %o%]%w% REINICIAR PC                   %o%[ %o%38 %o%]%o% Menu Principal%w%
echo. 
 
echo.
set /p opcao="Digite o número: "
cls

if "%opcao%"=="0" goto confirmar_tudo
if %opcao% equ 38 goto menu
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7
if %opcao% equ 8 goto opcao8
if %opcao% equ 9 goto opcao9
if %opcao% equ 10 goto opcao10
if %opcao% equ 11 goto opcao11
if %opcao% equ 12 goto opcao12
if %opcao% equ 13 goto opcao13
if %opcao% equ 14 goto opcao14
if %opcao% equ 15 goto opcao15
if %opcao% equ 16 goto opcao16
if %opcao% equ 17 goto opcao17
if %opcao% equ 18 goto opcao18
if %opcao% equ 19 goto opcao19
if %opcao% equ 20 goto opcao20
if %opcao% equ 21 goto opcao21
if %opcao% equ 22 goto opcao22
if %opcao% equ 23 goto opcao23
if %opcao% equ 24 goto opcao24
if %opcao% equ 25 goto opcao25
if %opcao% equ 26 goto opcao26
if %opcao% equ 27 goto opcao27
if %opcao% equ 28 goto opcao28
if %opcao% equ 29 goto opcao29
if %opcao% equ 30 goto opcao30
if %opcao% equ 31 goto opcao31
if %opcao% equ 32 goto opcao32
if %opcao% equ 33 goto opcao33
if %opcao% equ 34 goto opcao34
if %opcao% equ 35 goto opcao35
if %opcao% equ 36 goto opcao36
if %opcao% equ 37 goto opcao37

goto :menuwindows

:opcao1
cls
echo Otimizando Energia...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg.exe /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IdleDisable 0
powercfg.exe /setactive SCHEME_CURRENT
powercfg.cpl
pause
cls
goto :menuwindows

:opcao2
cls
echo Desativar Efeitos Visuais...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f
reg add "HKCU\Control Panel\Desktop" /v VisualFXSetting /t REG_DWORD /d 2 /f
pause
cls
goto :menuwindows

:opcao3
cls
echo Aplicando Tweaks de Privacidade...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v PeriodInNanoSeconds /t REG_QWORD /d 0 /f
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1
sc config DiagTrack start= disabled
sc stop DiagTrack
sc config dmwappushservice start= disabled
sc stop dmwappushservice
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338387Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353694Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353696Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_Recommendations /t REG_DWORD /d 0 /f

Echo Otimização de Tweaks de Privacidade feita com sucesso!
pause
cls
goto:menuwindows

:opcao4
cls
echo Otimizando privacidade de tarefas e serviços de Telemetria...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowAppDataCollection" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisableWindowsAdvertising" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableMicrosoftConsumerExperience" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d 1 /f
Echo Telemetria e configurações de privacidade desativadas com sucesso!
pause
cls
goto :menuwindows

:opcao5
cls
echo ===========================================
echo     MENU DE OTIMIZACAO DO PC - -iGust
echo ===========================================
echo.
echo [1] Iniciar Otimizacao (Remover Xbox)
echo [2] Reverter Otimizacao (Restaurar Xbox)
echo %o%[3] Voltar ao Menu Principal%w%
echo.
set /p escolha=Digite a opcao desejada: 
cls
if "%escolha%"=="1" goto OTIMIZAR
if "%escolha%"=="2" goto REVERTER
if "%escolha%"=="3" goto :menuwindows
goto :opcao5

:OTIMIZAR
cls
echo Iniciando otimizacao...

sc stop "Xbox Game Monitoring"
sc config "Xbox Game Monitoring" start= disabled
sc stop "GamingServices"
sc config "GamingServices" start= disabled
sc stop "GamingServicesNet"
sc config "GamingServicesNet" start= disabled
powershell -command "Get-AppxPackage *xboxapp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *xboxgamemode* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.GamingServices* | Remove-AppxPackage"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowAppDataCollection" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisableWindowsAdvertising" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableMicrosoftConsumerExperience" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d 1 /f
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc stop wuauserv
sc config wuauserv start= disabled
sc stop dosvc
sc config dosvc start= disabled
echo.
echo Otimizacao concluida!
pause
goto REINICIAR

:REVERTER
cls
echo Revertendo otimizacoes...

sc config "Xbox Game Monitoring" start= demand
sc config "GamingServices" start= demand
sc config "GamingServicesNet" start= demand
sc config "XblAuthManager" start= demand
sc config "XboxNetApiSvc" start= demand
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameBar" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowAppDataCollection" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /f
sc config DiagTrack start= auto
sc start DiagTrack
sc config dmwappushservice start= demand
sc config wuauserv start= auto
sc start wuauserv
sc config dosvc start= demand
echo.
echo Reversao concluida!
pause
goto REINICIAR

:REINICIAR
cls
echo.
echo Deseja reiniciar o computador agora para aplicar as alteracoes? (S/N)
set /p resp=

if /i "%resp%"=="S" (
    echo Reiniciando...
    shutdown /r /t 5
) else (
    echo Nao reiniciado. Volte para o menu principal.
    pause
    goto :menuwindows
)

pause
cls
goto :menuwindows

:opcao6
cls
echo Desativando Relatórios de erro do windows...
sc stop "WerSvc"
sc config "WerSvc" start= disabled
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ErrorReporting" /v "DontSendAdditionalData" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ErrorReporting" /v "Disabled" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DisableWindowsErrorReporting" /t REG_DWORD /d 1 /f
Echo Relatórios de Erros do Windows desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao7
cls
echo ====================================
echo      OPCOES ALT + TAB -iGust
echo ====================================
echo.
echo 1 - Otimizar ALT + TAB
echo 2 - Reverter ALT + TAB
echo %o%3 - Voltar para o menu principal%w%
echo.
set /p escolhaAltTab=Digite a opcao desejada: 
cls
if "%escolhaAltTab%"=="1" goto :otimizarAltTab
if "%escolhaAltTab%"=="2" goto :reverterAltTab
if "%escolhaAltTab%"=="3" goto :menuwindows
goto :opcao7

:otimizarAltTab
cls
echo Otimizando ALT + TAB...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v AltTabSettings /t REG_DWORD /D 1 /f
echo Reiniciando Windows Explorer...
taskkill /f /im explorer.exe >nul
timeout /t 2 /nobreak >nul
start explorer.exe
echo ALT + TAB otimizado com sucesso!
pause
goto :opcao7

:reverterAltTab
cls
echo Revertendo ALT + TAB para o padrao...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v AltTabSettings /f
echo Reiniciando Windows Explorer...
taskkill /f /im explorer.exe >nul
timeout /t 2 /nobreak >nul
start explorer.exe
echo ALT + TAB revertido com sucesso!
pause
goto :opcao7


:opcao8
cls
echo Otimizando Relógio do Windows...
net stop w32time >nul 2>&1
sc config w32time start= disabled
bcdedit /deletevalue useplatformclock >nul 2>&1
pause
cls
goto :menuwindows

:opcao9
cls
echo =============================================
echo     OTIMIZADOR DE SERVIÇOS WINDOWS-iGust
echo =============================================
echo.
echo  [1] Desativar Serviços
echo  [2] Reverter Otimização
echo  %o%[3] Voltar ao Menu Principal%w%
echo.
set /p opcao=Digite a opcao desejada: 
cls

if "%opcao%"=="1" goto OTIMIZAR
if "%opcao%"=="2" goto REVERTER
if "%opcao%"=="3" goto :menuwindows

goto :opcao9

:OTIMIZAR
echo Iniciando Otimização...
sc stop Spooler
sc config Spooler start= disabled
sc stop wisvc
sc config wisvc start= disabled
sc stop WerSvc
sc config WerSvc start= disabled
sc stop WbioSrvc
sc config WbioSrvc start= disabled
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc stop wuauserv
sc config wuauserv start= disabled
sc stop dosvc
sc config dosvc start= disabled
echo.
echo Otimizacao concluida!
pause
goto :opcao9

:REVERTER
echo Revertendo Otimizacao...
sc config Spooler start= auto
sc start Spooler
sc config wisvc start= demand
sc config WerSvc start= demand
sc start WerSvc
sc config WbioSrvc start= demand
sc start WbioSrvc
sc config DiagTrack start= demand
sc start DiagTrack
sc config dmwappushservice start= demand
sc start dmwappushservice
sc config wuauserv start= auto
sc start wuauserv
sc config dosvc start= demand
sc start dosvc
echo.
echo Reversao concluida!
pause
goto :opcao9

:opcao10
cls
echo Desativando Hibernação...
powercfg -h off
pause
cls
goto :menuwindows

:opcao11
cls
echo ============================================
echo     OTIMIZAR PRIORIDADE DO EXPLORADOR
echo ============================================
echo [1] Aumentar prioridade do explorer.exe (apenas para pc que o windows trava, não recomendo para quem joga)
echo [2] Reverter prioridade para o padrao
echo %o%[0] Voltar%w%
echo.

set /p escolha=Digite sua opcao: 
cls

if "%escolha%"=="1" goto AUMENTAR
if "%escolha%"=="2" goto REVERTER
if "%escolha%"=="0" goto :menuwindows
goto :opcao11

:AUMENTAR
echo.
echo Definindo prioridade do explorer.exe para ALTA...
wmic process where name="explorer.exe" CALL setpriority 13 >nul
echo Prioridade aumentada com sucesso!
pause
goto :opcao11
cls

:REVERTER
echo.
echo Revertendo prioridade do explorer.exe para NORMAL...
wmic process where name="explorer.exe" CALL setpriority 8 >nul
echo Prioridade revertida com sucesso!
pause
goto :opcao11
cls
goto :menuwindows

:opcao12
cls
echo Desativando Indxação de Arquivos...
net stop "Windows Search" >nul 2>&1
sc config "WSearch" start= disabled >nul 2>&1
pause
cls
goto :menuwindows


:opcao13
cls
echo ===========================================
echo        REMOVER OU REINSTALAR APPS PADRÃO
echo ===========================================
echo [1] Remover apps padrão e Desativar Copilot, OfficeHub e outros recursos.
echo [2] Reinstalar apps padrão do Windows
echo %o%[3] Voltar ao menu principal%w%
echo.

set /p opcao=Escolha uma opção: 
cls

if "%opcao%"=="1" goto REMOVER
if "%opcao%"=="2" goto REINSTALAR
if "%opcao%"=="3" goto :menuwindows
goto :opcao13

:REMOVER
cls
echo Removendo apps padrão do Windows...

:: Removendo apps específicos com tratamento de erro
powershell -Command "Get-AppxPackage *Microsoft.Windows.Cortana* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *officehub* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *phone* | Remove-AppxPackage -ErrorAction SilentlyContinue"
:: powershell -Command "Get-AppxPackage *people* | Remove-AppxPackage -ErrorAction SilentlyContinue"
:: *people* (PeopleExperienceHost) é protegido pelo sistema e não pode ser removido normalmente
powershell -Command "Get-AppxPackage *messaging* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *maps* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *groove* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *calendar* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *alarms* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *news* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *onedrive* | Remove-AppxPackage -ErrorAction SilentlyContinue"

:: Tweaks de interface
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Copilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideCopilotButton /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f

echo.
echo Apps removidos com sucesso!
pause
goto :opcao13

:REINSTALAR
cls
echo Reinstalando apps padrão do Windows...

powershell -Command "Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml'}"

:: Ativando Copilot e Cortana novamente
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 1 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Copilot" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideCopilotButton /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 1 /f

echo.
echo Reinstalação concluída!
pause
cls
goto :opcao13

:opcao14
cls
echo Desativando Notificações do Sistema...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f
pause
cls
goto :menuwindows

:opcao15
cls
echo Desativando Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
echo Cortana Desativada!
pause
cls
goto :menuwindows

:opcao16
cls
echo Bloqueando Envio de feedback Automático
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v PeriodInDays /t REG_DWORD /d 0 /f
echo Bloqueado com Sucesso!
pause
cls
goto :menuwindows

:opcao17
cls
echo Desativando SmartScreen
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Off /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v ScanWithAntiVirus /t REG_DWORD /d 1 /f
echo SmartScreen Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao18
cls
echo ============================================
echo         OTIMIZAR OU REVERTER OVERLAYS
echo ============================================
echo.
echo 1 - Desativar Overlays (Game Bar e Game Mode)
echo 2 - Reverter Overlays ao Padrão
echo %o%3 - Voltar ao Menu Principal%w%
echo.
set /p escolha_overlay="Escolha uma opcao: "
cls

if "%escolha_overlay%"=="1" goto desativar_overlay
if "%escolha_overlay%"=="2" goto reverter_overlay
if "%escolha_overlay%"=="3" goto :menuwindows

:desativar_overlay
cls
echo Desativando Overlays...
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d 0 /f
echo Overlays desativados com sucesso!
pause
goto :menu

:reverter_overlay
cls
echo Reativando Overlays...
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d 1 /f
echo Overlays reativados com sucesso!
pause
cls
goto :menuwindows

:opcao19
cls
echo ============================================
echo     OTIMIZAR/REVERTER CONFIGURACOES DE REDE
echo ============================================
echo [1] Otimizar rede para jogos (Low latency)
echo [2] Reverter configurações de rede para o padrão
echo %o%[3] Voltar ao Menu Principal%w%
echo.

set /p escolha=Digite sua opcao: 
cls

if "%escolha%"=="1" goto OTIMIZAR
if "%escolha%"=="2" goto REVERTER
if "%escolha%"=="3" goto :menuwindows
goto :opcao19

:OTIMIZAR
echo.
echo Otimizando configuracao da rede para baixa latencia...
netsh interface tcp set global autotuninglevel=normal
netsh interface tcp set global rss=enabled
netsh interface tcp set global chimney=disabled
netsh int tcp set heuristics disabled
echo Configurações de rede otimizadas para jogos com baixa latência!
pause

goto :opcao19

:REVERTER
echo.
echo Revertendo as configuracoes de rede para o padrao...
netsh interface tcp set global autotuninglevel=restricted
netsh interface tcp set global rss=disabled
netsh interface tcp set global chimney=enabled
netsh int tcp set heuristics enabled
echo Configurações de rede revertidas para o padrão!
pause
goto :opcao19
cls
goto :menuwindows

:opcao20
cls
Echo Resetando Cache de miniaturas...
taskkill /f /im explorer.exe
echo Reiniciando Windows Explorer...
del /f /s /q %LocalAppData%\Microsoft\Windows\Explorer\iconcache*
del /f /s /q %LocalAppData%\Microsoft\Windows\Explorer\thumbcache*
start explorer.exe
echo Concluido!
pause
cls
goto :menuwindows

:opcao21
cls
echo Desativando Cortana...
powershell -Command "Get-AppxPackage Microsoft.549981C3F5F10 | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -AllUsers Microsoft.549981C3F5F10 | Remove-AppxPackage"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
echo Cortana Desativada com Sucesso!
pause
cls
goto :menuwindows

:opcao22
cls
echo Desativando Prefetch e Superfetch (Sysman)...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
echo  Desativado com Sucesso!
pause
cls

:opcao23
cls
Echo Fechando Windows Explorer...
taskkill /f /im explorer.exe
echo Concluido!
pause
cls
goto :menuwindows

:opcao24
cls
echo Iniciando Windows Explorer...
start explorer.exe
echo Concluido!
pause
cls
goto :menuwindows

:opcao25
cls
echo Desativando UAC...
sfc /scannow
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao26
cls
echo Desativando Hyper-V...
dism /Online /Disable-Feature:Microsoft-Hyper-V-All /NoRestart
bcdedit /set hypervisorlaunchtype off
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao27
cls
echo Arrumando Windows/Verificando arquivos...
chkdsk C: /F /R
Echo Windows Arrumado com Sucesso!
pause
cls
goto :menuwindows

:opcao28
cls
echo Iniciando DnsJumper...
start "" "%~dp0DnsJumper.exe"
Echo programa iniciado com sucesso!
pause
cls
goto :menuwindows

:opcao29
cls
echo Limpando Cache de rede...
ipconfig /release
ipconfig /renew
ipconfig /flushdns
nbtstat -R
nbtstat -RR
arp -d *
netsh winsock reset
netsh int ip reset
Echo Cache Limpo com Sucesso!
pause
cls
goto :menuwindows

:opcao30
cls
echo Arrumando Windows...
echo Aguarde, isso pode levar um certo tempo!
sfc /scannow
dism /online /cleanup-image /restorehealth
Echo Windows Arrumado com Sucesso!
pause
cls
goto :menuwindows

:opcao31
cls
echo Iniciando Programa...
start "" "%~dp0driver.exe"
Echo Programa com Sucesso!
pause
cls
goto :menuwindows


:opcao32
cls
echo Limpando arquivos temporários do Windows...
set "windows=%windir%"
set "systemdrive=%systemdrive%"
set "userprofile=%userprofile%"
set "temp=%temp%"
set "history=%userprofile%\Local Settings\History"
set "cookies=%userprofile%\Cookies"
set "recent=%userprofile%\Recent"
set "printers=%systemroot%\system32\spool\printers"

if exist "%windows%\temp\" del /s /f /q "%windows%\temp\*.*" 2>nul
if exist "%windows%\Prefetch\" del /s /f /q "%windows%\Prefetch\*.exe" 2>nul
if exist "%windows%\Prefetch\" del /s /f /q "%windows%\Prefetch\*.dll" 2>nul
if exist "%windows%\Prefetch\" del /s /f /q "%windows%\Prefetch\*.pf" 2>nul
if exist "%windows%\system32\dllcache\" del /s /f /q "%windows%\system32\dllcache\*.*" 2>nul
if exist "%systemdrive%\Temp\" del /s /f /q "%systemdrive%\Temp\*.*" 2>nul
if exist "%temp%\" del /s /f /q "%temp%\*.*" 2>nul
if exist "%history%\" del /s /f /q "%history%\*.*" 2>nul
if exist "%userprofile%\Local Settings\Temporary Internet Files\" del /s /f /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" 2>nul
if exist "%userprofile%\Local Settings\Temp\" del /s /f /q "%userprofile%\Local Settings\Temp\*.*" 2>nul
if exist "%recent%\" del /s /f /q "%recent%\*.*" 2>nul
if exist "%cookies%\" del /s /f /q "%cookies%\*.*" 2>nul

echo Limpando registros de eventos...
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin

for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")

goto afterClear

:do_clear
echo Limpando %1...
wevtutil.exe cl %1
goto :eof

:noAdmin
echo [ERRO]: Execute este script como administrador.
pause
exit /b

:afterClear
cleanmgr.exe
echo Bomba limpada com sucesso!
pause
cls
goto :menuwindows

:opcao33
cls
echo Desativando Windows Defender (Incluindo Anti-Malware Executables)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdboot" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdfilter" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdnisdrv" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mssecflt" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v DisableEnhancedNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotification /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotificationOnLockScreen /t REG_DWORD /d 1 /f
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao34
cls
echo Desativando Download Maps Manager...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v Start /t REG_DWORD /d 4 /f
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao35
cls
echo Desativando TimeStamp...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 1 /f
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao36
cls
echo Desativando Aero Peek...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao37
cls
echo Reiniciar pc...
echo Deseja reiniciar o PC agora?
echo.
echo [1] Sim
echo [2] Nao
echo.
set /p resposta=Digite o numero da opcao: 

if "%resposta%"=="1" (
    echo Reiniciando o PC...
    shutdown /r /t 5
) else (
    echo Reinicio cancelado.
)

pause
cls
goto :menuwindows

:opcao38
cls
goto :menu


::==================================================================================
::==================================================================================
:prioridadegames
cls
set "ESC="
cls
echo(
set "lines[0]=      =============================================================================="
set "lines[1]=                             AUMENTAR PRIORIDADE NOS GAMES"
set "lines[2]=      =============================================================================="

for /L %%j in (0,1,82) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,2) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                          Escolha o jogo que voce quer priorizar:
echo.
echo        %o%[ %b%1 %o%]%w% Fortnite                             %o%[ %b%2 %o%]%w% Gta V
echo.
echo        %o%[ %b%3 %o%]%w% FiveM                                %o%[ %b%4 %o%]%w% CS2
echo.
echo        %o%[ %b%5 %o%]%w% Minecraft                            %o%[ %b%6 %o%]%w% Valorant
echo.
echo        %o%[ %b%7 %o%]%w% League of Legends                    %o%[ %b%8 %o%]%w% Warzone
echo.
echo        %o%[ %b%9 %o%]%w% Apex Legends                         %o%[ %b%10 %o%]%w% Roblox
echo.
echo        %o%[ %b%11 %o%]%w% God Of War (2018 e ragnarok)        %o%[ %b%12 %o%]%w% MTA 
echo.
echo        %o%[ %b%13 %o%]%w% Euro Truck Simulator (1 e 2)        %o%[ %b%14 %o%]%w% Tom Clancy's Rainbow Six Siege
echo.   
echo        %o%[ %b%15 %o%]%w% Cult of the Lamb                    %o%[ %b%16 %o%]%w% ULTRAKILL
echo.      
echo        %o%[ %b%17 %o%]%w% Blood Strike                        %o%[ %b%18 %o%]%w% Arena Breakout
echo.    
echo        %o%[ %b%19 %o%]%w% Resident Evil 4 Remake              %o%[ %b%20 %o%]%w% Resident Evil 2 Remake
echo.    
echo        %o%[ %b%21 %o%]%w% Resident Evil Village               %o%[ %b%22 %o%]%w% Free Fire + Bluestacks
echo.    
echo        %o%[ %b%23 %o%]%w% Battlefield 2042                    %o%[ %b%24 %o%]%w% Battlefield 4
echo.    
echo        %o%[ %b%25 %o%]%w% The last Of US 1 e 2                %o%[ %b%26 %o%]%w% PUBG
echo.
echo        %o%[ %b%27 %o%]%w% Rocket League                       %o%[ %b%28 %o%]%w% Cyberpunk 2077
echo.
echo        %o%[ %b%29 %o%]%w% Terraria                            %o%[ %b%30 %o%]%w% Red Dead Redemption 2
echo.
echo        %o%[ %b%31 %o%]%w% Entre no Discord e sugira jogos!     %o%[ %o%32 %o%]%o% Voltar ao Menu Principal%w%
echo.
echo                         %o%[ %o%33%o% ]%o% REVERTA AO PADRÃO DO WINDOWS%w%    
echo.
set /p jogo="Digite o numero: "
cls
if "%jogo%"=="1" goto priorizar_fortnite
if "%jogo%"=="2" goto priorizar_gtav
if "%jogo%"=="3" goto priorizar_fivem
if "%jogo%"=="4" goto priorizar_cs2
if "%jogo%"=="5" goto priorizar_minecraft
if "%jogo%"=="6" goto priorizar_valorant
if "%jogo%"=="7" goto priorizar_lol
if "%jogo%"=="8" goto priorizar_warzone
if "%jogo%"=="9" goto priorizar_apex
if "%jogo%"=="10" goto priorizar_roblox
if "%jogo%"=="11" goto priorizar_gow
if "%jogo%"=="12" goto priorizar_mta
if "%jogo%"=="13" goto priorizar_ets
if "%jogo%"=="14" goto priorizar_r6
if "%jogo%"=="15" goto priorizar_cult
if "%jogo%"=="16" goto priorizar_ultrakill
if "%jogo%"=="17" goto priorizar_bloodstrike
if "%jogo%"=="18" goto priorizar_arenabreakout
if "%jogo%"=="19" goto priorizar_residentevil4remake
if "%jogo%"=="20" goto priorizar_residentevil2remake
if "%jogo%"=="21" goto priorizar_residentevilvillage
if "%jogo%"=="22" goto priorizar_freefire
if "%jogo%"=="23" goto priorizar_battlefield2042
if "%jogo%"=="24" goto priorizar_battlefield4
if "%jogo%"=="25" goto priorizar_tlol
if "%jogo%"=="26" goto priorizar_pubg
if "%jogo%"=="27" goto priorizar_rocketleague
if "%jogo%"=="28" goto priorizar_cyberpunk
if "%jogo%"=="29" goto priorizar_terraria
if "%jogo%"=="30" goto priorizar_rdr2
if "%jogo%"=="31" start https://discord.gg/UufDNqWQ8j & goto opcao3
if "%jogo%"=="32" goto menu
if "%jogo%"=="33" goto reverterjogos
cls
goto :prioridadegames

:priorizar_fortnite
echo Aumentando prioridade do Fortnite...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_gtav
echo Aumentando prioridade do GTA V...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_fivem
echo Aumentando prioridade do FiveM...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_cs2
echo Aumentando prioridade do CS2...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_minecraft
echo Aumentando prioridade do Minecraft...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_valorant
echo Aumentando prioridade do Valorant...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_lol
echo Aumentando prioridade do League of Legends...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LeagueClient.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LeagueClient.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LeagueClient.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_warzone
echo Aumentando prioridade do Warzone...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_apex
echo Aumentando prioridade do Apex Legends...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_roblox
echo Aumentando prioridade do Roblox...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_gow
echo Aumentando prioridade do God of War...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoW.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoW.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoW.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_gow_ragnarok
echo Aumentando prioridade do God of War Ragnarok...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoWRagnarok.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoWRagnarok.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoWRagnarok.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_mta
echo Aumentando prioridade do MTA: San Andreas...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Multi Theft Auto.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Multi Theft Auto.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Multi Theft Auto.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gta_sa.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gta_sa.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gta_sa.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_ets1
echo Aumentando prioridade do Euro Truck Simulator 1...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_ets2
echo Aumentando prioridade do Euro Truck Simulator 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ets2.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ets2.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ets2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_r6
echo Aumentando prioridade do Rainbow Six Siege...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_cult
echo Aumentando prioridade do Cult Of the Lamb...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_ultrakill
echo Aumentando prioridade do Ultrakill...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_bloodstrike
echo Aumentando prioridade do BloodStrike...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_arenabreakout
echo Aumentando prioridade do Arena Breakout...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_residentevil4remake
echo Aumentando prioridade do Resident Evil 4 Remake...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_residentevil2remake
echo Aumentando prioridade do Resident Evil 2 Remake...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_residentevilvillage
echo Aumentando prioridade do Resident Evil Village...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames


:priorizar_freefire
echo Aumentando prioridade do Free Fire...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_battlefield2042
echo Aumentando prioridade do Battlefield 2042...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_battlefield4
echo Aumentando prioridade do Battlefield 4...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
Echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_tlou1
echo Aumentando prioridade do The Last of Us Part I & II...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_pubg
echo Aumentando prioridade do PUBG...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_rocketleague
echo Aumentando prioridade do Rocket League...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_cyberpunk
echo Aumentando prioridade do Cyberpunk 2077...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_terraria
echo Aumentando prioridade do Terraria...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_rdr2
echo Aumentando prioridade do Red Dead Redemption 2...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:reverterjogos
echo Revertendo prioridade dos jogos ao padrão do windows...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LeagueClient.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoW.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoWRagnarok.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Multi Theft Auto.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gta_sa.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ets2.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe" /f
Echo Revertido com Sucesso!
pause
goto :prioridadegames

::==================================================================================
::==================================================================================
:perifericos
cls
set "ESC="
cls
echo(
set "lines[0]=      =============================================================================="
set "lines[1]=                                OTIMIZAÇÃO DE PERIFÉRICOS"
set "lines[2]=      =============================================================================="

for /L %%j in (0,1,82) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,2) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                          Escolha a opção que você quer otimizar:
echo.
echo            %o%[ %b%1 %o%]%w% Otimizar HDD                    %o%[ %b%2 %o%]%w% Otimizar SSD
echo.
echo            %o%[ %b%3 %o%]%w% Verificar Temperatura           %o%[ %b%4 %o%]%w% Otimizar inputlag/monitor
echo.
echo            %o%[ %b%5 %o%]%w% Otimizar Teclado                %o%[ %b%6 %o%]%w% Otimizar Mouse
echo.
echo            %o%[ %b%7 %o%]%w% REVERTER OTIMIZAÇÃO             %o%[ %o%8 %o%]%o% Voltar ao Menu Principal%w%
echo. 
echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto reverterperifericos
if %opcao% equ 8 goto menu

goto perifericos

:opcao1
cls
echo Otimizando HDD...
fsutil behavior set disableLastAccess 2
fsutil behavior set disable8dot3 0
dfrgui.exe
echo Otimizado com sucesso!
pause
cls
goto perifericos

:opcao2
cls
echo Otimizando SSD...
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Disable
fsutil behavior set disableLastAccess 0
fsutil behavior set disable8dot3 1
cleanmgr.exe
echo Otimizado com sucesso!
pause
cls
goto perifericos

:opcao3
cls
echo Iniciando programa...
start "" "%~dp0OpenHardwareMonitor.exe"
pause
cls
goto perifericos

:opcao4
cls
echo Reduzindo inputlag/otimizando monitor...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundLockTimeout /t REG_DWORD /d 0 /f
bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /set disabledynamictick yes
pause
cls
goto perifericos


:opcao5
cls
echo Iniciando programa e otimizações...
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f
start "" "%~dp0FilterKeysSetter.exe"
pause
cls
goto perifericos

:opcao6
cls
echo Otimizando Mouse...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v MouseTrails /t REG_SZ /d 0 /f
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True
echo Mouse otimizado com sucesso!
pause
cls
goto perifericos

:reverterperifericos
cls
echo ===============================================
echo      REVERTER OTIMIZAÇÕES - iGust
echo ===============================================
echo.
echo %o%[0] Voltar%w%
echo [1] Reverter Otimização do Mouse
echo [2] Reverter Otimização do Teclado
echo [3] Reverter Input Lag / Monitor
echo [4] Reverter SSD
echo [5] Reverter HDD
echo [6] Reverter TODOS
echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto revert_mouse
if %opcao% equ 2 goto revert_teclado
if %opcao% equ 3 goto revert_inputlag
if %opcao% equ 4 goto revert_ssd
if %opcao% equ 5 goto revert_hdd
if %opcao% equ 6 goto reverter_tudo
if %opcao% equ 0 goto perifericos
goto reverterperifericos

:revert_mouse
cls
echo Revertendo mouse para configuracoes padrão...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 1 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 6 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 10 /f
reg add "HKCU\Control Panel\Desktop" /v MouseTrails /t REG_SZ /d -1 /f
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True
echo Mouse restaurado.
pause
goto reverterperifericos

:revert_teclado
cls
echo Revertendo teclado para configuracoes padrão...
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 1 /f
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 20 /f
echo Teclado restaurado.
pause
goto reverterperifericos

:revert_inputlag
cls
echo Revertendo inputlag/monitor para padrão...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 400 /f
reg delete "HKCU\Control Panel\Desktop" /v ForegroundLockTimeout /f >nul 2>&1
bcdedit /deletevalue disabledynamictick >nul 2>&1
:: Não reativa o useplatformclock pois depende se estava ativo ou não antes
echo Configurações visuais e de boot revertidas.
pause
goto reverterperifericos

:revert_ssd
cls
echo Reativando tarefas de otimizacao de SSD...
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Enable
fsutil behavior set disableLastAccess 1
fsutil behavior set disable8dot3 2
echo  Configurações para SSD restauradas.
pause
goto reverterperifericos

:revert_hdd
cls
echo Revertendo configuracoes para HDD...
fsutil behavior set disableLastAccess 0
fsutil behavior set disable8dot3 1
echo  Configurações para HDD restauradas.
pause
goto reverterperifericos

:reverter_tudo
call :revert_mouse
call :revert_teclado
call :revert_inputlag
call :revert_ssd
call :revert_hdd
echo Todas as otimizacoes foram revertidas.
pause
goto reverterperifericos

:revertertudo
:: start https://youtu.be/_Mc3urSaUL8?feature=shared
pause
cls
goto :menu

::==================================================================================
:: RODAR UM PROGRAMA ........................
::==================================================================================
:autorun
start "" "%~dp0Autoruns.exe"
echo Configurando Inicialização do Windows...
pause
cls
goto menu

::==================================================================================
::==================================================================================
goto sair
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