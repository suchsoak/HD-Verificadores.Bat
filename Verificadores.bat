@echo off
@echo.
@echo.
@echo -------------------------
@echo github: https://github.com/suchsoak
@echo -------------------------
timeout 4 >null
@echo.
@echo [!] informacoes de disco:
@echo.
wmic diskdrive list brief
@echo.
@echo -------------------------
@echo [!] Certifiquese que voce esta como admin
@echo -------------------------
@echo.
@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: [*] 1. Verificar discos
@echo:: [*] 2. Sair do terminal 
@echo::::::::::::::::::::::::::::::::::::::::::::
color 4
set /p escolha= escolha uma opcao:
echo -------------------------
if %escolha% equ 1 goto escolha1 
if %escolha% equ 2 goto escolha2

:escolha1
color 7
cls
@echo.
@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: [!] Verificadores de disco
@echo::::::::::::::::::::::::::::::::::::::::::::
@echo.
@echo -------------------------
@echo  [*] Sfc /ScanNow
@echo -------------------------
timeout 2 >null
Sfc /ScanNow
cls
@echo.
@echo -------------------------
@echo  [*] dism /online /cleanup-image /scanhealth
@echo -------------------------
timeout 2 >null
dism /online /cleanup-image /scanhealth
cls
@echo.
@echo -------------------------
@echo  [*] dism /online /cleanup-image /restorehealth
@echo -------------------------
timeout 2 >null
dism /online /cleanup-image /restorehealth
cls
@echo.
@echo -------------------------
@echo  [*] dism /Online /Cleanup-Image /CheckHealth
@echo -------------------------
timeout 2 >null
dism /Online /Cleanup-Image /CheckHealth
cls
@echo.
@echo [*] Processo Finalizado...
timeout 3 
@echo.

@echo [!] caso queria fazer uma verificacao mais completa existe o comando chkdsk /r.
@echo [!] Porem nesse comando seu computador precisara ser reiniciado e isso levara tempo.

@echo::::::::::::::::::::::::::::::::::::::::::::--
@echo:: [!] AVISO o processo levara um tempo, dependendo da maquina.
@echo::::::::::::::::::::::::::::::::::::::::::::-- 
@echo.
@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: [*] 3. Executar o comando chkdsk /r
@echo:: [*] 4. Nao executar o comando
@echo:::::::::::::::::::::::::::::::::::::::::::: 

set /p escolha=  escolha uma opcao: 

if %escolha% equ 3 goto escolha3
if %escolha% equ 4 goto escolha4

:escolha3

@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: [*] chkdsk /r
@echo:::::::::::::::::::::::::::::::::::::::::::: 
timeout 3 >null
chkdsk /r
@echo.
@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: [!] Por padrao, o seu computador não irar ser reiniciado depois do comando, porem e recomendavel.
@echo::::::::::::::::::::::::::::::::::::::::::::


:escolha4 
@echo.
@echo [*] Saindo Do Terminal...
timeout 3 >null
color 7
cls
exit

:escolha2
@echo.
@echo [*] Saindo Do Terminal...
timeout 3 >null
color 7
cls
exit
