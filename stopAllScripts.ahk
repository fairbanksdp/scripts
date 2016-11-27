;WhiteList

getIniInfo(count)
Loop
{
  getIniInfo(scriptName,,count)
  getIniInfo(PID, "PID", scriptName)
  if PID != "nil" 
  {
    Process, Close, %PID%
    setIniInfo("nil", "PID", scriptName)
  }
  count--
} Until count = 0
