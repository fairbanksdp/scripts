;WhiteList
#Include initForAll.ahk
#Include iniCat.ahk

Gui, ScriptManager: New
Gui, ScriptManager: -Resize -MaximizeBox
Gui, add, Tab3,, General||Whitelist|Testing
Gui, Tab, 1
stdC_y := 19
std_x := 22
std_y := 15 ; 34 
scriptID := 0
getIniInfo(count)
Loop
{
  getIniInfo(fileName,,count)
  getIniInfo(scriptState,4,fileName)
  getIniInfo(scriptOptions, "scriptOptions", fileName)
  StringTrimRight, scriptName, fileName, 4
  scriptState%scriptID% := scriptState
  std_y += stdC_y
  Gui, Add, Checkbox, x%std_x% y%std_y% VscriptState%scriptID% gcheckChange, %scriptName%
  GuiControl, ,scriptState%scriptID%, %scriptState%
  getIniInfo(descrip, "Description", fileName) 
  if (%descrip%)
  {
    ;GuiControlGet, descPos, Pos, %scriptName%
    getIniInfo(description, fileName, "Description") 
    descPosX := std_x + 100
    Gui, add, Text, y%std_y% x%descPosX%, %description%
    ;GuiControl, Move, %description%, y%std_y%
    ;GuiControl, Move, %description%, x%descPosX% ;y%std_y%
  }
  if (%scriptOptions%)
  {
    opSection := scriptName . ".ahk"
    IniRead, opStr, %Ini%, %opSection%
    StringSplit, opSudo, opStr, `n, A_Space
    opCount = 0
    Loop
    {
      opCount++
      StringSplit, ops, opSudo%opCount%, `=,
      if ops1 != Description
      {
        sState%ops1% = %ops2% 
        std_y += stdC_y
	opPosX := std_x + 5
        Gui, Add, Radio, x%opPosX% y%std_y% Group V%scriptName%opState%opCount% gradioChange, %ops1%
        GuiControl,, %scriptName%opState%opCount%, %ops2%
        ;GuiControlGet, pos, Pos, %scriptName%opState%opCount%
        ;GuiControl, Move, %scriptName%opState%opCount%, % "x" posX+5
      }
    } Until opCount = opSudo0
  }
  scriptID++
  count--
} Until count = 0 

Gui, Add, Button, GButtonUpdate, Update Changes 
GuiControlGet, width, Pos, Update Changes 
GuiControl, , Update Changes, Start Scripts
Gui, Add, Button, GButtonEndScripts, End Scripts
GuiControl, Hide, End Scripts
Gui, Add, Button, GButtonStartScripts, Stort Scripts
GuiControlGet, width2, Pos, Stort Scripts 
GuiControl, Hide, Stort Scripts

ButtonEndScripts:
{
  #IncludeAgain stopAllScripts.ahk 
  GuiControl, , Update Changes, Start Scripts
  GuiControl, Move, Start Scripts, w%width2w%
  GuiControl, Hide, %A_GuiControl%
  Gui, Show, AutoSize ;W400 H300
}
return
checkChange:
{
  GuiControlGet, fState,, %A_GuiControl%
  GuiControlGet, fName,, %A_GuiControl%, Text
  key = % fName . ".ahk"
  setIniInfo(fState, "OptionalScripts", key)
}
return
radioChange:
{
  GuiControlGet, sKey,, %A_GuiControl%, Text
  sState%sKey%++
  sState%sKey% := Mod(sState%sKey%, 2)
  if sState%sKey% = 0
  {
    Guicontrol,, %A_GuiControl%, 0
    sState = 0
  }
  else
    sState = 1
  GuiControlGet, varName, Name, %A_GuiControl%
  StringReplace, varNameAndNum, varName, opState, ``
  StringSplit, varName, varNameAndNum, ``
  section := varName1 . ".ahk"
  setIniInfo(sState, section, sKey)
}
return
ButtonUpdate:
{
  #IncludeAgain stopAllScripts.ahk
  #IncludeAgain runAllScripts.ahk 
  GuiControl,, %A_GuiControl%, Update Changes
  GuiControl, Move, %A_GuiControl%, w%widthw%
  GuiControl, Show, End Scripts
  Gui, Show, AutoSize ;W400 H300

}
return
ButtonStartScripts:
{
}
return
GuiClose:
{
  ExitApp
}
return
