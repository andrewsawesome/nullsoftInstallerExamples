# Replaces the default "Nullsoft Installer X.XX" branding at the bottom. If you want that instead, comment out this line.
BrandingText "Example Installer"

# define name of installer
OutFile "ExampleInstaller.exe"
 
# define installation directory
InstallDir $PROGRAMFILES\MyApplication
 
# For putting files in "Program Files" directory
RequestExecutionLevel admin
 
# start default section
Section "main"

 
    # set the installation directory as the destination for the following actions
    SetOutPath $INSTDIR

    # specify file to go in output path
    File ExampleApplication.exe

    # create the uninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"
 
    # create a shortcut named "new shortcut" in the start menu programs directory
    CreateShortcut "$SMPROGRAMS\ExampleApplication.lnk" "$INSTDIR\MyApplication.exe"
    
    # point the new shortcut at the program uninstaller
    CreateShortcut "$SMPROGRAMS\ExampleApplication Uninstaller.lnk" "$INSTDIR\uninstall.exe"
SectionEnd
 
# uninstaller section start
Section "uninstall"
 
    
    # Remove the links from the start menu
    Delete "$SMPROGRAMS\ExampleApplication.lnk"
    Delete "$SMPROGRAMS\ExampleApplication Uninstaller.lnk"
 
    #Delete Installed Files
    Delete "$INSTDIR\ExampleApplication.exe"    

    # Delete the uninstaller
    Delete "$INSTDIR\uninstall.exe"
 
    RMDir $INSTDIR
# uninstaller section end
SectionEnd