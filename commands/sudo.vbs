' //***************************************************************************
' // ***** Script Header *****
' //
' // File:      Sudo.vbs
' // Additional files required:  Sudo.cmd
' //
' // Purpose:   To provide a command line method of launching applications that
' //            prompt for elevation (Run as Administrator).
' //
' // Usage:     (Not used directly.  Launched from Sudo.cmd)
' //
' // Version:   1.1.3
' // Date :     21-dec-2022
' //
' // History:
' // 1.0.0   01-Feb-2007  Created initial version used internally.
' // 1.0.1   01-Mar-2007  Added detailed usage output.
' // 1.0.0	 23-Oct-2013  Released on chocolatey
' // 1.0.1   08-Sep-2014  chocolatey framework changes required new version
' // 1.0.2   12-Jun-2015  chocolatey framework changes required new version
' // 1.1.0   20-Apr-2018  Added the option of keeping current directory 
' //                      context by using the inserted . or _ as first command argument 
' //                      when used a context cmd shell window is opened for setting 
' //                      current directory context using _ hides this window 
' // 1.1.1   04-Feb-2019  Added the -V or -version option to query the version of sudo
' // 1.1.2   27-dec-2019  Retain current directory even with special chars (janusblack)
' // 1.1.3   21-dec-2022  Fix choco uninstall sudo not deleting sudo.exe shim (gerardog)
' // ***** End Header *****
' //***************************************************************************

Set objShell = CreateObject("Shell.Application")
Set objWshShell = WScript.CreateObject("WScript.Shell")
Set objWshProcessEnv = objWshShell.Environment("PROCESS")

' Get execution context information from sudo.cmd passed in through environment variables.
strCommandLine = objWshProcessEnv("SUDO_CMDLINE")
strApplicationArgument1 = objWshProcessEnv("SUDO_ARG1")
strApplicationArgument2 = objWshProcessEnv("SUDO_ARG2")
strCurrentDirectory = objWshProcessEnv("SUDO_CD")
strCurrentDrive = objWshProcessEnv("SUDO_DRIVE")

If (WScript.Arguments.Count >= 1) Then
    strFlag = WScript.Arguments(0)
    If (strFlag = "") OR (strFlag="help") OR (strFlag="/h") OR (strFlag="\h") OR (strFlag="-h") _
        OR (strFlag = "\?") OR (strFlag = "/?") OR (strFlag = "-?") OR (strFlag="h") _
        OR (strFlag = "?") Then
        DisplayUsage
		WScript.Quit
    ElseIf (strFlag="-V") OR (strFlag="--version") Then
        DisplayVersion
		WScript.Quit
    Else

        boolKeepCurrentDirectoryContext = ((strApplicationArgument1 = ".") OR (strApplicationArgument1 = "_"))
        boolHideCurrentDirectoryContextCommandWindow = (strApplicationArgument1 = "_")

        If (boolKeepCurrentDirectoryContext = True) Then
            
            If (Len(strApplicationArgument2) > 0) Then  
                strApplication = strApplicationArgument2
                strArguments = Right(strCommandLine, (Len(strCommandLine) - (Len(strApplicationArgument1) + Len(strApplicationArgument2) + 1)))
            Else
                strApplication = "cmd"
                strArguments = ""
            End If

            'Shell.ShellExecute method https://msdn.microsoft.com/en-us/library/windows/desktop/gg537745(v=vs.85).aspx

            If (boolHideCurrentDirectoryContextCommandWindow) Then            
                vShow = 0 'Open the application with a hidden window
                'vShow = 2 'Open the application with a minimized window
                'vShow = 7 'Open the application with a minimized window. The active window remains active.
            Else
                'vShow = 1  'Open the application with a normal window. If the window is minimized or maximized, the system restores it to its original size and position.
                vShow = 10 'Open the application with its window in the default state specified by the application.
            End If

            'WScript.Echo "objShell.ShellExecute ""cmd"",""/C """ & strCurrentDrive & " && cd " & strCurrentDirectory & " && " & strApplication & " " & strArguments & """, """ & strCurrentDirectory & """, ""runas"", " & vShow
            objShell.ShellExecute "cmd","/C """ & strCurrentDrive & " && cd " & strCurrentDirectory & " && " & strApplication & " " & strArguments & """", strCurrentDirectory, "runas", vShow

        Else
            strApplication = strApplicationArgument1
            strArguments = Right(strCommandLine, (Len(strCommandLine) - Len(strApplication)))
        
            'WScript.Echo "objShell.ShellExecute """ & strApplication & """, """ & strArguments & """, """ & strCurrentDirectory & """, ""runas"" "
            objShell.ShellExecute strApplication, strArguments, strCurrentDirectory, "runas"

            'Note that strCurrentDirectory is not respected when runas is used, why the piped commands on a command shell is in use above 

        End if
         
    End If
Else
    DisplayUsage
    WScript.Quit
End If

Sub DisplayVersion

    WScript.Echo "Sudo version 1.1.3" & vbCrLf & _
        "https://chocolatey.org/packages/Sudo" & vbCrLf & _
        "https://github.com/janhebnes/chocolatey-packages/tree/master/Sudo" & vbCrLf

End Sub

Sub DisplayUsage
    WScript.Echo "Original of Sudo command: https://community.chocolatey.org/packages/Sudo"
End Sub