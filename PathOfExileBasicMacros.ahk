#Requires AutoHotkey v2.0

; All shortcuts
; F1: Remaining command.
; F2: Goes to channel 820.
; F9: Attempts to go to the players hideout.
; 4th or 5th mouse buttons (these are usually the back and forward buttons on the mouse, if any): Triggers the /exit command. Useful for hardcore or high level softcore play. Note that the asterisk * ignores modifiers like Shift.
F1::Remaining()
F2::Channel820()
F9::GotoHideout()
*XButton1::Exit()
*XButton2::Exit()

; Delays
chatDelay := 2

isPoeWindowActive() {
	; More info: https://www.autohotkey.com/docs/v1/lib/WinActive.htm
	return WinActive("ahk_exe PathOfExile_x64.exe") or WinActive("ahk_class POEWindowClass")
}

; Executes a single chat command.
; Only executes if the Path of Exile window is active.
; Blocks input and uses the chatDelay.
ExecuteSingleChatCommand(command) {
	if !isPoeWindowActive() {
		return
	}

	BlockInput(true)
	Send("{Enter}")
	Sleep(chatDelay)
	Send(command)
	Sleep(chatDelay)
	Send("{Enter}")
	BlockInput(false)
}

Channel820() {
	ExecuteSingleChatCommand("/global 820")
}

Remaining() {
	ExecuteSingleChatCommand("/remaining")	
}

GotoHideout() {
	ExecuteSingleChatCommand("/hideout")	
}

Exit() {
	ExecuteSingleChatCommand("/exit")
}
