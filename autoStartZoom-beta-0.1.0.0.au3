#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=autoStartZoom-x64-beta-0100.exe
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#comments-start
this script is published as it is under MIT License
created by ben kohberg > b.kohberg@gmail.com
latest version > https://github.com/ben-5K/AutoControlZoom
#comments-end
#include <Date.au3>
#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>

# delete this part here, if you don't need to check for the Time
# for example, you run the script from a button on the desktop
# delete all lines until > END OF DELETE PART 1
# funktion > check time and wait, end or run script
Func checktime()
	Local $wday = _DateDayOfWeek(@WDAY)
	if $wday = "Wednesday" Then
		if _NowTime(4) <= "18:20" Then
			SplashTextOn("Info", "To early to start Zoom", 500, 50, -1, -1, $DLG_TEXTLEFT, "")
			Sleep(3000)
			Exit 0
		ElseIf _NowTime(4) >= "18:40" Then
			SplashTextOn("starting Zoom", "starting Zoom", 180, 50, -1, -1, $DLG_TEXTLEFT, "")
			Sleep(3000)
			SplashOff()
		Else
			SplashTextOn("Please Wait", "starting Zoom at 18:40 PM", 300, 50, -1, -1, $DLG_TEXTLEFT, "")
			Sleep(5000)
			SplashOff()
			Sleep(10000)
			checktime()
		Endif
	ElseIf $wday = "Saturday" Then
		if _NowTime(4) <= "16:20" Then
			SplashTextOn("Info", "To early to start Zoom", 500, 50, -1, -1, $DLG_TEXTLEFT, "")
			Sleep(3000)
			Exit 0
		ElseIf _NowTime(4) >= "16:40" Then
			SplashTextOn("starting Zoom", "starting Zoom", 180, 50, -1, -1, $DLG_TEXTLEFT, "")
			Sleep(3000)
			SplashOff()
		Else
			SplashTextOn("Please Wait", "starting Zoom at 16:40 PM", 300, 50, -1, -1, $DLG_TEXTLEFT, "")
			Sleep(5000)
			SplashOff()
			Sleep(10000)
			checktime()
		Endif
	Else
		Exit 0
	EndIf
EndFunc



	checktime()

# END OF DELETE PART 1


	#Info Splash Screen about Zoom starting
	SplashTextOn("Info", "Run Zoom", 180, 50, 40, 40, $DLG_TEXTLEFT, "")
		Sleep(1000)
		SplashOff()


	#zoom über die exe starten
	#ShellExecute("\\srv-dc01\homedir$\benkohberg\system\Zoom\bin\Zoom.exe")
	ShellExecute(@AppDataDir&"\Zoom\bin\Zoom.exe")
	WinWait("Zoom Cloud-Meetings")
	Sleep(3000)
	#Title Zoom Cloud-Meetings = wenn nicht in Zoom angemeldet
	$active = WinGetTitle("[ACTIVE]")
	if $active == "Zoom Cloud-Meetings" Then
		SplashTextOn("Info", "Zoom not logged in", 500, 50, 40, 40, $DLG_TEXTLEFT, "")
		Sleep(1500)
		SplashOff()
		Send("{TAB}{ENTER}")
		Sleep(3000)

	Elseif $active == "Zoom" Then
		SplashTextOn("Info", "Zoom logged in", 500, 50, 40, 40, $DLG_TEXTLEFT, "")
		Sleep(1500)
		SplashOff()
		Send("{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}")
		Sleep(3000)
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Error - Please call Support")
	EndIf
		WinWait("Zoom")
		Send("{0}{0}{0}{0}{0}{0}{0}{0}{0}{0}{0}")
		Sleep(500)
		Send("{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}")
		Sleep(1000)
		WinWait("Geben Sie den Meetingkenncode ein")
		Sleep(1000)
		Send("{0}{0}{0}{0}{0}{0}")
		Sleep(500)
		Send("{TAB}{ENTER}")
		Sleep(1000)
		WinWait("Videovorschau")
		Sleep(1000)
		Send("{TAB}{ENTER}")
		Sleep(10000)

	#auto off aktivieren
	SplashTextOn("Info", "Automatic Shutdown Setup", 270, 70, 40, 40, $DLG_TEXTLEFT, "")
		Sleep(1000)
		SplashOff()
	Run(@ComSpec & " /c " & " shutdown.exe /s /t 9000", "", @SW_HIDE)
	Sleep(1000)

	#maus und tastatur sperren
	SplashTextOn("Info", "Lock Mouse and Keyboard", 270, 70, 40, 40, $DLG_TEXTLEFT, "")
		Sleep(1000)
		SplashOff()
	ShellExecute("C:\systemd\KeyFreeze\KeyFreeze.exe")

	#quit autoit
	Sleep(30000)
	Exit 0








