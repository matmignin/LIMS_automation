return

_General:
:*:ol`;::
SendInput, Hello Osvaldo,`n`t Can you please fill out the results for organoleptic test for the following lot(s)?`n %Product% %Batch% `n`nThank you,{up 2}
	return
:*:mm`;::         
			Send, Mat Mignin{tab 2}%DayString%
			return	

_VSCODE_Hotstrings:
	:*r:cd`;::{ctrldown}
	:*r:cu`;::{ctrlup} 
	:*r:ad`;::{altdown}
	:*r:au`;::{altup}
	:*r:sd`;::{shiftdown}
	:*r:su`;::{shiftup}
	:*r:wd`;::{lwindown}
	:*r:wu`;::{lwinup}
	:*R:wt`;::
	SendInput,%wintitle%
	return
	:*R:wm`;::                                   
	SendInput,%wininfo%
	return
	:*R:wp`;::                                   
	SendInput,%process%
	return
	:*R:mp`;::                                   
	SendInput,%mouseposition%
	return
	:*R:wc`;::                                  
	SendInput,%Wincontrol%
	return
	:*R:wl`;::
	SendInput,%WinLocation%
	return
	:*R:tt`;::                                    
	SendInput, tt(){left} 
	return 
	:*R:hs`;::                                   
	InputBox, UserInput, New Hotstring,enter Hotstring,,,,,,,, 
	SendInput, {end}{return}:`*R:%UserInput%``;::`n`t`t`t`t`t`t`t`t`t`t`tSendInput`, {enter}return{up}{end}{shiftup}{ctrldown}{v}{ctrlup}
	return 
	:*R:we`;::                                   
	SendInput, WinExist(`"`"){left 2} 
	return 
	:*R:wa`;::                                    
	SendInput, WinActive(`"`"){left 2} 
	return 
	:*R:tr`;::                                   
	sendraw, tt("")
	SendInput, {left 2} 
	return 
	:*R:c`;::                                                   
	sendraw,{ctrldown}{}{ctrlup}
	SendInput,{left 9}
	return
	:*R:w`;::                                                  
	sendraw,{lwindown}{}{lwinup}
	SendInput,{left 9}
	return
	:*r:a`;::                                                  
	sendraw,{altdown}{}{altup}
	SendInput,{left 8}
	return
	:*r:s`;::                                                  
	sendraw,{shiftdown}{}{shiftup}
	SendInput,{left 10}
	return
	:*r:csw`;::                                              
	:*r:cws`;::                                              
	:*r:scw`;::                                              
	:*r:swc`;::                                              
	:*r:wcs`;::                                              
	:*r:wsc`;::                                              
	sendraw,{shiftdown}{ctrldown}{lwindown}{}{lwinup}{ctrlup}{shiftup}
	SendInput,{left 26}
	return
	:*r:asw`;::                                              
	:*r:aws`;::                                              
	:*r:saw`;::                                              
	:*r:swa`;::                                              
	:*r:was`;::                                              
	:*r:wsa`;::                                              
	sendraw,{shiftdown}{altdown}{lwindown}{}{lwinup}{altup}{shiftup}
	SendInput,{left 25}
	return
	:*r:asc`;::                                              
	:*r:acs`;::                                              
	:*r:sac`;::                                              
	:*r:sca`;::                                              
	:*r:cas`;::                                              
	:*r:csa`;::                                              
	sendraw,{shiftdown}{altdown}{ctrldown}{}{ctrlup}{altup}{shiftup}
	SendInput,{left 25}
	return
	:*r:sc`;::                                                
	:*r:cs`;::                                                
	sendraw,{shiftdown}{ctrldown}{}{ctrlup}{shiftup}
	SendInput,{left 18}
	return
	:*r:sw`;::                                                
	:*r:ws`;::                                                
	sendraw,{shiftdown}{lwindown}{}{lwinup}{shiftup}
	SendInput,{left 18}
	return
	:*r:sa`;::                                                
	:*r:as`;::                                                
	sendraw,{shiftdown}{altdown}{}{altup}{shiftup}
	SendInput,{left 17}
	return
	:*r:ca`;::                                                
	:*r:ac`;::                                                
	sendraw,{altdown}{ctrldown}{}{ctrlup}{altup}
	SendInput,{left 16}
	return
	:*r:wc`;::                                                
	:*r:cw`;::                                                
	sendraw,{ctrldown}{lwindown}{}{lwinup}{ctrlup}
	SendInput,{left 16}
	return 

	:*R:iniw`;::                                            
	sendraw, iniwrite 
	SendInput,{Space}`%`%{,}{Space}data.ini{,}{Space}SavedVariables{,}{Space}
	return
	:*R:inir`;::                                            
	sendraw, iniread 
	SendInput,{space}{,}data.ini{,}{space}SavedVariables{,}{space}
	return
	
	:*R:#ifw`;::                                            
	sendraw, #ifwinactive, 
	return
	:*R:err`;::                                              
	sendraw, if ErrorLevel,
	return
	:*R:rtn::Return
	:*R:r`;::
	SendInput, {end}return
	return 


