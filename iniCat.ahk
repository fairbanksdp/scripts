;Header
global Path := A_ScriptDir
global Ini := A_ScriptDir . "\scriptTag.ini"
global sectionStr
global sectionOps := ["General", "WhiteList", "Header", "Testing", "Other", "ScriptStates", "PID", "ScriptOptions", "Description"]
global holder
getIniInfo(byref outVar, section = 1, key = 0)
{
  global
  sectionName(section)
  IniRead, outVar, %Ini%, %sectionStr%, %key%, -1
  return
}
setIniInfo(value, section = 1, key = 0)
{
  global
  sectionName(section)
  IniWrite, %value%, %Ini%, %sectionStr%, %key%
  return
}
resetIniInfo(section = 1)
{
  global
  sectionName(section)
  IniDelete, %Ini%, %sectionStr%
  return 
}
sectionName(section)
{
  if sectionOps.HasKey(section)
    sectionStr := sectionOps[section]
  else {
    IniRead, holder, %Ini%, SectionMapping, %section%, -1
    if holder != -1
      sectionStr := holder
    else
      sectionStr := section
  }
}
