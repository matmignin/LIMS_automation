class click{


 


OKay(){
 global
  if winactive("Results Definition")
   clk(1336,592)
  else If WinActive("Result Editor")
   clk(370,660)
  else if Edit Ingredient
   clk(265, 561)
  else if winactive("Result Entry")
   clk(1028, 808)
  else if winActive("Results Definition - \\Remote")
   clk(951, 751)
  else if winActive("Microsoft Excel Security Notice - \\Remote")
   send, !y
  else if winActive("Reason For Change - \\Remote")
   clk(229, 236)
  else if winactive("New Document - \\Remote")
    clk(415, 360)
  else if winActive("Edit specification - \\Remote")
    clk(323, 621)

  else if winexist("Error - \\Remote") {
    winactivate
    clk(148, 104)
    winactivate, Register new samples - \\Remote
    clk(181, 104, 2)
    send, %product%{enter}
  }
  ; else if winActive("")

  ; else if winexist("")

  else if winexist("Change Configuration - \\Remote")
   clk(131, 296,"Change Configuration - \\Remote")
  Else
   send,{enter}
   return
 }

 esc(){
  ; if winactive("Results Definition")
   ; click 1336,592
  ; else If WinActive("Result Editor")
   ; click 370,660
  ; else if Edit Ingredient
   ; click 265, 561
  ; else if winactive("Result Entry")
   ; click, 1028, 808
; #Ifwinactive, NuGenesis LMS - \\Remote
; #Ifwinactive, Select methods tests - \\Remote
; #IfWinActive, Results Definition - \\Remote
; #ifwinactive, Edit test (Field Configuration:
; #Ifwinactive, Result Entry - \\Remote ;Enter Test Results window
; #ifwinactive, Register new samples - \\Remote
; #IfWinActive, ahk_exe WFICA32.EXE
  if winexist("Change Configuration - \\Remote")
   click 342, 296
  Else
   send,{esc}
   return
 }



 Save(){
  if winactive("Edit Product")
   click 275, 578
  else If Winactive("Composition")
   click 1236, 888
  else If Winactive("Test Definition Editor ")
   Click 341, 618
  Else
   return
 }
 edit(){
  if winactive("Results Definition")
   click 78,63
  else
   click 84, 65
  return
 }
 Add(){
  if winactive("Formulation")
   click, 73, 280
  else
   click 45, 65
  return
 }
 Requests_tab(){
  click 865,83
  return
 }
 MyWork_Tab(){
  click 761,44
  return
 }
 Mywork_Searchbar(){
  click 500,127, 2
  return
 }
 EditTest_1(){
  ifwinnotactive, NuGenesis LMS - \\Remote
  WinActivate, NuGenesis LMS - \\Remote
  Send,{click, 56, 784 }
  return
 }
 EnterResults(){
  WinActivate, NuGenesis LMS - \\Remote
  WinActivate, NuGenesis LMS - \\Remote
  click 74, 900
  return
 }
 MoveOverTest_1(){
  if winactive("Select Methods Tests")
   Send,{Click}{click 506, 341}
  Else
   return
 }
 Orient(){
  if winactive("Result Entry")
   click 843, 202, 2
  else if winactive("Test Definition Editor")
   Click, 187, 200


  Else
   return
 }
 CopySpecTemplate(){
  WinActivate, NuGenesis LMS - \\Remote
  click 102, 289 ;copy into new spec
  WinWaitActive, Edit specification - Remote, ,1
  if ErrorLevel
   winactivate, Edit specification - Remote
  ; click 317, 83
  ; sleep 100
  return
 }
 NewSampleTemplate(){
  WinActivate, NuGenesis LMS - \\Remote
  click 103, 325
  return
 }
 RegisterNewSamples(){
  WinActivate, Register new samples - \\Remote
   click 181, 103, 2
   sleep 50
   ; click 181, 103,
   sleep 300
   send, %product%{enter}
   sleep 300
   return
 }
 TestDefinitionEditor_Results(){
  winactivate, Test Definition Editor - \\Remote
  			click 236, 246 ;click resulst
     sleep 200
     return
 }
 EditSampleTemplate(){
  WinActivate, NuGenesis LMS - \\Remote
  click 70, 518
  winwaitactive, Edit sample template - \\Remote,, 5
 }
}