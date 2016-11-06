;WhiteList
#Include initForAll.ahk

Gui, ScriptManager: New
Gui, ScriptManager:-Resize -MaximizeBox

options := 0
getIniInfo(count)
Loop
{
  getIniInfo(scriptName,,count)
  getIniInfo(scriptState,4,scriptName)
  StringTrimRight, scriptName, scriptName, 4
  scriptState%options% := scriptState
  Gui, Add, Checkbox, VscritState%options% gcheckChange, %scriptName%
  GuiControl, ,scritState%options%, %scriptState%

  options++
  count--
} Until count = 0 

Gui, Add, Button, GButtonUpdate, Update Changes
Gui, Add, Button, GButtonStartScripts, Start scripts
Gui, Add, Button, GButtonEndScripts, End scripts

Gui, Show, Center AutoSize ;W400 H300

checkChange:
{
  GuiControlGet, fState,, %A_GuiControl%
  GuiControlGet, fName,, %A_GuiControl%, Text
  key = % fName . ".ahk"
  IniWrite %fState%, scriptTag.ini, OptionalScripts, %key%
}
return
  
ButtonUpdate:
{
  #IncludeAgain stopAllScripts.ahk
  #IncludeAgain runAllScripts.ahk 
}
return
ButtonStartScripts:
{
  #IncludeAgain runAllScripts.ahk 
}
return
ButtonEndScripts:
{
  #IncludeAgain stopAllScripts.ahk 
}
return
GuiClose:
{
  ExitApp
}
return
