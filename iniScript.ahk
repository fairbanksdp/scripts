;WhiteList | false | true `Sorts scripts by their tags.
;Section | Script-Options?, op1, op2 | Description? `description
#Include iniCat.ahk
genKey := 0 
whiteKey := 0
testKey := 0
resetIniInfo()
resetIniInfo(2)
resetIniInfo(3)
resetIniInfo(6)
resetIniInfo(7)

Loop, Files, %A_WorkingDir%\*.ahk
{
  loop
  {
    tags%A_Index% := "nil" ; Resets tags so that the info does not spill over into the next script's empty fields
  } Until tags0 <= A_Index
  FileReadLine, tag, %A_LoopFileName%, 1
  StringTrimLeft, tag, tag, 1
  StringSplit, tags, tag, `|
  section := Trim(tags1)
  if section = General
  {
    count := ++genKey
    getIniInfo(scriptState, 4, A_LoopFileName)
    if ((scriptState != 0) AND (scriptState != 1))
      scriptState := 0
    setIniInfo(scriptState, 4, A_LoopFileName)
  }
  else if section = WhiteList
    count := ++whiteKey
  else
    count := ++testKey
  setIniInfo(A_LoopFileName, section, count)
  
  StringSplit, options, tags2, `,, %A_Space%
  if options1 != true
    options1 = false
  else
  {
    n = 1
    loop
    {
      n++
      getIniInfo(opState, A_LoopFileName, options%n%)
      if ((opState != 0) AND (opState != 1))
        opState := 0
      setIniInfo(opState, A_LoopFileName, options%n%)
    } Until options0 = n
  }
  setIniInfo(options1, "ScriptOptions", A_LoopFileName)

  StringSplit, descript, tags3, ``
  desc := Trim(descript1)
  if desc != true
    desc = false
  else
    setIniInfo(descript2, A_LoopFileName, "Description")
  setIniInfo(desc, "Description", A_LoopFileName)
}
setIniInfo(genKey)
setIniInfo(whiteKey, 2)
setIniInfo(testKey, 3)

ExitApp

