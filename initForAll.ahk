;Testing

#SingleInstance force
SetWorkingDir %A_ScriptDir%
Path := A_WorkingDir 
RunWait %Path%\iniScript.ahk
global count = 0 
global sectionOpps := ["General", "WhiteList", "Testing", "OptionalScripts", "RequiredScripts", "PID"]

getIniInfo(byref outVar, section = 1, key = 0)
{
  global
  sectionStr := sectionOpps[section]
  IniRead, outVar, %Path%\scriptTag.ini, %sectionStr%, %key%
  return 
}
