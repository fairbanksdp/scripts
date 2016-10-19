;Testing

Path =  C:\Users\Daniel\Documents\AutoHotKey\scripts
Gui, ScriptManager: New
Gui, ScriptManager:-Resize -MaximizeBox
Gui, Add, Checkbox, 

RunWait %Path%\iniScript.ahk


IniRead, generalScripts, %Path%\ActiveFileList.ini, OptionalScripts
StringSplit, activeFileList, %generalScripts%, =,`n
options := activeFileList.length/2
count = 0
Loop
{
  Gui, Add, Checkbox, activeFileList[%count%+1], activeFileList[%count%]
  count := count + 1
  if count >= %options%
    break
}
Gui, Show, Center AutoSize ;W100 H50

