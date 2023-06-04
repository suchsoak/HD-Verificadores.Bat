@echo off
date /t
@echo -----
@echo Maquina: %computername% 
@echo Usuario: %username% 
@echo Sistema: %OS% 
@echo Arquitetura: %PROCESSOR_ARCHITECTURE%
@echo Pasta: %SYSTEMROOT%
@echo -----
@echo informacoes de disco
wmic diskdrive list brief
@echo -----
@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: [*] 1. Verificar discos
@echo:: [*] 2. Sair do terminal 
@echo::::::::::::::::::::::::::::::::::::::::::::

set /p escolha= escolha uma opcao:
echo ****************************
if %escolha% equ 1 goto escolha1 
if %escolha% equ 2 goto escolha2

:escolha1
@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: Verificadores de disco
@echo:: Certifiquese que voce esta como admin
@echo::::::::::::::::::::::::::::::::::::::::::::
@echo ##########################
@echo Iniciando codigo Sfc /ScanNow
@echo ##########################
Sfc /ScanNow
@echo ##########################
@echo Iniciando dism /online /cleanup-image /scanhealth
@echo ##########################
dism /online /cleanup-image /scanhealth
cls
@echo ##########################
@echo Iniciando dism /online /cleanup-image /restorehealth
@echo ##########################
dism /online /cleanup-image /restorehealth
cls
@echo processo finalizado
@echo comandos utilizados:
@echo ############################################
@echo --Sfc /ScanNow
@echo --dism /online /cleanup-image /scanhealth
@echo --dism /online /cleanup-image /restorehealth
@echo ############################################
@pause

@echo caso queria fazer uma verificação mais completa existe o comando chkdsk /r.
@echo Porem nesse comando seu computador precisara ser reiniciado e isso levara tempo.

@echo::::::::::::::::::::::::::::::::::::::::::::--
@echo::AVISO depois de executar o comando e reiniciar o pc, tenha em mente que isso levara tempo, dependendo da sua maquina.
@echo::::::::::::::::::::::::::::::::::::::::::::-- 

@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: [*] 3. Executar o comando chkdsk /r
@echo:: [*] 4. Nao executar o comando
@echo:::::::::::::::::::::::::::::::::::::::::::: 

set /p escolha=  escolha uma opcao: 

if %escolha% equ 3 goto escolha3
if %escolha% equ 4 goto escolha4

:escolha3

@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: [*] Executando chkdsk /r
@echo:::::::::::::::::::::::::::::::::::::::::::: 
chkdsk /r

@echo::::::::::::::::::::::::::::::::::::::::::::
@echo:: Por padrao, o seu computador não irar ser reiniciado depois do comando, porem e recomendavel.
@echo::::::::::::::::::::::::::::::::::::::::::::


:escolha4 
cls
exit

:escolha2
cls
exit
