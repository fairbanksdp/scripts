;General | true, YouTube, Steam | true `Blocks specified windows
#Include msgReceiver.ahk 
Loop {
  Sleep, 250
  WinGetActiveTitle, title
  filter :=  optionList[mod(A_Index, optionList.length())+1]   
  If title contains %filter% 
    WinClose %title%
} Until A_Hour > 19
ExitApp
return
/*
;#Persistent
;SetTimer, RemoveToolTip, 5000
RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return
*/

