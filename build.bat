@echo off
setlocal

set VSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional
call "%VSINSTALLDIR%\Common7\Tools\VsDevCmd.bat"

set LogDir=%~dp0logs\
if not exist "%LogDir%" mkdir "%LogDir%"

set Config=Release
if "%1"=="/debug" set Config=Debug

::  common parameters
set CommonT=/target:rebuild
set CommonM=/maxcpucount:4
set CommonP=/property:Configuration=%Config%
set CommonFLP=/fl1 /flp1:Encoding=UTF-8
set CommonFLPErr=/fl2 /flp2:Encoding=UTF-8;ErrorsOnly


pushd "%~dp0Source\Lib\MAKINO.Geometry\Source"
MSBuild MAKINO.Geometry.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%MAKINO.Geometry.log" %CommonFLPErr%;logfile="%LogDir%MAKINO.Geometry.err"
popd

pushd "%~dp0Source\Lib\MAKINO.FF.Def\Source"
MSBuild MAKINO.FF.Def.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%MAKINO.FF.Def.log" %CommonFLPErr%;logfile="%LogDir%MAKINO.FF.Def.err"
popd

pushd "%~dp0Source\Lib\MAKINO.FF.Fum\Source"
MSBuild MAKINO.FF.Fum.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%MAKINO.FF.Fum.log" %CommonFLPErr%;logfile="%LogDir%MAKINO.FF.Fum.err"
popd

pushd "%~dp0Source\Lib\FFAUT.FF.Fum\Source"
MSBuild FFAUT.FF.Fum.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FFAUT.FF.Fum.log" %CommonFLPErr%;logfile="%LogDir%FFAUT.FF.Fum.err"
popd

pushd "%~dp0Source\Lib\FFAUT.DB\Source"
MSBuild FFAUT.DB.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FFAUT.DB.log" %CommonFLPErr%;logfile="%LogDir%FFAUT.DB.err"
popd

pushd "%~dp0Source\Lib\FF.AUT.CLFileInfo\Source"
MSBuild FF.AUT.CLFileInfo.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FF.AUT.CLFileInfo.log" %CommonFLPErr%;logfile="%LogDir%FF.AUT.CLFileInfo.err"
popd

pushd "%~dp0Source\Lib\FF.AUT.Draw\Source"
MSBuild FF.AUT.Draw.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FF.AUT.Draw.log" %CommonFLPErr%;logfile="%LogDir%FF.AUT.Draw.err"
popd

pushd "%~dp0Source\Lib\FFAUT.OptionSetting\FFAUT.OptionSetting"
MSBuild FFAUT.OptionSetting.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FFAUT.OptionSetting.log" %CommonFLPErr%;logfile="%LogDir%FFAUT.OptionSetting.err"
popd

pushd "%~dp0Source\Exe\MAKINO.Parameters\MAKINO.Parameters"
MSBuild MAKINO.Parameters.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%MAKINO.Parameters.log" %CommonFLPErr%;logfile="%LogDir%MAKINO.Parameters.err"
popd

pushd "%~dp0Source\Lib\FF.Parameters.Machine\FF.Parameters.Machine\Lib\FF.Parameters.Machine\Source"
MSBuild FF.Parameters.Machine.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FF.Parameters.Machine.log" %CommonFLPErr%;logfile="%LogDir%FF.Parameters.Machine.err"
popd

pushd "%~dp0Source\Lib\FF.Parameters.Machine\FF.Parameters.Machine\Lib\FF.Parameters.Machine\Source"
MSBuild FF.Parameters.Machine.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%FF.Parameters.Machine-x64.log" %CommonFLPErr%;logfile="%LogDir%FF.Parameters.Machine-x64.err"
popd

pushd "%~dp0Source\Lib\FF.Parameters.Machine\FF.Parameters.Machine\Lib\FF.Parameters.Machine\Source"
MSBuild FF.Parameters.Machine.sln %CommonT% %CommonM% %CommonP%;Platform=Win32 %CommonFLP%;logfile="%LogDir%FF.Parameters.Machine-Win32.log" %CommonFLPErr%;logfile="%LogDir%FF.Parameters.Machine-Win32.err"
popd

pushd "%~dp0Source\Lib\FF.AUT.TiltMill\FF.AUT.TiltMill"
MSBuild FF.AUT.TiltMill.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FF.AUT.TiltMill.log" %CommonFLPErr%;logfile="%LogDir%FF.AUT.TiltMill.err"
popd

