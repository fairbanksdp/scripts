;Header
#SingleInstance force
SetWorkingDir %A_ScriptDir%
Path := A_WorkingDir 
RunWait %Path%\iniScript.ahk
global count = 0 
