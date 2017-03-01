;WhiteList | false | true `Sorts scripts by their tags.
;Section | Script-Options?, op1, op2 | Description? `description
#Include iniCat.ahk
genKey := 0 
whiteKey := 0
headerKey := 0
testKey := 0
otherKey := 0 
resetIniInfo("TS_g")
resetIniInfo("TS_h")
resetIniInfo("TS_w")
resetIniInfo("TS_t")
resetIniInfo("TS_o")

resetIniInfo("TO_so")
resetIniInfo("TO_d")

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
    getIniInfo(scriptState, "R_ss", A_LoopFileName)
    if ((scriptState != 0) AND (scriptState != 1))
      scriptState := 0
    setIniInfo(scriptState, "R_ss", A_LoopFileName)
  } 
  else if section = WhiteList
    count := ++whiteKey
  else if section = Header
     count := ++headerKey
  else if section = Testing
      count := ++testKey
  else
  {
    count := ++otherKey
    section = Other
  }
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
setIniInfo(genKey, "TS_g")
setIniInfo(whiteKey, "TS_w")
setIniInfo(headerKey, "TS_h")
setIniInfo(testKey, "TS_t")
setIniInfo(otherKey, "TS_o")

ExitApp

