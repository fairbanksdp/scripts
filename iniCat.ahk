;Testing
global Path := A_ScriptDir
global Ini := A_ScriptDir . "\scriptTag.ini"
global sectionStr
global sectionOps := ["General", "WhiteList", "Testing", "OptionalScripts", "PID", "scriptOptions", "Description"]

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
  else
    sectionStr := section
}