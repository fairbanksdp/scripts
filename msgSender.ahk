;Header
global END_OPS_MSG := "END_OF_MSG" 
Send_WM_COPYDATA(ByRef StringToSend, ByRef TargetScriptTitle)
{
  VarSetCapacity(CopyDataStruct, 3*A_PtrSize, 0) ; Set up the structure's memory area.
  ; First set the structure's cbData member to the size of the string, including its zero terminator:
  SizeInBytes := (StrLen(StringToSend) + 1) * (A_IsUnicode ? 2 : 1)
  NumPut(SizeInBytes, CopyDataStruct, A_PtrSize) ; OS requires that this be done.
  NumPut(&StringToSend, CopyDataStruct, 2*A_PtrSize) ; Set lpData to point to the string itself.
  Prev_DetectHiddenWindows := A_DetectHiddenWindows
  Prev_TitleMatchMode := A_TitleMatchMode
  DetectHiddenWindows On
  SetTitleMatchMode 2
  SendMessage, 0x4a, 0, &CopyDataStruct,, %TargetScriptTitle% ; 0x4a is WM_COPYDATA. Must use Send not Post.
  DetectHiddenWindows %Prev_DetectHiddenWindows% ; Restore original setting for the caller.
  SetTitleMatchMode %Prev_TitleMatchMode%        ; Same.
  return ErrorLevel ; Return SendMessage's reply back to our caller.
}
