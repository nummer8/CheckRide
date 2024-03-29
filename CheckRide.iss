; Complete package (client, cerver and source code)
; Use CheckRideOnTheRun.iss to generate a temporary client helper app.
#define MyAppName "CheckRide Helper"
#define MyAppVersion "1.0"
#define MyAppPublisher "Reinier Olislagers"
#define MyAppURL "https://bitbucket.org/reiniero/checkride"
#define MyAppExeName "CheckRideHelper.exe"
#define MyAppSupportPhone "You know my number"
#define MyAppDescription "Remote support tool for helped party"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{F3E60E4F-DFEB-4FA2-8987-F3DB84133704}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppComments=Software to help support customers.
AppContact={#MyAppPublisher}
AppReadmeFile=https://bitbucket.org/reiniero/checkride
AppSupportPhone={#MyAppSupportPhone}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}

;We don't do this as we want to give people the choice to show this or not
;InfoAfterFile=Readme.txt
LicenseFile=License.txt

VersionInfoCompany=Reinier Olislagers
VersionInfoDescription={#MyAppDescription}
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion={#MyAppVersion}
VersionInfoTextVersion={#MyAppVersion}
VersionInfoVersion={#MyAppVersion}

DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=setupoutput\
OutputBaseFilename=CheckRideHelperSetup
SetupIconFile=Source\CheckRide.ico

; compress as much as we can:
Compression=lzma2/Ultra64
SolidCompression=true
; used for setup.exe generated by inno:
InternalCompressLevel=Max
MergeDuplicateFiles=true
AppCopyright=Reinier Olislagers et al

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: output\CheckRide.exe; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
Source: source\CheckRide.conf; DestDir: {app}; Components: "Helper"; Flags: confirmoverwrite;
; for later modification of CheckRideNoResource:
; we don't do resource editing now, so...
;Source: Source\checkrideconfig.rc; DestDir: {app}; Components: "Helper"; 
Source: output\CheckRideHelper.exe; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
;Not necessary anymore
;Source: output\CheckRideNoResource.exe; DestDir: {app}; Flags: ignoreversion; Components: "Helper"; 
Source: Source\external\vncviewer.exe; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
Source: Source\external\libeay32.dll; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
; Resource editing doesn't work with the exes we output, so leave it.
;Source: Source\external\resedit.exe; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
; sas.dll, schook.dll needed for customisation of checkride. Checkride also needs other files
; (e.g. stunnel stuff) but these are already present for checkridehelper anyway.
Source: Source\external\sas.dll; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
Source: Source\external\schook.dll; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
Source: Source\external\ssleay32.dll; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
Source: Source\external\stunnel.exe; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
Source: Source\external\stunnel.pem; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
Source: Source\external\ultravnc.ini; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
Source: Source\external\zlib1.dll; DestDir: {app}; Flags: ignoreversion; Components: "Helper";
Source: License.TXT; DestDir: {app}; Components: "Helper Source";
Source: Readme.TXT; DestDir: {app}; Components: "Helper Source"; 

; Once again for source code:
Source: Source\external\libeay32.dll; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
Source: Source\external\sas.dll; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
Source: Source\external\schook.dll; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
Source: Source\external\ssleay32.dll; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
Source: Source\external\stunnel.exe; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
Source: Source\external\stunnel.pem; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
Source: Source\external\ultravnc.ini; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
Source: Source\external\vncviewer.exe; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
;Not needed anymore; we use schooks
;Source: Source\external\vnchooks.dll; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
Source: Source\external\winvnc.exe; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";
Source: Source\external\zlib1.dll; DestDir: {app}\Source\external; Flags: ignoreversion; Components: "Source";

; All external source can be included in source code as well:
; However, this really bloats the installer, so left at
; https://bitbucket.org/reiniero/checkride/src 
;Source: Source\external\source\*.*; DestDir: {app}\Source\External; Components: "Source";

Source: Source\checkride.conf; DestDir: {app}\Source; Components: "Source";
Source: Source\CheckRide.ico; DestDir: {app}\Source; Components: "Source"; 
Source: Source\CheckRide.lpi; DestDir: {app}\Source; Components: "Source"; 
Source: Source\CheckRide.lpr; DestDir: {app}\Source; Components: "Source";
Source: Source\CheckRideHelper.ico; DestDir: {app}\Source; Components: "Source"; 
Source: Source\CheckRideHelper.lpi; DestDir: {app}\Source; Components: "Source"; 
Source: Source\CheckRideHelper.lpr; DestDir: {app}\Source; Components: "Source"; 
Source: Source\checkridehelperunit.lfm; DestDir: {app}\Source; Components: "Source"; 
Source: Source\checkridehelperunit.pas; DestDir: {app}\Source; Components: "Source"; 
Source: Source\manifest.rc; DestDir: {app}\Source; Components: "Source"; 
Source: Source\manifest.xml; DestDir: {app}\Source;  Components: "Source";
Source: Source\stunnelhelped.conf.template; DestDir: {app}\Source; Components: "Source"; 
Source: Source\stunnelhelper.conf.template; DestDir: {app}\Source; Components: "Source"; 
Source: Source\unit1.lfm; DestDir: {app}\Source; Components: "Source"; 
Source: Source\unit1.pas; DestDir: {app}\Source; Components: "Source";

Source: CheckRide.iss; DestDir: {app}; Components: "Source";
 
 

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}
Name: {commondesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon
Name: "{group}\Uninstall {#MyAppName}"; Filename: {uninstallexe}; Comment: "Uninstall application"; 

[Run]
;CheckRideHelper doesn't seem to nneed elevation, so we can do this.
Filename: {app}\{#MyAppExeName}; Flags: nowait postinstall skipifsilent
Filename: "{app}\README.TXT"; Description: "View the README file"; Flags: postinstall shellexec skipifsilent


[Types]
Name: full; Description: "Full install: installs everything"; 
Name: server; Description: "Server/helper only, no source code"; 
Name: custom; Description: "Custom installation"; Flags: IsCustom; 

[Components]
Name: Helper; Description: "Server & Client: Software to take over other peoples' screens."; Flags: checkablealone; Types: full server custom; 
Name: Source; Description: "Source code for the program. Useful for developers."; Flags: checkablealone; Types: full custom;
