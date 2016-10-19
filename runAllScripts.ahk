;WhiteList

RunWait C:\Users\Daniel\Documents\AutoHotKey\scripts\iniScript.ahk
IniRead, count, C:\Users\Daniel\Documents\AutoHotKey\scripts\scriptTag.ini, General, 0
Loop
{
  
  IniRead, scriptName, C:\Users\Daniel\Documents\AutoHotKey\scripts\scriptTag.ini, General, %count%
  run C:\Users\Daniel\Documents\AutoHotKey\scripts\%scriptName%
  count := count - 1
  if count = 0
    break

}
ExitApp