_WindowNames:
	:*R:iel`;::If ErrorLevel,
	:*R:el`;::ErrorLevel
	:*R:ifwe`;::ifwinexists, 
	:*R:si`;::SendInput, 
	:*:iwe`;::ifwinexists, 
	:*:vb`;::VarBar ahk_exe AutoHotkey.exe 
	:*:varbar`;::VarBar ahk_exe AutoHotkey.exe 
	:*:nu`;::NuGenesis LMS - \\Remote                                            
	:*:main`;::NuGenesis LMS - \\Remote 
	:*:lmswin`;::ahk_exe WFICA32.EXE   
	:*:vs`;::ahk_exe Code.exe
	:*:code`;::ahk_exe Code.exe
	:*:remote`;::ahk_exe mstsc.exe
	:*:firefox`;::ahk_exe firefox.exe
	:*:outlook`;::ahk_exe OUTLOOK.exe
	:*:mail`;::ahk_exe OUTLOOK.exe
	:*:explorer`;::ahk_exe explorer.exe
	:*:explor`;::ahk_exe explorer.exe
	:*:onenote`;::ahk_exe ONENOTE.EXE
	:*:exel`;::ahk_exe EXCEL.EXE
	:*:wb`;::Mats LMS Workbook.xlsb - Excel
	:*:lmswb`;::Mats LMS Workbook.xlsb - Excel
	:*:note`;::ahk_exe ONENOTE.EXE
	:*:exe`;::
	sendinput, ahk_exe %Process%
	return
	
	:*:#ifwalms`;::
		WinGetTitle, winTitle, ahk_exe WFICA32.EXE
		; winactivate, ahk_exe WFICA32.EXE
		; windowInfo()
		; winactivate, ahk_exe Code.exe
		; send % Wintitle
		sendraw, #if winactive("
		sendinput, %winTitle%
		sendraw, ")
		return
	:*:ifwalms`;::
		WinGetTitle, winTitle, ahk_exe WFICA32.EXE
		; winactivate, ahk_exe WFICA32.EXE
		; windowInfo()
		; winactivate, ahk_exe Code.exe
		; send % Wintitle
		sendraw, if winactive("
		sendinput, %winTitle%
		sendraw, ")
		return
	:*:walms`;::
		WinGetTitle, winTitle, ahk_exe WFICA32.EXE
		; winactivate, ahk_exe WFICA32.EXE
		; windowInfo()
		; winactivate, ahk_exe Code.exe
		; send % Wintitle
		sendraw, winactive("
		sendinput, %winTitle%
		sendraw, ")
		return
	:*:lms`;::
		WinGetTitle, winTitle, ahk_exe WFICA32.EXE
		; winactivate, ahk_exe WFICA32.EXE
		; windowInfo()
		; winactivate, ahk_exe Code.exe
		; send % Wintitle
		sendinput, %winTitle%
		return
	:*:clk`;::
		if !MousePosition
			iniread MousePosition, data.ini, SavedVariables, WindowMousePosition 
		sendraw, clk( 
		sendinput % Mouseposition 
		sendraw, )
		return
	:*:click`;::
		if !MousePosition
			iniread MousePosition, data.ini, SavedVariables, WindowMousePosition 
		sendraw, {click 
		sendinput % Mouseposition 
		sendraw, }
		return
	:*:px`;::
	:*:pixel`;::
		if !PixelColor
			iniread PixelColor, data.ini, SavedVariables, PixelColor 
		sendinput % PixelColor 
		return
	:*:cur`;::
	:*:cursor`;::
		if !MousePosition
			iniread MousePosition, data.ini, SavedVariables, WindowMousePosition 
		sendinput % Mouseposition 
		return
	:*:Control`;::
	sendinput, %wincontrol%
	return
	:*:Position`;::
	sendinput, %winPosition%
	return
	:*:mouse`;::
	return
	:*:cursor`;::
	sendinput, %mouseposition%
	return
	:*:click`;::
	sendinput, click, %mouseposition%
	return

	#ifwinactive,                                 

	




_LMS_HOTSTRINGS:
	:*R:mm`;::mmignin
	:*:MM`;::MM{tab}%DateString%
#IfWinActive,ahk_exe WFICA32.EXE
	:*R:#00`;::`#00 capsule / 0.917`" x 0.336`"
	:*R:#00e`;::`#00 elongated capsule / 0.995`" x 0.336`"
	:*R:#3`;::`#3 capsule / 0.626`" x 0.229`"
	:*R:#2`;::`#2 capsule / 0.709`" x 0.250`"
	:*R:#1`;::`#1 capsule / 0.765`" x 0.272`"
	:*R:#0`;::`#0 capsule / 0.854`" x 0.300`"
	:*R:USP`;::Meets USP Requirements
	:*R:fr`;::Fixing Rotation

	:*R:7/16`;::`Round / 0.4375`"
	:*R:5.5 oblong`;::Oblong / 0.750`" x 0.313`"
	:*R:5.5 oval`;::Oval / 0.625`" x 0.344`""
	:*R:5 oblong`;::Oblong / 0.750`" x 0.250`""
	:*:1c`;::`Each (1) capsule contains {ctrl down}{left}{ctrl up}{left}
	:*:2c`;::`Each two (2) capsules contains {ctrl down}{left}{ctrl up}{left}
	:*:3c`;::`Each three (3) capsules contains {ctrl down}{left}{ctrl up}{left}
	:*:4c`;::`Each four (4) capsules contains {ctrl down}{left}{ctrl up}{left}
	:*:5c`;::`Each five (5) capsules contains {ctrl down}{left}{ctrl up}{left}
	:*:6c`;::`Each six (6) capsules contains {ctrl down}{left}{ctrl up}{left}
	:*:7c`;::`Each seven (7) capsules contains {ctrl down}{left}{ctrl up}{left}
	:*:1t`;::`Each (1) tablet contains {ctrl down}{left}{ctrl up}{left}
	:*:2t`;::`Each two (2) tablets contains {ctrl down}{left}{ctrl up}{left}
	:*:3t`;::`Each three (3) tablets contains {ctrl down}{left}{ctrl up}{left}
	:*:4t`;::`Each four (4) tablets contains {ctrl down}{left}{ctrl up}{left}
	:*:5t`;::`Each five (5) tablets contains {ctrl down}{left}{ctrl up}{left}
	:*:6t`;::`Each six (6) tablets contains {ctrl down}{left}{ctrl up}{left}
	:*:7t`;::`Each seven (7) tablets contains {ctrl down}{left}{ctrl up}{left}
	:*:H`;::Heavy Metals `*
	:*:H1`;::`* Heavy Metals results are based on a daily dose of (1) capsule{ctrl down}{left}{left}{ctrl up}{right}
	:*:H2`;::`* Heavy Metals results are based on a daily dose of twi (2) capsules{ctrl down}{left}{left}{ctrl up}{right}
	:*:stick`;::stick packet ( g){left 3}{tab}Blend+{tab}
	:*:1blend`;::
	ProductTab.Blends(1,ShapeAndSize)
	:*:1blend`;::
	ProductTab.Blends(2,ShapeAndSize)
	:*:2blend`;::
	ProductTab.Blends(3,ShapeAndSize)
	:*:3blend`;::
	ProductTab.Blends(4,ShapeAndSize)
	:*:4blend`;::
	ProductTab.Blends(5,ShapeAndSize)
	:*:5blend::
	ProductTab.Blends(6,ShapeAndSize)
	:*:1scoop::
	ProductTab.Blends(1,"scoop")
	:*:2scoop::
	ProductTab.Blends(2,"scoops")
	:*:3scoop::
	ProductTab.Blends(3,"scoops")
	:*:4scoop::
	ProductTab.Blends(4,"scoops")
	:*:5scoop::
	ProductTab.Blends(5,"scoops")
	:*:6scoop::
	ProductTab.Blends(6,"scoops")
	:*:1stick::
	ProductTab.Blends(1,"stick packet")
	:*:2stick::
	ProductTab.Blends(2,"stick packets")
	:*:3stick::
	ProductTab.Blends(3,"stick packets")
	:*:1Packet::
	ProductTab.Blends(1,"packet")
	:*:2packet::
	ProductTab.Blends(2,"packets")
	:*:3packet::
	ProductTab.Blends(3,"packets")
	return











