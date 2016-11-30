;WhiteList | true, Restart'App
#Include initForAll.ahk
#Include iniCat.ahk

Gui, ScriptManager: New
Gui, ScriptManager: -Resize -MaximizeBox
Gui, add, Tab3,, General||Whitelist|Testing
; /*
Gui, Tab, 2
;Gui, add, text, , test
;gui,add,button,,test1
;guicontrolget,pos,pos,test
;guicontrolget,pos1,pos,test1
;msgbox % posY "," pos1Y-posY "," posX
stdC_y := 19
std_x := 22
std_y := 15 ; 34 
scriptID := 0
getIniInfo(count,2)
Loop
{
  getIniInfo(fileName,2,count)
  getIniInfo(scriptOptions, "scriptOptions", filesName)
  getIniInfo(descrip, "Description", fileName) 
  StringTrimRight, scriptName, fileName, 4
  std_y += stdC_y
  Gui, Add, Text, x%std_x% y%std_y%, %scriptName%
  if (%descrip%)
  {
    getIniInfo(description, fileName, "Description") 
    descPosX := std_x + 100
    Gui, add, Text, y%std_y% x%descPosX%, %description%
  }
  if (%scriptOptions%)
  {
    IniRead, opStr, %Ini%, %fileName%
    StringSplit, opSudo, opStr, `n, A_Space
    opCount = 0
    opPosX := std_x
    std_y += stdC_y
    Loop
    {
      opCount++
      StringSplit, ops, opSudo%opCount%, `=,
      if ops1 != Description
      {
        StringReplace, ops1, ops1, `', %A_Space%
        sState%ops1% = %ops2% 
        Gui, Add, Button, x%opPosX% y%std_y% V%scriptName%opState%opCount% gWhitelistButton, %ops1%
	opPosX := std_x + 40
      }
    } Until opCount = opSudo0
  }
  scriptID++
  count--
} Until count = 0 
;return 
; */
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
    getIniInfo(description, fileName, "Description") 
    descPosX := std_x + 100
    Gui, add, Text, y%std_y% x%descPosX%, %description%
  }
  if (%scriptOptions%)
  {
    IniRead, opStr, %Ini%, %fileName%
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
  ;msgbox test
  #IncludeAgain stopAllScripts.ahk
  #IncludeAgain runAllScripts.ahk 
  ;msgbox test
  GuiControl,, %A_GuiControl%, Update Changes
  GuiControl, Move, %A_GuiControl%, w%widthw%
  GuiControl, Show, End Scripts
  ;Gui, Show, AutoSize ;W400 H300
  ;msgbox testtest

}
return
ButtonStartScripts:
{
}
return
WhiteListButton:
{
}
return
 /*
Gui, Tab, 2
stdC_y := 19
std_x := 22
std_y := 15 ; 34 
scriptID := 0
getIniInfo(count,2)
Loop
{
  getIniInfo(fileName,2,count)
  getIniInfo(scriptOptions, "scriptOptions", filesName)
  getIniInfo(descrip, "Description", fileName) 
  StringTrimRight, scriptName, fileName, 4
  std_y += stdC_y
  Gui, Add, Text, x%std_x% y%std_y%, %scriptName%
  if (%descrip%)
  {
    getIniInfo(description, fileName, "Description") 
    descPosX := std_x + 100
    Gui, add, Text, y%std_y% x%descPosX%, %description%
  }
  if (%scriptOptions%)
  {
    IniRead, opStr, %Ini%, %fileName%
    StringSplit, opSudo, opStr, `n, A_Space
    opCount = 0
    opPosX := std_x
    std_y += stdC_y
    Loop
    {
      opCount++
      StringSplit, ops, opSudo%opCount%, `=,
      if ops1 != Description
      {
        StringReplace, ops1, ops1, ', %A_Space%
        sState%ops1% = %ops2% 
        Gui, Add, Button, x%opPosX% y%std_y% V%scriptName%opState%opCount% gWhitelistButton, %ops1%
	opPosX := std_x + 40
      }
    } Until opCount = opSudo0
  }
  scriptID++
  count--
} Until count = 0 
return
; */
GuiClose:
{
  ExitApp
}
return
