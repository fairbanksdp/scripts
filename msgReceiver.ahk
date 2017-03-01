;Header
global optionList := [] 
global END_OPS_MSG := "END_OF_MSG" 
OnMessage(0x4a, "Receive_WM_COPYDATA")
Receive_WM_COPYDATA(wParam, lParam)
{
  StringAddress := NumGet(lParam + 2*A_PtrSize)
  opName := StrGet(StringAddress)
  if opName = %END_OPS_MSG%
    OnMessage(0x4a, "")
  else
    optionList.push(opName)
  return true
}
