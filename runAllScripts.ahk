;WhiteList
getIniInfo(count)
Loop
{
  getIniInfo(scriptName,,count)
  getIniInfo(scriptState, 4, scriptName)
  if scriptState = 1
  {
    run, %scriptName%, %Path%,, PID
    setIniInfo(PID, "PID", scriptName)
    getIniInfo(options, "scriptOptions", scriptName)
    if (options)
    {
      sleep 200
      IniRead, opStr, %Ini%, %scriptName%
      StringSplit, opSudo, opStr, `n, A_Space
      opCount = 0
      Loop
      {
        opCount++
        StringSplit, ops, opSudo%opCount%, `=
	if (ops2)
	{
          result := Send_WM_COPYDATA(ops1, scriptName)
          if result = FAIL
            MsgBox SendMessage failed. Does the following WinTitle exist?:`n%TargetScriptTitle%
          else if result = 0
            MsgBox Message sent but the target window responded with 0, which may mean it ignored it.
	}
      } Until opCount = opSudo0
      result := Send_WM_COPYDATA(END_OPS_MSG, scriptName)
      if result = FAIL
        MsgBox SendMessage failed. Does the following WinTitle exist?:`n%TargetScriptTitle%
      else if result = 0
        MsgBox Message sent but the target window responded with 0, which may mean it ignored it.
    }
  }
  else
    setIniInfo("nil", "PID", scriptName)

  count--
} Until count = 0