pushd "%~dp0Source\Lib\FF.AUT.Machining.Parameters\Source"
MSBuild FF.AUT.Machining.Parameters.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FF.AUT.Machining.Parameters.log" %CommonFLPErr%;logfile="%LogDir%FF.AUT.Machining.Parameters.err"
popd

pushd "%~dp0Source\Lib\FFAUT.DB.FFpostData\Source"
MSBuild FFAUT.DB.FFpostData.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FFAUT.DB.FFpostData.log" %CommonFLPErr%;logfile="%LogDir%FFAUT.DB.FFpostData.err"
popd

pushd "%~dp0Source\C_C++\FFAUT_legacy_lib\Source"
MSBuild FFAUT_legacy_lib.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%FFAUT_legacy_lib-x64.log" %CommonFLPErr%;logfile="%LogDir%FFAUT_legacy_lib-x64.err"
popd

pushd "%~dp0Source\C_C++\FFAUT.DB.Part.IO\Source"
MSBuild FFAUT.DB.Part.IO.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%FFAUT.DB.Part.IO-x64.log" %CommonFLPErr%;logfile="%LogDir%FFAUT.DB.Part.IO-x64.err"
popd

pushd "%~dp0Source\C_C++\FFAUTCPPCLI\Source"
MSBuild FFAUTCPPCLI.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%FFAUTCPPCLI-x64.log" %CommonFLPErr%;logfile="%LogDir%FFAUTCPPCLI-x64.err"
popd

pushd "%~dp0Source\C_C++\FFAUTDB.Milling.Condition\Source"
MSBuild FFAUTDB.Milling.Condition.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%FFAUTDB.Milling.Condition-x64.log" %CommonFLPErr%;logfile="%LogDir%FFAUTDB.Milling.Condition-x64.err"
popd

pushd "%~dp0Source\C_C++\FFmcdbParamReader\Source"
MSBuild FFmcdbParamReader.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%FFmcdbParamReader-x64.log" %CommonFLPErr%;logfile="%LogDir%FFmcdbParamReader-x64.err"
popd

pushd "%~dp0Source\C_C++\libffaut_assembly\libffaut_assembly"
MSBuild libffaut_assembly.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%libffaut_assembly-x64.log" %CommonFLPErr%;logfile="%LogDir%libffaut_assembly-x64.err"
popd

pushd "%~dp0Source\C_C++\libffaut_guideCtrl\libffaut_guideCtrl"
MSBuild libffaut_guideCtrl.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%libffaut_guideCtrl-x64.log" %CommonFLPErr%;logfile="%LogDir%libffaut_guideCtrl-x64.err"
popd

pushd "%~dp0Source\C_C++\FFAUT_toolDB\FFAUT_toolDB"
MSBuild FFAUT_toolDB.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%FFAUT_toolDB-x64.log" %CommonFLPErr%;logfile="%LogDir%FFAUT_toolDB-x64.err"
popd

pushd "%~dp0Source\C_C++\combine_stl"
MSBuild combine_stl.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%combine_stl-x64.log" %CommonFLPErr%;logfile="%LogDir%combine_stl-x64.err"
popd

pushd "%~dp0Source\C_C++\tool_contact\tool_contact"
MSBuild tool_contact.sln %CommonT% %CommonM% %CommonP%;Platform=x64 %CommonFLP%;logfile="%LogDir%tool_contact-x64.log" %CommonFLPErr%;logfile="%LogDir%tool_contact-x64.err"
popd

pushd "%~dp0Source\Lib\FF.AUT.PathCalculation\Source"
MSBuild FF.AUT.PathCalculation.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FF.AUT.PathCalculation.log" %CommonFLPErr%;logfile="%LogDir%FF.AUT.PathCalculation.err"
popd

pushd "%~dp0Source\Control"
MSBuild FF.AUT.Ctrls.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FF.AUT.Ctrls.log" %CommonFLPErr%;logfile="%LogDir%FF.AUT.Ctrls.err"
popd

rem pushd "%~dp0Source\Exe\fc_batch\fc_batch"
rem MSBuild fc_batch.sln %CommonT% %CommonM% %CommonP%;Platform="Win32" %CommonFLP%;logfile="%LogDir%fc_batch.log" %CommonFLPErr%;logfile="%LogDir%fc_batch.err"
rem popd

pushd "%~dp0Source\Exe\FFAUT.DataBackUpRestore\FFAUT.DataBackUpRestore"
MSBuild FFAUT.DataBackupRestore.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FFAUT.DataBackupRestore.log" %CommonFLPErr%;logfile="%LogDir%FFAUT.DataBackupRestore.err"
popd

