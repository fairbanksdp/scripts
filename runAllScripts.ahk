;WhiteList
getIniInfo(count)
Loop
{
  getIniInfo(scriptName,,count)
  getIniInfo(scriptState, 4, scriptName)
  if scriptState = 1
  {
    run, %scriptName%, %Path%,, PID
    IniWrite, %PID%, %Path%\scriptTag.ini, PID, %scriptName%
  }
  else
    IniWrite, nil, %Path%\scriptTag.ini, PID, %scriptName%

  count--
} Until count = 0
