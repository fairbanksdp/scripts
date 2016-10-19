;WhiteList

genKey = 1 
whiteKey = 1
testKey = 1
Loop, Files, C:\Users\Daniel\Documents\AutoHotKey\scripts\*.ahk
{
  FileReadLine, section, %A_LoopFileName%, 1
  StringTrimLeft, section, section, 1
  if section = General
  {
    count := genKey
    genKey := genKey + 1
    IniRead scriptState, activeFileList.ini, OptionalScripts, %A_LoopFileName%, -1
    if scriptState != 0 and scriptState != 1
    {
      scriptState := -1
    }
    IniWrite, %scriptState%, activeFileList.ini, OptionalScripts, %A_LoopFileName%
    ;IniWrite, %A_LoopFileName%, activeFileList.ini, OptionalScripts
  }
  else if section = WhiteList
  {
    count := whiteKey
    whiteKey := whiteKey + 1
    IniWrite, 1, activeFileList.ini, ReqiredScripts, %A_LoopFileName%
  }
  else
  {
    count := testKey
    testKey := testKey + 1
  }
    
  IniWrite, %A_LoopFileName%, scriptTag.ini, %section%, %count%
  
}

genKey := genKey - 1 
whiteKey := whiteKey - 1
testKey := testKey - 1
IniWrite, %genKey%, scriptTag.ini, General, 0
IniWrite, %whiteKey%, scriptTag.ini, WhiteList, 0
IniWrite, %testKey%, scriptTag.ini, Testing, 0

ExitApp
