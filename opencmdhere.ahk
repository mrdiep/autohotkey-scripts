#b::openbashhere()
; Press Win + B to open Bash Prompt in the current directory.
openbashhere() {
    If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
        WinHWND := WinActive()
        For win in ComObjCreate("Shell.Application").Windows
            If (win.HWND = WinHWND) {
		currdir := SubStr(win.LocationURL, 9)
		currdir := RegExReplace(currdir, "%20", " ")
                Break
            }
	    Run, "C:\Program Files\Git\git-bash.exe" --cd=%currdir%
    }

}

#c::opencmdhere()
; Press Win + C to open Command Prompt in the current directory.

opencmdhere() {
    If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
        WinHWND := WinActive()
        For win in ComObjCreate("Shell.Application").Windows
            If (win.HWND = WinHWND) {
		currdir := SubStr(win.LocationURL, 9)
		currdir := RegExReplace(currdir, "%20", " ")
                Break
            }
    }
    Run, cmd, % currdir ? currdir : "C:\"
}

#+c::opencmdhereadmin()
; Press Win + Shift + C to open admin Command Prompt in the current directory.

opencmdhereadmin() {
    If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
        WinHWND := WinActive()
        For win in ComObjCreate("Shell.Application").Windows
            If (win.HWND = WinHWND) {
		currdir := SubStr(win.LocationURL, 9)
		currdir := RegExReplace(currdir, "%20", " ")
		currdir := RegExReplace(currdir, "/", "\")
                Break
            }
    }

    Run *RunAs cmd.exe /k pushd %currdir%
}