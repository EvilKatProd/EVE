Option Explicit
Dim sh, fso, here, html, edge, chrome, uri
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
here = fso.GetParentFolderName(WScript.ScriptFullName)
html = here & "\EVE.html"
If Not fso.FileExists(html) Then WScript.Quit
uri = "file:///" & Replace(html, "\", "/")
edge = sh.ExpandEnvironmentStrings("%ProgramFiles(x86)%") & "\Microsoft\Edge\Application\msedge.exe"
If Not fso.FileExists(edge) Then edge = sh.ExpandEnvironmentStrings("%ProgramFiles%") & "\Microsoft\Edge\Application\msedge.exe"
chrome = sh.ExpandEnvironmentStrings("%ProgramFiles%") & "\Google\Chrome\Application\chrome.exe"
If Not fso.FileExists(chrome) Then chrome = sh.ExpandEnvironmentStrings("%LocalAppData%") & "\Google\Chrome\Application\chrome.exe"
If fso.FileExists(edge) Then
  sh.Run Chr(34) & edge & Chr(34) & " --app=" & Chr(34) & uri & Chr(34), 1, False
ElseIf fso.FileExists(chrome) Then
  sh.Run Chr(34) & chrome & Chr(34) & " --app=" & Chr(34) & uri & Chr(34), 1, False
Else
  sh.Run "cmd /c start " & Chr(34) & Chr(34) & " " & Chr(34) & html & Chr(34), 0, False
End If