pushd "%~dp0Source\Exe\FFpsToStlConverter\Source"
MSBuild FFpsToStlConverter.sln %CommonT% %CommonM% %CommonP%;Platform="x64" %CommonFLP%;logfile="%LogDir%FFpsToStlConverter.log" %CommonFLPErr%;logfile="%LogDir%FFpsToStlConverter.err"
popd

pushd "%~dp0Source\Exe\MAKINO.FF.Condition.Def.Editor\MAKINO.FF.Condition.Def.Editor"
MSBuild MAKINO.FF.Condition.Def.Editor.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%MAKINO.FF.Condition.Def.Editor.log" %CommonFLPErr%;logfile="%LogDir%MAKINO.FF.Condition.Def.Editor.err"
popd

pushd "%~dp0Source\Exe\MAKINO.FF.MenuMfput\MAKINO.FF.MenuMfput"
MSBuild MAKINO.FF.MenuMfput.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%MAKINO.FF.MenuMfput.log" %CommonFLPErr%;logfile="%LogDir%MAKINO.FF.MenuMfput.err"
popd

pushd "%~dp0Source\Exe\MillTimeWrap\MillTimeWrap"
MSBuild MillTimeWrap.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%MillTimeWrap.log" %CommonFLPErr%;logfile="%LogDir%MillTimeWrap.err"
popd

pushd "%~dp0Source\Exe\StkConverter"
MSBuild StkConverter.sln %CommonT% %CommonM% %CommonP%;Platform="x64" %CommonFLP%;logfile="%LogDir%StkConverter.log" %CommonFLPErr%;logfile="%LogDir%StkConverter.err"
popd

pushd "%~dp0Source\Exe\STLtoVRML\Source"
MSBuild STLtoVRML.sln %CommonT% %CommonM% %CommonP%;Platform="x64" %CommonFLP%;logfile="%LogDir%STLtoVRML.log" %CommonFLPErr%;logfile="%LogDir%STLtoVRML.err"
popd

pushd "%~dp0Source\Exe\ugi_ff3d_wrapper"
MSBuild ugi_ff3d_wrapper.sln %CommonT% %CommonM% %CommonP%;Platform="x64" %CommonFLP%;logfile="%LogDir%ugi_ff3d_wrapper.log" %CommonFLPErr%;logfile="%LogDir%ugi_ff3d_wrapper.err"
popd

pushd "%~dp0Source\Exe\XmlLogConverter\XmlLogConverter"
MSBuild XmlLogConverter.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%XmlLogConverter.log" %CommonFLPErr%;logfile="%LogDir%XmlLogConverter.err"
popd

pushd "%~dp0Source\Lib\FFAUTtoCAMDataConverter.Data\Source"
MSBuild FFAUTtoCAMDataConverter.Data.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FFAUTtoCAMDataConverter.Data.log" %CommonFLPErr%;logfile="%LogDir%FFAUTtoCAMDataConverter.Data.err"
popd

pushd "%~dp0Source\Exe\FFAUTtoCAMDataConverter"
MSBuild FFAUTtoCAMDataConverter.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FFAUTtoCAMDataConverter.log" %CommonFLPErr%;logfile="%LogDir%FFAUTtoCAMDataConverter.err"
popd

pushd "%~dp0Source\Exe\MachineAttitude\MachineAttitude"
MSBuild MachineAttitude.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%MachineAttitude.log" %CommonFLPErr%;logfile="%LogDir%MachineAttitude.err"
popd

pushd "%~dp0Source\Exe\FFpost_wrapper"
MSBuild FFpost_wrapper.sln %CommonT% %CommonM% %CommonP%;Platform="Any CPU" %CommonFLP%;logfile="%LogDir%FFpost_wrapper.log" %CommonFLPErr%;logfile="%LogDir%FFpost_wrapper.err"
popd

pushd "%~dp0Source\Exe\FFsimAutoStarter"
MSBuild FFsimAutoStarter.sln %CommonT% %CommonM% %CommonP%;Platform="x64" %CommonFLP%;logfile="%LogDir%FFsimAutoStarter.log" %CommonFLPErr%;logfile="%LogDir%FFsimAutoStarter.err"
popd

pushd "%~dp0Source\Exe\fc_batch\fc_batch"
MSBuild fc_batch.sln %CommonT% %CommonM% %CommonP%;Platform="Win32" %CommonFLP%;logfile="%LogDir%fc_batch.log" %CommonFLPErr%;logfile="%LogDir%fc_batch.err"
popd

rem pushd "%~dp0"
rem call build_old_version.bat

