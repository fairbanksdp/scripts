;General

Loop {
  If A_Hour < 20 
  {
    WinGetActiveTitle, title
    If title contains YouTube 
      WinClose %title%
  } 
  Else 
    ExitApp
}




