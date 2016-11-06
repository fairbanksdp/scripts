;WhiteList

getIniInfo(count)
Loop
{
  getIniInfo(scriptName,,count)
  getIniInfo(PID, 6, scriptName)
  if PID != "nil" 
  {
    IniWrite, "nil", scriptTag.ini, PID, %scriptName%
    Process, Close, %PID%
  }
  count--
} Until count = 0
