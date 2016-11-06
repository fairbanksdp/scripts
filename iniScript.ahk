;WhiteList

genKey := 0 
whiteKey := 0
testKey := 0
Loop, Files, %A_WorkingDir%\*.ahk
{
  FileReadLine, section, %A_LoopFileName%, 1
  StringTrimLeft, section, section, 1
  if section = General
  {
    count := ++genKey
    IniRead scriptState, scriptTag.ini, OptionalScripts, %A_LoopFileName%, -1
    if ((scriptState != 0) AND (scriptState != 1))
      scriptState := 0
    IniWrite, %scriptState%, scriptTag.ini, OptionalScripts, %A_LoopFileName%
  }
  else if section = WhiteList
  {
    count := ++whiteKey
    IniWrite, 1, scriptTag.ini, ReqiredScripts, %A_LoopFileName%
  }
  else
  {
    count := ++testKey
  }
    
  IniWrite, %A_LoopFileName%, scriptTag.ini, %section%, %count%
  
}

IniWrite, %genKey%, scriptTag.ini, General, 0
IniWrite, %whiteKey%, scriptTag.ini, WhiteList, 0
IniWrite, %testKey%, scriptTag.ini, Testing, 0

ExitApp
