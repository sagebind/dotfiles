SetTitleMatchMode, 2

!`::
#`::
WinGet, CurrentProgram, ProcessPath, A
WinActivateBottom, ahk_exe %CurrentProgram%, , Program Manager
return

^!Space::Send {Media_Play_Pause}
^!Left::Send {Media_Prev}
^!Right::Send {Media_Next}
