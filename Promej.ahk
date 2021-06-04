buildscr = 3
downlurl := "https://github.com/Jackharley8888/Auto/raw/master/LD.exe?raw=true"
downllen := "https://github.com/LanceHarley/Test2/raw/master/verlen.ini"

FileDelete, %a_temp%/data
FileDelete, %a_scriptdir%/LD.exe
URLDownloadToFile, %downllen%, %a_temp%/data/versld.ini
    FileMove, vers.ini, %A_temp%\vers.ini
IfNotExist, %A_Temp%\data
{
    FileCreateDir, %A_Temp%\data
}

IfNotExist, %A_temp%\data\fonldd.png
{
    URLDownloadToFile, https://raw.githubusercontent.com/Jackharley8888/Auto/master/Data/fonldd.png, fonldd.png
    Sleep 100
    FileMove, fonldd.png, %A_temp%\data\fonldd.png
}


WM_HELP(){
    IniRead, vupd, %a_temp%/data/versld.ini, UPD, v
Run https://vk.com/ahkradmirharley   ;     msgbox, , Список изменений версии %vupd%, 
    return
}

OnMessage(0x53, "WM_HELP")
Gui +OwnDialogs

SplashTextOn, , 150,Автообновление Harley AHK, Запуск скрипта. Ожидайте..`nПроверяем наличие обновлений.
IniRead, buildupd, %a_temp%/data/versld.ini, UPD, build
if buildupd =
{
    SplashTextOn, , 150,Автообновление Harley AHK, Запуск скрипта.`nОшибка. Нет связи с сервером.
    sleep, 2000
}
if buildupd > % buildscr
{
    IniRead, vupd, %a_temp%/data/versld.ini, UPD, v
    SplashTextOn, , 150,Автообновление Harley AHK, Запуск скрипта. Проверка файлов..`nОбнаружена новая версия - %vupd%!
    sleep, 2000
    IniRead, des, %a_temp%/data/versld.ini, UPD, des
    SplashTextoff
	    IniRead, vupd, %a_temp%/data/versld.ini, UPD, v
            SplashTextOn, , 150,Автообновление Harley AHK, Установка необходимых файлов.`nОбновляем скрипт до версии %vupd%!
            URLDownloadToFile, %downlurl%, %a_scriptdir%/LD.exe
            sleep, 1000
            exitapp
			}
SplashTextoff