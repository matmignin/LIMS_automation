;/*
;===========================================
;  FindText - Capture screen image into text and then find it
;  https://autohotkey.com/boards/viewtopic.php?f=6&t=17834
;
;  Author  : FeiYue
;  Version : 8.4
;  Date    : 2021-04-02
;
;  Usage:  (required AHK v1.1.31+)
;  1. Capture the image to text string.
;  2. Test find the text string on full Screen.
;  3. When test is successful, you may copy the code
;     and paste it into your own script.
;     Note: Copy the "FindText()" function and the following
;     functions and paste it into your own script Just once.
;  4. The more recommended way is to save the script as
;     "FindText.ahk" and copy it to the "Lib" subdirectory
;     of AHK program, instead of copying the "FindText()"
;     function and the following functions, add a line to
;     the beginning of your script: #Include <FindText>
;
;===========================================
;*/


if (!A_IsCompiled and A_LineFile=A_ScriptFullPath)
  FindText.Gui("Show")


;===== Copy The Following Functions To Your Own Code Just once =====


;--------------------------------
;  FindText - Capture screen image into text and then find it
;--------------------------------
;  returnArray := FindText(
;      X1 --> the search scope's upper left corner X coordinates
;    , Y1 --> the search scope's upper left corner Y coordinates
;    , X2 --> the search scope's lower right corner X coordinates
;    , Y2 --> the search scope's lower right corner Y coordinates
;    , err1 --> Fault tolerance percentage of text       (0.1=10%)
;    , err0 --> Fault tolerance percentage of background (0.1=10%)
;    , Text --> can be a lot of text parsed into images, separated by "|"
;    , ScreenShot --> if the value is 0, the last screenshot will be used
;    , FindAll --> if the value is 0, Just find one result and return
;    , JoinText --> if the value is 1, Join all Text for combination lookup
;    , offsetX --> Set the max text offset (X) for combination lookup
;    , offsetY --> Set the max text offset (Y) for combination lookup
;    , dir --> Nine directions for searching: up, down, left, right and center
;  )
;
;  The function returns a second-order array containing
;  all lookup results, Any result is an associative array
;  {1:X, 2:Y, 3:W, 4:H, x:X+W//2, y:Y+H//2, id:Comment}
;  if no image is found, the function returns 0.
;  All coordinates are relative to Screen, colors are in RGB format
;
;  If the return variable is set to "ok", ok.1 is the first result found.
;  Where ok.1.1 is the X coordinate of the upper left corner of the found image,
;  and ok.1.2 is the Y coordinate of the upper left corner of the found image,
;  ok.1.3 is the width of the found image, and ok.1.4 is the height of the found image,
;  ok.1.x <==> ok.1.1+ok.1.3//2 ( is the Center X coordinate of the found image ),
;  ok.1.y <==> ok.1.2+ok.1.4//2 ( is the Center Y coordinate of the found image ),
;  ok.1.id is the comment text, which is included in the <> of its parameter.
;  ok.1.x can also be written as ok[1].x, which supports variables. (eg: ok[A_Index].x)
;
;--------------------------------

FindText(args*)
{
  return FindText.FindText(args*)
}

Class FindText
{  ;// Class Begin

static bind:=[], bits:=[], Lib:=[]

__New()
{
  this.bind:=[], this.bits:=[], this.Lib:=[]
}

__Delete()
{
  if (this.bits.hBM)
    DllCall("DeleteObject", "Ptr",this.bits.hBM)
}

FindText(x1:=0, y1:=0, x2:=0, y2:=0, err1:=0, err0:=0
  , text:="", ScreenShot:=1, FindAll:=1
  , JoinText:=0, offsetX:=20, offsetY:=10, dir:=1)
{
  local
  SetBatchLines, % (bch:=A_BatchLines)?"-1":"-1"
  centerX:=Round(x1+x2)//2, centerY:=Round(y1+y2)//2
  if (x1*x1+y1*y1+x2*x2+y2*y2<=0)
    n:=150000, x:=y:=-n, w:=h:=2*n
  else
    x:=Min(x1,x2), y:=Min(y1,y2), w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
  bits:=this.GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy,zw,zh)
  , info:=[]
  Loop, Parse, text, |
    if IsObject(j:=this.PicInfo(A_LoopField))
      info.Push(j)
  if (w<1 or h<1 or !(num:=info.MaxIndex()) or !bits.Scan0)
  {
    SetBatchLines, %bch%
    return 0
  }
  arr:=[], in:={zx:zx, zy:zy, zw:zw, zh:zh
  , sx:x-zx, sy:y-zy, sw:w, sh:h}, k:=0
  For i,j in info
    k:=Max(k, j.2*j.3), in.comment .= j.11
  VarSetCapacity(s1, k*4), VarSetCapacity(s0, k*4)
  , VarSetCapacity(ss, 2*(w+2)*(h+2))
  , FindAll:=(dir=9 ? 1 : FindAll)
  , JoinText:=(num=1 ? 0 : JoinText)
  , allpos_max:=(FindAll or JoinText ? 10240 : 1)
  , VarSetCapacity(allpos, allpos_max*8)
  Loop, 2
  {
    if (err1=0 and err0=0) and (num>1 or A_Index>1)
      err1:=0.05, err0:=0.05
    Loop, % JoinText ? 1 : num
    {
      this.PicFind(arr, in, info, A_Index, err1, err0
        , FindAll, JoinText, offsetX, offsetY, dir
        , bits, ss, s1, s0, allpos, allpos_max)
      if (!FindAll and arr.MaxIndex())
        Break
    }
    if (err1!=0 or err0!=0 or arr.MaxIndex() or info.1.12)
      Break
  }
  if (dir=9)
    arr:=this.Sort2(arr, centerX, centerY)
  SetBatchLines, %bch%
  return arr.MaxIndex() ? arr:0
}

PicFind(arr, in, info, index, err1, err0
  , FindAll, JoinText, offsetX, offsetY, dir
  , bits, ByRef ss, ByRef s1, ByRef s0
  , ByRef allpos, allpos_max)
{
  local
  static MyFunc:=""
  if (!MyFunc)
  {
    x32:=""
    . "5557565383EC648B6C247883FD050F84DD0800008B8C24BC000000C744240C00"
    . "00000085C90F8E8E0F000031FF31C0896C2478C74424080000000031C9C74424"
    . "1400000000897C241089C5908D7426008B5C24108BBC24B80000008B7424148B"
    . "54240C01DF89D829DE8B9C24B800000003B424B400000085DB7E5A893C2489EB"
    . "89D7EB198BAC24B000000083C70483C00189548D0083C101390424742B837C24"
    . "780389FA0F45D0803C063175D78BAC24AC00000083C70483C00139042489549D"
    . "008D530189D375D58BB424B80000000174241489DD83442408018BBC24A00000"
    . "008B442408017C24108BBC248C000000017C240C398424BC0000000F854FFFFF"
    . "FF896C24088B6C2478894C240C31C08B74240839B424C00000008B7C240C0F4D"
    . "F039BC24C4000000897424080F4CC739C68944240C0F4DC683FD038904240F84"
    . "940900008B84248C0000008BB424980000000FAF84249C000000C1E602897424"
    . "3401F08BB4248C000000894424308B8424A0000000F7D885ED8D048689442420"
    . "0F857E0300008B44247CC744241C00000000C744242400000000C1E8100FB6E8"
    . "8B44247C0FB6C4894424100FB644247C894424148B8424A0000000C1E0028944"
    . "242C8B8424A400000085C00F8EC60000008B7C24048B442430896C24188BAC24"
    . "A000000085ED0F8E8D0000008BB424880000008B6C242403AC24A800000001C6"
    . "0344242C8944242803842488000000894424040FB67E028B4C24180FB6160FB6"
    . "46012B5424142B44241089FB01CF29CB8D8F000400000FAFC00FAFCBC1E00B0F"
    . "AFCBBBFE05000029FB0FAFDA01C10FAFD301CA399424800000000F93450083C6"
    . "0483C5013B74240475A98B9424A0000000015424248B4424288344241C010344"
    . "24208B74241C39B424A40000000F854AFFFFFF897C24048B8424A00000002B84"
    . "24B8000000C644244B00C644244A00C744245000000000C744245C0000000089"
    . "4424548B8424A40000002B8424BC000000894424388B84248400000083E80183"
    . "F8070F87EC05000083F803894424400F8EE70500008B44245C8B742450894424"
    . "508974245C8B742454397424500F8FB30C00008B4424548B7424088B9C248800"
    . "0000C744243000000000894424588B8424AC0000008D04B08B7424408944244C"
    . "89F083E0018944244489F083E003894424608B44245C8B74243839F00F8F7C01"
    . "0000837C2460018B7C24500F4F7C24588974242C8944241C897C243C8D742600"
    . "8B7C24448B44242C85FF0F4444241C837C244003894424200F8FC2020000807C"
    . "244A008B44243C894424288B4424280F85CA020000807C244B000F85A0030000"
    . "0FAF8424A00000008B14248B74242085D28D2C300F8E850000008BBC24C40000"
    . "008B9424A800000031C08BB424C0000000896C24248B4C2408895C241801EA89"
    . "7C24148B2C248B7C240C89742410669039C17E1C8BB424AC0000008B1C8601D3"
    . "803B00750B836C2410010F888004000039C77E1C8BB424B00000008B1C8601D3"
    . "803B00740B836C2414010F886004000083C00139E875B98B6C24248B5C24188B"
    . "44240885C074278BB424A80000008B8424AC0000008D0C2E8B74244C8D742600"
    . "8B1083C00401CA39F0C6020075F28B442420038424980000008B7424308BBC24"
    . "C80000008904F78B4424280384249C0000008944F70483C6013BB424CC000000"
    . "897424307D308344241C01836C242C018B44241C394424380F8DA2FEFFFF8344"
    . "245001836C2458018B442450394424540F8D5CFEFFFF8B44243083C4645B5E5F"
    . "5DC2580083FD010F84DB09000083FD020F84EE0600008B44247C0FB67C247CC7"
    . "44242800000000C744242C00000000C1E8100FB6D08B44247C89D50FB6DC8B84"
    . "2480000000C1E8100FB6C88B84248000000029CD01CA896C243889DD89542410"
    . "0FB6F40FB684248000000029F501DE896C241489FD8974241829C501F8894424"
    . "248B8424A0000000896C241CC1E002894424348B8424A400000085C00F8EF5FC"
    . "FFFF8B4C24308B6C24388B8424A000000085C00F8E880000008B842488000000"
    . "8B54242C039424A800000001C8034C243489CF894C243003BC2488000000EB34"
    . "395C24107C3D394C24147F37394C24187C3189F30FB6F33974241C0F9EC33974"
    . "24240F9DC183C00483C20121D9884AFF39C7741E0FB658020FB648010FB63039"
    . "DD7EBD31C983C00483C201884AFF39C775E28BB424A00000000174242C8B4C24"
    . "308344242801034C24208B442428398424A40000000F854FFFFFFFE937FCFFFF"
    . "8B442420807C244A00894424288B44243C894424208B4424280F8436FDFFFF0F"
    . "AF84248C0000008B7424208D04B08B34248944241485F60F8EF1FDFFFF8B4424"
    . "048BAC24C000000031D289DFF7D8896C241889442410EB57908DB42600000000"
    . "894C242489E90FB6F58B4C242429F10FB6F389EB0FB6DB29DE3B4C24040F9FC3"
    . "3B4424100F9CC009C33B4C24100F9CC009C33B7424040F9FC008C3754C3B7424"
    . "107C4683C2013B14240F84B10100008B8424AC0000008B5C2414031C908B8424"
    . "B00000008B2C900FB6441F0289E9C1E9100FB6C929C83B4424040FB64C1F010F"
    . "B61C1F0F8E77FFFFFF836C24180179B3896C247C89FBE96BFDFFFF908D742600"
    . "0FAF84248C0000008B7424208B0C248D04B0894424100344247C85C90FB67403"
    . "010FB67C03020FB6040389742414894424180F8EF6FCFFFF8B8424C400000031"
    . "F6894424348B8424C0000000894424248B442404897C2404908DB42600000000"
    . "397424087E658B8424AC0000008B4C24108B7C2404030CB00FB6440B020FB654"
    . "0B010FB60C0B2B5424142B4C241889C501F829FD8DB8000400000FAFD20FAFFD"
    . "C1E20B0FAFFDBDFE05000029C50FAFE901FA0FAFCD01D1398C2480000000730B"
    . "836C2424010F88A00000003974240C7E618B8424B00000008B4C24108B7C2404"
    . "030CB00FB6440B020FB6540B010FB60C0B2B5424142B4C241889C501F829FD8D"
    . "B8000400000FAFD20FAFFDC1E20B0FAFFDBDFE05000029C50FAFE901FA0FAFCD"
    . "01D1398C24800000007207836C243401783983C6013B34240F8522FFFFFF8944"
    . "2404E9E7FBFFFF89F68DBC27000000008B5C2418E90DFCFFFF8DB42600000000"
    . "896C247C89FBE9C3FBFFFF89442404E9F2FBFFFFC7442440000000008B442438"
    . "8B7424548944245489742438E914FAFFFF8B8424800000008B94248000000089"
    . "04248B44247C85D2894424048B8424B40000000F854E0200008B0089C78B8424"
    . "B800000081E7FFFFFF008D88FFFFFF3F8B8424BC0000008D1C8D0000000083E8"
    . "010FAF8424B800000089C28B8424B40000008B04908944241025FFFFFF0039F8"
    . "0F95C089C68B8424B40000008B048889F125FFFFFF0039F80F95C008C175218B"
    . "8424B80000008BB424B40000008D8402FFFFFF3F8B048625FFFFFF0039F87405"
    . "BFFFFFFFFF8B8424BC00000085C00F8E1F0600008D43048B0C24C74424140000"
    . "0000C744241000000000C7442418000000008944241C896C24788BB424B80000"
    . "0085F67E5D8BB424B40000008B5424188B4424148B6C241C8D349601C529C689"
    . "34248B34248B140681E2FFFFFF0039D7741E8BB424AC0000008D1C8D00000000"
    . "89048E8BB424B000000083C10189141E83C00439C575CB8BB424B80000000174"
    . "241883442410018B94248C0000008B44241001542414398424BC0000000F8577"
    . "FFFFFF89C88B6C2478890C240FAF8424C0000000C1F808898424C00000008B04"
    . "2483F8017E6E8BB424B0000000896C24788BAC24B00000008D7E04BE01000000"
    . "897C241089C78B44241089F28B58FC9089C129E939180F85D403000083C20183"
    . "C00439D77FEA83C601834424100439F775D48B6C2478EB1C8B44247C31D2F7B4"
    . "24B80000000FAF84248C0000008D04908944247C83FD058B8424A00000000F94"
    . "44244A83FD030F9444244B038424980000002B8424B8000000894424548B8424"
    . "9C000000038424A40000002B8424BC000000894424388B84249C000000C78424"
    . "9C00000000000000894424508B842498000000C7842498000000000000008944"
    . "245CE96EF7FFFF0FBE088D5801C744247C00000000BEFFFFFFFF8B44247C85C9"
    . "753BE9F7FEFFFF89F68DBC270000000089C28BBC24AC0000000FB7C0C1EA1089"
    . "F10FAF94248C000000D1F98D048289048F31C00FBE0B83C30185C9743E8D51D0"
    . "83FA0977068D04808D044283F92F7405803B0075DE83C601F7C60100000074B0"
    . "8BBC24B000000089F283C301D1FA8904970FBE4BFF31C085C975C28944247CE9"
    . "7AFEFFFF8B8424A00000008BB4249C0000000FAF8424A400000083EE01038424"
    . "A800000089742410894424188B8424A0000000038424980000008944241C8B84"
    . "249C000000038424A400000039F00F8C070100008BB4249800000083C001C744"
    . "2424000000008944242889E82B84249800000083EE018974242C8B7424100FAF"
    . "B4248C00000089C2897424208B74241C01F28D7E01895424308B44242C394424"
    . "1C0F8C960000008B5424108B5C24208B742424035C24342BB42498000000039C"
    . "2488000000C1EA1F0374241889542414EB4B398424900000007E4B807C241400"
    . "75448B542410399424940000007E370FB64BFE0FB653FD83C3040FB66BF86BD2"
    . "4B6BC92601D189EAC1E20429EA01CAC1FA078854060183C00139F8741889C2C1"
    . "EA1F84D274ACC64406010083C00183C30439F875E88B74243001742424834424"
    . "10018B94248C0000008B44241001542420394424280F853EFFFFFF8B8424A000"
    . "00008B8C24A400000083C00285C98944241C0F8E1FF5FFFF8B8424A40000008B"
    . "6C2418036C241CC744241801000000C74424200000000083C001894424248B84"
    . "24A0000000896C241483C004894424288B8424800000008B9424A000000085D2"
    . "0F8EA20000008B4424148B5C24208B742428039C24A800000089C12B8C24A000"
    . "000089C201C6894C24108DB6000000000FB642010FB62ABF010000000344247C"
    . "39E8723D0FB66A0239E872358B4C24100FB669FF39E872290FB66EFF39E87221"
    . "0FB669FE39E872190FB62939E872120FB66EFE39E8720A0FB63E39F80F92C189"
    . "CF89F9834424100183C201880B83C60183C3018B7C2410397C241475938BBC24"
    . "A0000000017C242083442418018B54241C8B74241801542414397424240F8534"
    . "FFFFFF89842480000000E908F4FFFF9039D60F842EFCFFFF8B9424AC00000003"
    . "8C24AC0000008B14B28B19895424148B9424AC000000891CB28B5C241083C601"
    . "8B542414834424100439F789118B138954247C8B1089138B54247C89100F85C3"
    . "FBFFFFE9EAFBFFFF8B44247C8BB424A400000031EDC7442414000000008D4801"
    . "8B8424A0000000C1E107C1E00285F6894C247C894424180F8E7AF3FFFF896C24"
    . "108B4424308B6C247C8B9C24A000000085DB7E668B8C24880000008B5C241403"
    . "9C24A800000001C1034424188944241C0384248800000089C78DB42600000000"
    . "0FB651020FB641010FB6316BC04B6BD22601C289F0C1E00429F001D039C50F97"
    . "0383C10483C30139F975D58BBC24A0000000017C24148B44241C834424100103"
    . "4424208B74241039B424A40000000F8575FFFFFFE9DEF2FFFFC7442408000000"
    . "00E947F1FFFFC744243000000000E923F5FFFFC78424C000000000000000E911"
    . "FBFFFF90909090909090909090909090"
    x64:=""
    . "4157415641554154555756534881EC88000000488BAC24F0000000488B9C2430"
    . "01000083F9054189CB89542468448944241044898C24E8000000488BBC243801"
    . "0000488BB424400100000F8467090000448B8C24580100004531E44531FF4585"
    . "C90F8ED60000004489742414448BB4245001000031C931C04889AC24F0000000"
    . "48899C24300100004531ED4531E44531FFC74424080000000089CD89C30F1F00"
    . "4585F67E644863542408478D142E4489E8480394244801000089E9EB1D0F1F00"
    . "83C0014D63CC83C1044183C4014883C2014139C24689048E742A4183FB034189"
    . "C8440F45C0803A3175D683C0014D63CF83C1044183C7014883C2014139C24689"
    . "048F75D6440174240883C3014403AC242001000003AC24F8000000399C245801"
    . "00000F8578FFFFFF448B742414488BAC24F0000000488B9C243001000031C044"
    . "39BC2460010000440F4DF84439A42468010000440F4DE04539E74589E5450F4D"
    . "EF4183FB030F84180A00008B8424F80000008B8C24100100000FAF8424180100"
    . "008D04888B8C24F8000000894424208B842420010000F7D84585DB8D04818944"
    . "24080F85A40300008B4C24684889C84189CB0FB6C441C1EB1089C20FB6C1450F"
    . "B6DB4189C28B84242801000085C00F8E360100008B8424200100004489642428"
    . "31C944896C24304889B42440010000448B6C2420448B6424108BB42420010000"
    . "C1E00244897C24384889AC24F00000004889BC24380100004189CFC744241400"
    . "000000894424184489D548899C243001000089D785F60F8E88000000488B9C24"
    . "F00000004963C54531D24C8D4C030248635C241448039C24300100000F1F4000"
    . "450FB631410FB651FE410FB641FF29EA4489Xbutton1501DE4189D0418D9600040000"
    . "4429D929F80FAFD10FAFC00FAFD1C1E00B8D0402BAFE0500004429F2410FAFD0"
    . "410FAFD001D04139C4420F9304134983C2014983C1044439D67FA544036C2418"
    . "017424144183C70144036C24084439BC24280100000F8559FFFFFF448B7C2438"
    . "448B642428448B6C2430488BAC24F0000000488B9C2430010000488BBC243801"
    . "0000488BB424400100008B8424200100002B842450010000C644245700C64424"
    . "5600C744246C00000000C744247800000000894424708B8424280100002B8424"
    . "58010000894424448B8424E800000083E80183F8070F873F06000083F8038944"
    . "244C0F8E3A0600008B4424788B4C246C8944246C894C24788B4C2470394C246C"
    . "0F8F800D00008B4424708B4C244C4889BC2438010000C7442430000000008944"
    . "2474418D47FF488D4487044489EF4589E54C8BA42438010000488944246089C8"
    . "83E0018944245089C883E0038944247C8B4424788B4C244439C80F8F3C010000"
    . "837C247C018B54246C0F4F542474894C24288944240889542448660F1F440000"
    . "8B44245085C08B4424280F44442408837C244C03894424140F8FC4020000807C"
    . "2456008B442448894424380F85CC020000807C2457000F85B40300008B4C2438"
    . "0FAF8C2420010000034C241485FF7E4F448B942468010000448B8C2460010000"
    . "31C04439F889C27D184189C84503048442803C0300750A4183E9010F88830000"
    . "004439EA7D1189CA031486803C130074064183EA01786D4883C00139C77FC345"
    . "85FF741D4C8B4424604C89E00F1F400089CA03104883C0044C39C0C604130075"
    . "EF8B4C24308B542414039424100100004C8B94247001000089C801C048984189"
    . "14828B54243803942418010000418954820489C883C0013B8424780100008944"
    . "24307D308344240801836C2428018B442408394424440F8DE4FEFFFF8344246C"
    . "01836C2474018B44246C394424700F8D9CFEFFFF8B4424304881C4880000005B"
    . "5E5F5D415C415D415E415FC34183FB010F84D40A00004183FB020F8448070000"
    . "8B542468448B542410C74424380000000089D0440FB6C2C1E810440FB6C84889"
    . "D00FB6CC4489D04589CBC1E810894C24180FB6D04C89D00FB6C44129D34401CA"
    . "89C18B44241829C8034C241889442430410FB6C24589C24129C24401C0448B84"
    . "2428010000894424188B84242001000044895424144189CA31C9C1E0024585C0"
    . "894424280F8E20FDFFFF448974243C44896C24484889BC2438010000448B7424"
    . "20448B6C24308BBC242001000044897C244044896424444589D74889B4244001"
    . "00004189D489CE85FF7E734963C64C63D631D2488D4405024901DAEB360F1F00"
    . "4539C47C404139CD7F3B4139CF7C3644394C2414410F9EC044394C24180F9DC1"
    . "4883C0044421C141880C124883C20139D77E24440FB6000FB648FF440FB648FE"
    . "4539C37EBB31C94883C00441880C124883C20139D77FDC440374242801FE8344"
    . "24380144037424088B442438398424280100000F856EFFFFFF448B74243C448B"
    . "7C2440448B642444448B6C2448488BBC2438010000488BB42440010000E928FC"
    . "FFFF8B442414807C245600894424388B442448894424140F8434FDFFFF8B4424"
    . "388B4C24140FAF8424F800000085FF8D04880F8EA9FDFFFF4589F344896C243C"
    . "448B94246001000031D241F7DB44897C24204189C14989DDEB53660F1F440000"
    . "894C24180FB6CF4189CF8B4C24184429F9440FB6FB4529F84439Xbutton110F9FC744"
    . "39D80F9CC04109C74439D90F9CC04109C74539F00F9FC04108C7754E4539D87C"
    . "494883C20139D70F8EE3010000458B04948B1C964501C889D9418D4002C1E910"
    . "0FB6C948980FB644050029C8418D48014D63C04439F0460FB64405004863C90F"
    . "B64C0D000F8E76FFFFFF4183EA0179B1895C2468448B7C24204C89EB448B6C24"
    . "3CE91EFDFFFF662E0F1F8400000000008B4424388B4C24140FAF8424F8000000"
    . "8D048889C10344246885FF8D50024863D2440FB65415008D500148980FB64405"
    . "004863D20FB65415000F8E92FCFFFF448B8C2460010000448B9C246801000048"
    . "895C24584C8964241889CB48897424204189C489D644894C243C44895C244045"
    . "31C94539F94589C87D71488B442418428B148801DA8D42024898440FB6740500"
    . "8D42014863D20FB654150048980FB64405004589F34501D6418D8E0004000045"
    . "29D34429E2410FAFCB29F00FAFC0410FAFCB41BBFE050000C1E00B4529F3440F"
    . "AFDA01C8410FAFD301C239542410730B836C243C010F88AB0000004539E87D6D"
    . "488B442420428B148801DA8D42024898440FB67405008D42014863D20FB65415"
    . "0048980FB64405004589F04501D6418D8E000400004529D04429E2410FAFC829"
    . "F00FAFC0410FAFC841B8FE050000C1E00B4529F0440FAFC201C8410FAFD001C2"
    . "395424107207836C24400178394983C1014439CF0F8F08FFFFFF488B5C24584C"
    . "8B642418488B742420E953FBFFFF6690895C2468448B7C24204C89EB448B6C24"
    . "3CE93BFBFFFF488B5C24584C8B642418488B742420E96AFBFFFFC744244C0000"
    . "00008B4424448B4C247089442470894C2444E9C1F9FFFF8B442410448B742468"
    . "85C04189C5488B8424480100000F85410200008B00488B8C24480100004C8B8C"
    . "24480100004189C2894424088B8424580100004181E2FFFFFF0083E8010FAF84"
    . "245001000089C248638424500100008B4481FC25FFFFFF004439D04863C2418B"
    . "04810F95C125FFFFFF004439D00F95C008C1751A8B84245001000001D0489841"
    . "8B4481FC25FFFFFF004439D0740641BAFFFFFFFF448B84245801000031C031C9"
    . "31D24585C00F8EA8060000448B8C245001000044899C24D00000004189C34889"
    . "AC24F000000048899C243001000089D5448974240889CB4585C97E40488B8C24"
    . "480100004863C531D24C8D34814489D9418B049625FFFFFF004139C2740F4D63"
    . "C54183C50142890C87428904864883C20183C1044139D17FD74401CD83C30144"
    . "039C24F8000000399C245801000075A78B842460010000448B742408448B9C24"
    . "D0000000488BAC24F0000000488B9C2430010000410FAFC5C1F8088984246001"
    . "00004183FD017E77488D47044C8D4E04448974240841BA010000004989C6458B"
    . "41FC4C89C84489D20F1F8400000000004889C14829Xbutton1439000F85A104000083"
    . "C2014883C0044139D57FE54183C2014983C6044983C1044539D575C2448B7424"
    . "08EB1C8B44246831D2F7B424500100000FAF8424F80000008D04908944246841"
    . "83FB058B8424200100000F944424564183FB030F94442457038424100100002B"
    . "842450010000894424708B842418010000038424280100002B84245801000089"
    . "4424448B842418010000C7842418010000000000008944246C8B842410010000"
    . "C78424100100000000000089442478E934F7FFFF0FBE00488B8C244801000031"
    . "D241B8FFFFFFFFC7442468000000004C8D490185C0752DE9E6FEFFFF0F1F4000"
    . "89D10FB7D2C1E9100FAF8C24F80000008D149189148731D2410FBE014983C101"
    . "85C0743B8D48D083F90977068D14928D145183F82F74064180390075DB4183C0"
    . "014489C0D1F841F6C001489874B2891486410FBE0131D24983C10185C075C589"
    . "542468E97AFEFFFF8B8424200100008B8C24180100000FAF84242801000083E9"
    . "0189CA48984801D848894424088B84242001000003842410010000894424148B"
    . "8424180100000384242801000039C80F8C770100008B8C241001000083C00148"
    . "899C243001000089442428C74424380000000089D3448974244444897C244883"
    . "E901448964244C4889B424400100004189CA894C243C8B8C24F8000000428D04"
    . "95000000000FAFCA89442420489848894424304489D82B842410010000894C24"
    . "188B4C24144189C34101CB448D510144895C2440448B9C24000100008B44243C"
    . "394424140F8CAB0000008B4C24188B5424204189DE488B7424304C6344243841"
    . "C1EE1F4C0344240801CA4C63F94863D24C8D4C15004829D6EB56660F1F440000"
    . "4139C37E544584F6754F399C24080100007E46410FB64902410FB6510183C001"
    . "4983C0016BD24B6BC92601D14A8D140E4983C104460FB6243A4489E2C1E20444"
    . "29E201D1C1F907418848FF4139C2741D89C2C1EA1F84D274A783C00141C60000"
    . "4983C1044983C0014139C275E38B7424400174243883C3018BB424F800000001"
    . "742418395C24280F852FFFFFFF448B742444448B7C2448448B64244C488B9C24"
    . "30010000488BB424400100008B842420010000448B94242801000083C0024585"
    . "D20F8E83F4FFFF488B4C2408489844897C24404889442418448B7C24684889B4"
    . "2440010000C744240801000000488D440101C744241400000000448974243C48"
    . "89C18B8424280100004889CE83C001894424384863842420010000488D500348"
    . "F7D048894424288B84242001000048895424208B54241083E8014883C0014889"
    . "442430448B8C24200100004585C90F8EAF000000488B44242048634C24144C8D"
    . "0C30488B4424284801D94C8D0430488B4424304C8D34304889F0660F1F440000"
    . "0FB610440FB650FF41BB010000004401FA4439D2724A440FB650014439D27240"
    . "450FB650FF4439D27236450FB651FF4439D2722C450FB650FE4439D27222450F"
    . "B6104439D27219450FB651FE4439D2720F450FB6114439D2410F92C30F1F4000"
    . "4883C0014488194983C1014883C1014983C0014C39F075888B8C242001000001"
    . "4C2414834424080148037424188B442408394424380F8528FFFFFF448B74243C"
    . "448B7C244089542410488BB42440010000E914F3FFFF662E0F1F840000000000"
    . "4139D20F8462FBFFFF4801F9418B16448B014589068911418B098B10894C2468"
    . "4189118908E941FBFFFF8B8424200100008B5424684531DBC744241400000000"
    . "C1E00283C201894424188B842428010000C1E2078954246885C00F8EAAF2FFFF"
    . "44897C24284889B42440010000448B7C2468448B9424200100008B7424204489"
    . "7424384585D27E554C637424144863C64531C0488D4C05024901DE0F1F440000"
    . "0FB6110FB641FF440FB649FE6BC04B6BD22601C24489C8C1E0044429C801D041"
    . "39C7430F9704064983C0014883C1044539C27FCC0374241844015424144183C3"
    . "010374240844399C24280100007594448B742438448B7C2428488BB424400100"
    . "00E904F2FFFFC744243000000000E921F4FFFFC784246001000000000000E97C"
    . "FAFFFF90909090909090909090909090"
    this.MCode(MyFunc, A_PtrSize=8 ? x64:x32)
  }
  num:=info.MaxIndex(), j:=info[index]
  , text:=j.1, w:=j.2, h:=j.3
  , e1:=(!j.12 ? Floor(j.4*err1) : j.6)
  , e0:=(!j.12 ? Floor(j.5*err0) : j.7)
  , mode:=j.8, color:=j.9, n:=j.10, comment:=j.11
  , sx:=in.sx, sy:=in.sy, sw:=in.sw, sh:=in.sh
  if (JoinText and index>1)
  {
    x:=in.x, y:=in.y, sw:=Min(x+offsetX+w,sx+sw), sx:=x, sw-=sx
    , sh:=Min(y+offsetY+h,sy+sh), sy:=Max(y-offsetY,sy), sh-=sy
  }
  ok:=!bits.Scan0 ? 0 : DllCall(&MyFunc
    , "int",mode, "uint",color, "uint",n, "int",dir
    , "Ptr",bits.Scan0, "int",bits.Stride
    , "int",in.zw, "int",in.zh
    , "int",sx, "int",sy, "int",sw, "int",sh
    , "Ptr",&ss, "Ptr",&s1, "Ptr",&s0
    , (mode=5 && n=0 ? "Ptr":"AStr"),text
    , "int",w, "int",h, "int",e1, "int",e0
    , "Ptr",&allpos, "int",allpos_max)
  pos:=[]
  Loop, % ok
    pos.Push( NumGet(allpos, 8*A_Index-8, "uint")
    , NumGet(allpos, 8*A_Index-4, "uint") )
  Loop, % ok
  {
    x:=pos[2*A_Index-1], y:=pos[2*A_Index]
    if (!JoinText)
    {
      x1:=x+in.zx, y1:=y+in.zy
      , arr.Push( {1:x1, 2:y1, 3:w, 4:h
      , x:x1+w//2, y:y1+h//2, id:comment} )
    }
    else if (index=1)
    {
      in.x:=x+w, in.y:=y, in.minY:=y, in.maxY:=y+h
      Loop, % num-1
        if !this.PicFind(arr, in, info, A_Index+1, err1, err0
        , FindAll, JoinText, offsetX, offsetY, 5
        , bits, ss, s1, s0, allpos, 1)
          Continue, 2
      x1:=x+in.zx, y1:=in.minY+in.zy
      , w1:=in.x-x, h1:=in.maxY-in.minY
      , arr.Push( {1:x1, 2:y1, 3:w1, 4:h1
      , x:x1+w1//2, y:y1+h1//2, id:in.comment} )
    }
    else
    {
      in.x:=x+w, in.y:=y
      , (y<in.minY && in.minY:=y)
      , (y+h>in.maxY && in.maxY:=y+h)
      return 1
    }
    if (!FindAll and arr.MaxIndex())
      return
  }
}

GetBitsFromScreen(ByRef x, ByRef y, ByRef w, ByRef h
  , ScreenShot:=1, ByRef zx:="", ByRef zy:=""
  , ByRef zw:="", ByRef zh:="")
{
  local
  static Ptr:="Ptr"
  bits:=this.bits
  if (!ScreenShot)
  {
    zx:=bits.zx, zy:=bits.zy, zw:=bits.zw, zh:=bits.zh
    if IsByRef(x)
      w:=Min(x+w,zx+zw), x:=Max(x,zx), w-=x
      , h:=Min(y+h,zy+zh), y:=Max(y,zy), h-=y
    return bits
  }
  bch:=A_BatchLines, cri:=A_IsCritical
  Critical
  if (id:=this.BindWindow(0,0,1))
  {
    WinGet, id, ID, ahk_id %id%
    WinGetPos, zx, zy, zw, zh, ahk_id %id%
  }
  if (!id)
  {
    SysGet, zx, 76
    SysGet, zy, 77
    SysGet, zw, 78
    SysGet, zh, 79
  }
  bits.zx:=zx, bits.zy:=zy, bits.zw:=zw, bits.zh:=zh
  , w:=Min(x+w,zx+zw), x:=Max(x,zx), w-=x
  , h:=Min(y+h,zy+zh), y:=Max(y,zy), h-=y
  if (zw>bits.oldzw or zh>bits.oldzh or !bits.hBM)
  {
    hBM:=bits.hBM
    , bits.hBM:=this.CreateDIBSection(zw, zh, bpp:=32, ppvBits)
    , bits.Scan0:=(!bits.hBM ? 0:ppvBits)
    , bits.Stride:=((zw*bpp+31)//32)*4
    , bits.oldzw:=zw, bits.oldzh:=zh
    , DllCall("DeleteObject", Ptr,hBM)
  }
  if (bits.hBM) and !(w<1 or h<1)
  {
    mDC:=DllCall("CreateCompatibleDC", Ptr,0, Ptr)
    oBM:=DllCall("SelectObject", Ptr,mDC, Ptr,bits.hBM, Ptr)
    if (id)
    {
      if (mode:=this.BindWindow(0,0,0,1))<2
      {
        hDC2:=DllCall("GetDCEx", Ptr,id, Ptr,0, "int",3, Ptr)
        DllCall("BitBlt",Ptr,mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
        , Ptr,hDC2, "int",x-zx, "int",y-zy, "uint",0xCC0020|0x40000000)
        DllCall("ReleaseDC", Ptr,id, Ptr,hDC2)
      }
      else
      {
        hBM2:=this.CreateDIBSection(zw, zh)
        mDC2:=DllCall("CreateCompatibleDC", Ptr,0, Ptr)
        oBM2:=DllCall("SelectObject", Ptr,mDC2, Ptr,hBM2, Ptr)
        DllCall("PrintWindow", Ptr,id, Ptr,mDC2, "uint",(mode>3)*3)
        DllCall("BitBlt",Ptr,mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
        , Ptr,mDC2, "int",x-zx, "int",y-zy, "uint",0xCC0020|0x40000000)
        DllCall("SelectObject", Ptr,mDC2, Ptr,oBM2)
        DllCall("DeleteDC", Ptr,mDC2)
        DllCall("DeleteObject", Ptr,hBM2)
      }
    }
    else if IsFunc(k:="GetBitsFromScreen2")
    {
      bits.mDC:=mDC, %k%(bits, x-zx, y-zy, w, h)
      , zx:=bits.zx, zy:=bits.zy, zw:=bits.zw, zh:=bits.zh
    }
    else
    {
      win:=DllCall("GetDesktopWindow", Ptr)
      hDC:=DllCall("GetWindowDC", Ptr,win, Ptr)
      DllCall("BitBlt",Ptr,mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
      , Ptr,hDC, "int",x, "int",y, "uint",0xCC0020|0x40000000)
      DllCall("ReleaseDC", Ptr,win, Ptr,hDC)
    }
    if this.CaptureCursor(0,0,0,0,0,1)
      this.CaptureCursor(mDC, zx, zy, zw, zh)
    DllCall("SelectObject", Ptr,mDC, Ptr,oBM)
    DllCall("DeleteDC", Ptr,mDC)
  }
  Critical, %cri%
  SetBatchLines, %bch%
  return bits
}

CreateDIBSection(w, h, bpp:=32, ByRef ppvBits:=0, ByRef bi:="")
{
  local
  VarSetCapacity(bi, 40, 0), NumPut(40, bi, 0, "int")
  , NumPut(w, bi, 4, "int"), NumPut(-h, bi, 8, "int")
  , NumPut(1, bi, 12, "short"), NumPut(bpp, bi, 14, "short")
  return DllCall("CreateDIBSection", "Ptr",0, "Ptr",&bi
    , "int",0, "Ptr*",ppvBits:=0, "Ptr",0, "int",0, "Ptr")
}

PicInfo(text)
{
  local
  static info:=[]
  if !InStr(text,"$")
    return
  key:=(r:=StrLen(text))<1000 ? text
    : DllCall("ntdll\RtlComputeCrc32", "uint",0
    , "Ptr",&text, "uint",r*(1+!!A_IsUnicode), "uint")
  if (info[key])
    return info[key]
  v:=text, comment:="", seterr:=e1:=e0:=len1:=len0:=0
  ; You Can Add Comment Text within The <>
  if RegExMatch(v,"<([^>]*)>",r)
    v:=StrReplace(v,r), comment:=Trim(r1)
  ; You can Add two fault-tolerant in the [], separated by commas
  if RegExMatch(v,"\[([^\]]*)]",r)
  {
    v:=StrReplace(v,r), r:=StrSplit(r1, ",")
    , seterr:=1, e1:=r.1, e0:=r.2
  }
  color:=StrSplit(v,"$").1, v:=Trim(SubStr(v,InStr(v,"$")+1))
  mode:=InStr(color,"##") ? 5
    : InStr(color,"-") ? 4 : InStr(color,"#") ? 3
    : InStr(color,"**") ? 2 : InStr(color,"*") ? 1 : 0
  color:=RegExReplace(color, "[*#\s]")
  if (mode=5) and (v~="[^\s\w/]") and FileExist(v)
  {
    if !IsObject(r:=info["file:" v])
    {
      if !(hBM:=LoadPicture(v))
        return
      VarSetCapacity(bm, size:=(A_PtrSize=8 ? 32:24), 0)
      DllCall("GetObject","Ptr",hBM,"int",size,"Ptr",&bm)
      w:=NumGet(bm,4,"int"), h:=Abs(NumGet(bm,8,"int"))
      hBM2:=this.CreateDIBSection(w, h, 32, ppvBits)
      this.CopyHBM(hBM2, 0, 0, hBM, 0, 0, w, h)
      DllCall("DeleteObject", "Ptr",hBM)
      if (w<1 or h<1 or !ppvBits)
        return
      info["file:" v]:=r:=[ppvBits, w, h]
    }
    v:=r.1, w:=r.2, h:=r.3, n:=0, len1:=1<<8
  }
  else if (mode=5)
  {
    v:=Trim(StrReplace(RegExReplace(v,"\s"),",","/"),"/")
    r:=StrSplit(v,"/"), n:=r.MaxIndex()//3
    if (!n)
      return
    v:="", x1:=x2:=r.1, y1:=y2:=r.2, i:=j:=-2
    ListLines, % (lls:=A_ListLines)?"Off":"Off"
    Loop, % n
      x:=r[i+=3], y:=r[i+1]
      , (x<x1 && x1:=x), (x>x2 && x2:=x)
      , (y<y1 && y1:=y), (y>y2 && y2:=y)
    Loop, % n
      v.=Format("/{:d}/{:d}", (r[j+=3]-x1)|((r[j+1]-y1)<<16)
      , Floor("0x" StrReplace(r[j+2],"0x")))
    ListLines, %lls%
    v:=SubStr(v,2), w:=x2-x1+1, h:=y2-y1+1, len1:=n
  }
  else
  {
    r:=StrSplit(v,"."), w:=r.1
    , v:=this.base64tobit(r.2), h:=StrLen(v)//w
    if (w<1 or h<1 or StrLen(v)!=w*h)
      return
    if (mode=4)
    {
      r:=StrSplit(StrReplace(color,"0x"),"-")
      , color:=Round("0x" r.1), n:=Round("0x" r.2)
    }
    else
    {
      r:=StrSplit(color,"@")
      , color:=r.1, n:=Round(r.2,2)+(!r.2)
      , n:=Floor(512*9*255*255*(1-n)*(1-n))
    }
    StrReplace(v,"1","",len1), len0:=StrLen(v)-len1
  }
  e1:=Floor(len1*e1), e0:=Floor(len0*e0)
  return info[key]:=[v, w, h, len1, len0, e1, e0
    , mode, color, n, comment, seterr]
}

CopyHBM(hBM1, x1, y1, hBM2, x2, y2, w2, h2)
{
  local
  static Ptr:="Ptr"
  mDC1:=DllCall("CreateCompatibleDC", Ptr,0, Ptr)
  oBM1:=DllCall("SelectObject", Ptr,mDC1, Ptr,hBM1, Ptr)
  mDC2:=DllCall("CreateCompatibleDC", Ptr,0, Ptr)
  oBM2:=DllCall("SelectObject", Ptr,mDC2, Ptr,hBM2, Ptr)
  DllCall("BitBlt", Ptr,mDC1
  , "int",x1, "int",y1, "int",w2, "int",h2
  , Ptr,mDC2, "int",x2, "int",y2, "uint",0xCC0020)
  DllCall("SelectObject", Ptr,mDC2, Ptr,oBM2)
  DllCall("DeleteDC", Ptr,mDC2)
  DllCall("SelectObject", Ptr,mDC1, Ptr,oBM1)
  DllCall("DeleteDC", Ptr,mDC1)
}

CopyBits(Scan01,Stride1,x1,y1,Scan02,Stride2,x2,y2,w2,h2)
{
  local
  ListLines, % (lls:=A_ListLines)?"Off":"Off"
    p1:=Scan01+(y1-1)*Stride1+x1*4
  , p2:=Scan02+(y2-1)*Stride2+x2*4, w2*=4
  Loop, % h2
    DllCall("RtlMoveMemory", "Ptr",p1+=Stride1
    , "Ptr",p2+=Stride2, "Ptr",w2)
  ListLines, %lls%
}

; Bind the window so that it can find images when obscured
; by other windows, it's equivalent to always being
; at the front desk. Unbind Window using FindText.BindWindow(0)

BindWindow(bind_id:=0, bind_mode:=0, get_id:=0, get_mode:=0)
{
  local
  bind:=this.bind
  if (get_id)
    return bind.id
  if (get_mode)
    return bind.mode
  if (bind_id)
  {
    bind.id:=bind_id, bind.mode:=bind_mode, bind.oldStyle:=0
    if (bind_mode & 1)
    {
      WinGet, oldStyle, ExStyle, ahk_id %bind_id%
      bind.oldStyle:=oldStyle
      WinSet, Transparent, 255, ahk_id %bind_id%
      Loop, 30
      {
        Sleep, 100
        WinGet, i, Transparent, ahk_id %bind_id%
      }
      Until (i=255)
    }
  }
  else
  {
    bind_id:=bind.id
    if (bind.mode & 1)
      WinSet, ExStyle, % bind.oldStyle, ahk_id %bind_id%
    bind.id:=0, bind.mode:=0, bind.oldStyle:=0
  }
}

; Use FindText.CaptureCursor(1) to Capture Cursor
; Use FindText.CaptureCursor(0) to Cancel Capture Cursor

CaptureCursor(hDC:=0, zx:=0, zy:=0, zw:=0, zh:=0, get_cursor:=0)
{
  local
  if (get_cursor)
    return this.Cursor
  if (hDC=1 or hDC=0) and (zw=0)
  {
    this.Cursor:=hDC
    return
  }
  Ptr:=(A_PtrSize ? "Ptr":"UInt"), PtrSize:=(A_PtrSize=8 ? 8:4)
  VarSetCapacity(mi, 40, 0), NumPut(16+PtrSize, mi, "int")
  DllCall("GetCursorInfo", Ptr,&mi)
  bShow   := NumGet(mi, 4, "int")
  hCursor := NumGet(mi, 8, Ptr)
  x := NumGet(mi, 8+PtrSize, "int")
  y := NumGet(mi, 12+PtrSize, "int")
  if (!bShow) or (x<zx or y<zy or x>=zx+zw or y>=zy+zh)
    return
  VarSetCapacity(ni, 40, 0)
  DllCall("GetIconInfo", Ptr,hCursor, Ptr,&ni)
  xCenter  := NumGet(ni, 4, "int")
  yCenter  := NumGet(ni, 8, "int")
  hBMMask  := NumGet(ni, (PtrSize=8?16:12), Ptr)
  hBMColor := NumGet(ni, (PtrSize=8?24:16), Ptr)
  DllCall("DrawIconEx", Ptr,hDC
    , "int",x-xCenter-zx, "int",y-yCenter-zy, Ptr,hCursor
    , "int",0, "int",0, "int",0, "int",0, "int",3)
  DllCall("DeleteObject", Ptr,hBMMask)
  DllCall("DeleteObject", Ptr,hBMColor)
}

MCode(ByRef code, hex)
{
  local
  ListLines, % (lls:=A_ListLines)?"Off":"Off"
  SetBatchLines, % (bch:=A_BatchLines)?"-1":"-1"
  VarSetCapacity(code, len:=StrLen(hex)//2)
  Loop, % len
    NumPut("0x" SubStr(hex,2*A_Index-1,2),code,A_Index-1,"uchar")
  DllCall("VirtualProtect","Ptr",&code,"Ptr",len,"uint",0x40,"Ptr*",0)
  SetBatchLines, %bch%
  ListLines, %lls%
}

base64tobit(s)
{
  local
  Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    . "abcdefghijklmnopqrstuvwxyz"
  ListLines, % (lls:=A_ListLines)?"Off":"Off"
  Loop, Parse, Chars
  {
    i:=A_Index-1, v:=(i>>5&1) . (i>>4&1)
      . (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1)
    s:=RegExReplace(s,"[" A_LoopField "]",StrReplace(v,"0x"))
  }
  ListLines, %lls%
  return RegExReplace(RegExReplace(s,"10*$"),"[^01]+")
}

bit2base64(s)
{
  local
  s:=RegExReplace(s,"[^01]+")
  s.=SubStr("100000",1,6-Mod(StrLen(s),6))
  s:=RegExReplace(s,".{6}","|$0")
  Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    . "abcdefghijklmnopqrstuvwxyz"
  ListLines, % (lls:=A_ListLines)?"Off":"Off"
  Loop, Parse, Chars
  {
    i:=A_Index-1, v:="|" . (i>>5&1) . (i>>4&1)
      . (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1)
    s:=StrReplace(s,StrReplace(v,"0x"),A_LoopField)
  }
  ListLines, %lls%
  return s
}

xywh2xywh(x1,y1,w1,h1, ByRef x, ByRef y, ByRef w, ByRef h
  , ByRef zx:="", ByRef zy:="", ByRef zw:="", ByRef zh:="")
{
  local
  SysGet, zx, 76
  SysGet, zy, 77
  SysGet, zw, 78
  SysGet, zh, 79
  w:=Min(x1+w1,zx+zw), x:=Max(x1,zx), w-=x
  , h:=Min(y1+h1,zy+zh), y:=Max(y1,zy), h-=y
}

ASCII(s)
{
  local
  if RegExMatch(s,"\$(\d+)\.([\w+/]+)",r)
  {
    s:=RegExReplace(this.base64tobit(r2),".{" r1 "}","$0`n")
    s:=StrReplace(StrReplace(s,"0","_"),"1","0")
  }
  else s=
  return s
}

; You can put the text library at the beginning of the script,
; and Use FindText.PicLib(Text,1) to add the text library to PicLib()'s Lib,
; Use FindText.PicLib("comment1|comment2|...") to get text images from Lib

PicLib(comments, add_to_Lib:=0, index:=1)
{
  local
  Lib:=this.Lib
  if (add_to_Lib)
  {
    re:="<([^>]*)>[^$]+\$\d+\.[\w+/]+"
    Loop, Parse, comments, |
      if RegExMatch(A_LoopField,re,r)
      {
        s1:=Trim(r1), s2:=""
        Loop, Parse, s1
          s2.="_" . Format("{:d}",Ord(A_LoopField))
        Lib[index,s2]:=r
      }
    Lib[index,""]:=""
  }
  else
  {
    Text:=""
    Loop, Parse, comments, |
    {
      s1:=Trim(A_LoopField), s2:=""
      Loop, Parse, s1
        s2.="_" . Format("{:d}",Ord(A_LoopField))
      Text.="|" . Lib[index,s2]
    }
    return Text
  }
}

; Decompose a string into individual characters and get their data

PicN(Number, index:=1)
{
  return this.PicLib(RegExReplace(Number,".","|$0"), 0, index)
}

; Use FindText.PicX(Text) to automatically cut into multiple characters
; Can't be used in ColorPos mode, because it can cause position errors

PicX(Text)
{
  local
  if !RegExMatch(Text,"(<[^$]+)\$(\d+)\.([\w+/]+)",r)
    return Text
  v:=this.base64tobit(r3), Text:=""
  c:=StrLen(StrReplace(v,"0"))<=StrLen(v)//2 ? "1":"0"
  txt:=RegExReplace(v,".{" r2 "}","$0`n")
  While InStr(txt,c)
  {
    While !(txt~="m`n)^" c)
      txt:=RegExReplace(txt,"m`n)^.")
    i:=0
    While (txt~="m`n)^.{" i "}" c)
      i:=Format("{:d}",i+1)
    v:=RegExReplace(txt,"m`n)^(.{" i "}).*","$1")
    txt:=RegExReplace(txt,"m`n)^.{" i "}")
    if (v!="")
      Text.="|" r1 "$" i "." this.bit2base64(v)
  }
  return Text
}

; Screenshot and retained as the last screenshot.

ScreenShot(x1:=0, y1:=0, x2:=0, y2:=0)
{
  this.FindText(x1, y1, x2, y2)
}

; Get the RGB color of a point from the last screenshot.
; If the point to get the color is beyond the range of
; Screen, it will return White color (0xFFFFFF).

GetColor(x, y, fmt:=1)
{
  local
  bits:=this.GetBitsFromScreen(0,0,0,0,0,zx,zy,zw,zh)
  , c:=(x<zx or x>=zx+zw or y<zy or y>=zy+zh or !bits.Scan0)
  ? 0xFFFFFF : NumGet(bits.Scan0+(y-zy)*bits.Stride+(x-zx)*4,"uint")
  return (fmt ? Format("0x{:06X}",c&0xFFFFFF) : c)
}

; Set the RGB color of a point in the last screenshot

SetColor(x, y, color:=0x000000)
{
  local
  bits:=this.GetBitsFromScreen(0,0,0,0,0,zx,zy,zw,zh)
  if !(x<zx or x>=zx+zw or y<zy or y>=zy+zh or !bits.Scan0)
    NumPut(color,bits.Scan0+(y-zy)*bits.Stride+(x-zx)*4,"uint")
}

; Identify a line of text or verification code
; based on the result returned by FindText().
; offsetX is the maximum interval between two texts,
; if it exceeds, a "*" sign will be inserted.
; offsetY is the maximum height difference between two texts.
; Return Association array {text:Text, x:X, y:Y, w:W, h:H}

Ocr(ok, offsetX:=20, offsetY:=20)
{
  local
  ocr_Text:=ocr_X:=ocr_Y:=min_X:=dx:=""
  For k,v in ok
    x:=v.1
    , min_X:=(A_Index=1 or x<min_X ? x : min_X)
    , max_X:=(A_Index=1 or x>max_X ? x : max_X)
  While (min_X!="" and min_X<=max_X)
  {
    LeftX:=""
    For k,v in ok
    {
      x:=v.1, y:=v.2
      if (x<min_X) or Abs(y-ocr_Y)>offsetY
        Continue
      ; Get the leftmost X coordinates
      if (LeftX="" or x<LeftX)
        LeftX:=x, LeftY:=y, LeftW:=v.3, LeftH:=v.4, LeftOCR:=v.id
    }
    if (LeftX="")
      Break
    if (ocr_X="")
      ocr_X:=LeftX, min_Y:=LeftY, max_Y:=LeftY+LeftH
    ; If the interval exceeds the set value, add "*" to the result
    ocr_Text.=(ocr_Text!="" and LeftX>dx ? "*":"") . LeftOCR
    ; Update for next search
    min_X:=LeftX+LeftW-LeftW//2, dx:=LeftX+LeftW+offsetX
    , ocr_Y:=LeftY, (LeftY<min_Y && min_Y:=LeftY)
    , (LeftY+LeftH>max_Y && max_Y:=LeftY+LeftH)
  }
  return {text:ocr_Text, x:ocr_X, y:min_Y
    , w: min_X-ocr_X, h: max_Y-min_Y}
}

; Sort the results returned by FindText() from left to right
; and top to bottom, ignore slight height difference

Sort(ok, dy:=10)
{
  local
  if !IsObject(ok)
    return ok
  ypos:=[]
  For k,v in ok
  {
    x:=v.x, y:=v.y, add:=1
    For k2,v2 in ypos
      if Abs(y-v2)<=dy
      {
        y:=v2, add:=0
        Break
      }
    if (add)
      ypos.Push(y)
    n:=(y*150000+x) "." k, s:=A_Index=1 ? n : s "-" n
  }
  Sort, s, N D-
  ok2:=[]
  Loop, Parse, s, -
    ok2.Push( ok[(StrSplit(A_LoopField,".")[2])] )
  return ok2
}

; Reordering according to the nearest distance

Sort2(ok, px, py)
{
  local
  if !IsObject(ok)
    return ok
  For k,v in ok
    n:=((v.x-px)**2+(v.y-py)**2) "." k, s:=A_Index=1 ? n : s "-" n
  Sort, s, N D-
  ok2:=[]
  Loop, Parse, s, -
    ok2.Push( ok[(StrSplit(A_LoopField,".")[2])] )
  return ok2
}

; Prompt mouse position in remote assistance

MouseTip(x:="", y:="", w:=10, h:=10, d:=4)
{
  local
  if (x="")
  {
    VarSetCapacity(pt,16,0), DllCall("GetCursorPos","ptr",&pt)
    x:=NumGet(pt,0,"uint"), y:=NumGet(pt,4,"uint")
  }
  x:=Round(x-w-d), y:=Round(y-h-d), w:=(2*w+1)+2*d, h:=(2*h+1)+2*d
  ;-------------------------
  Gui, _MouseTip_: +AlwaysOnTop -Caption +ToolWindow +Hwndmyid -DPIScale
  Gui, _MouseTip_: Show, Hide w%w% h%h%
  ;-------------------------
  DetectHiddenWindows, % (dhw:=A_DetectHiddenWindows)?"On":"On"
  i:=w-d, j:=h-d
  s=0-0 %w%-0 %w%-%h% 0-%h% 0-0  %d%-%d% %i%-%d% %i%-%j% %d%-%j% %d%-%d%
  WinSet, Region, %s%, ahk_id %myid%
  DetectHiddenWindows, %dhw%
  ;-------------------------
  Gui, _MouseTip_: Show, NA x%x% y%y%
  Loop, 4
  {
    Gui, _MouseTip_: Color, % A_Index & 1 ? "Red" : "Blue"
    Sleep, 500
  }
  Gui, _MouseTip_: Destroy
}

; Quickly get the search data of screen image

GetTextFromScreen(x1, y1, x2, y2, Threshold:=""
  , ScreenShot:=1, ByRef rx:="", ByRef ry:="")
{
  local
  SetBatchLines, % (bch:=A_BatchLines)?"-1":"-1"
  x:=Min(x1,x2), y:=Min(y1,y2), w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
  this.GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy,zw,zh)
  if (w<1 or h<1)
  {
    SetBatchLines, %bch%
    return
  }
  ListLines, % (lls:=A_ListLines)?"Off":"Off"
  gs:=[], k:=0
  Loop, %h%
  {
    j:=y+A_Index-1
    Loop, %w%
      i:=x+A_Index-1, c:=this.GetColor(i,j,0)
      , gs[++k]:=(((c>>16)&0xFF)*38+((c>>8)&0xFF)*75+(c&0xFF)*15)>>7
  }
  if InStr(Threshold,"**")
  {
    Threshold:=StrReplace(Threshold,"*")
    if (Threshold="")
      Threshold:=50
    s:="", sw:=w, w-=2, h-=2, x++, y++
    Loop, %h%
    {
      y1:=A_Index
      Loop, %w%
        x1:=A_Index, i:=y1*sw+x1+1, j:=gs[i]+Threshold
        , s.=( gs[i-1]>j || gs[i+1]>j
        || gs[i-sw]>j || gs[i+sw]>j
        || gs[i-sw-1]>j || gs[i-sw+1]>j
        || gs[i+sw-1]>j || gs[i+sw+1]>j ) ? "1":"0"
    }
    Threshold:="**" Threshold
  }
  else
  {
    Threshold:=StrReplace(Threshold,"*")
    if (Threshold="")
    {
      pp:=[]
      Loop, 256
        pp[A_Index-1]:=0
      Loop, % w*h
        pp[gs[A_Index]]++
      IP:=IS:=0
      Loop, 256
        k:=A_Index-1, IP+=k*pp[k], IS+=pp[k]
      Threshold:=Floor(IP/IS)
      Loop, 20
      {
        LastThreshold:=Threshold
        IP1:=IS1:=0
        Loop, % LastThreshold+1
          k:=A_Index-1, IP1+=k*pp[k], IS1+=pp[k]
        IP2:=IP-IP1, IS2:=IS-IS1
        if (IS1!=0 and IS2!=0)
          Threshold:=Floor((IP1/IS1+IP2/IS2)/2)
        if (Threshold=LastThreshold)
          Break
      }
    }
    s:=""
    Loop, % w*h
      s.=gs[A_Index]<=Threshold ? "1":"0"
    Threshold:="*" Threshold
  }
  ;--------------------
  w:=Format("{:d}",w), CutUp:=CutDown:=0
  re1=(^0{%w%}|^1{%w%})
  re2=(0{%w%}$|1{%w%}$)
  While RegExMatch(s,re1)
    s:=RegExReplace(s,re1), CutUp++
  While RegExMatch(s,re2)
    s:=RegExReplace(s,re2), CutDown++
  rx:=x+w//2, ry:=y+CutUp+(h-CutUp-CutDown)//2
  s:="|<>" Threshold "$" w "." this.bit2base64(s)
  ;--------------------
  SetBatchLines, %bch%
  ListLines, %lls%
  return s
}

; Quickly save screen image to BMP file for debugging

SavePic(file, x1:=0, y1:=0, x2:=0, y2:=0, ScreenShot:=1)
{
  local
  static Ptr:="Ptr"
  if (x1*x1+y1*y1+x2*x2+y2*y2<=0)
    n:=150000, x:=y:=-n, w:=h:=2*n
  else
    x:=Min(x1,x2), y:=Min(y1,y2), w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
  bits:=this.GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy,zw,zh)
  if (w<1 or h<1 or !bits.hBM)
    return
  hBM:=this.CreateDIBSection(w, h, bpp:=24, ppvBits, bi)
  this.CopyHBM(hBM, 0, 0, bits.hBM, x-zx, y-zy, w, h)
  size:=((w*bpp+31)//32)*4*h, NumPut(size, bi, 20, "uint")
  VarSetCapacity(bf, 14, 0), StrPut("BM", &bf, "CP0")
  NumPut(54+size, bf, 2, "uint"), NumPut(54, bf, 10, "uint")
  f:=FileOpen(file,"w"), f.RawWrite(bf,14), f.RawWrite(bi,40)
  , f.RawWrite(ppvBits+0, size), f.Close()
  DllCall("DeleteObject", Ptr,hBM)
}

; Show the saved BMP file

ShowPic(file:="", show:=1)
{
  local
  static Ptr:="Ptr"
  Gui, FindText_Screen: Destroy
  if (file="") or !FileExist(file)
    return
  bits:=this.GetBitsFromScreen(0,0,0,0,1,zx,zy,zw,zh)
  hBM:=bits.hBM, hBM2:=LoadPicture(file)
  this.CopyHBM(hBM, 0, 0, hBM2, 0, 0, zw, zh)
  DllCall("DeleteObject", Ptr,hBM2)
  if (!show)
    return
  Gui, FindText_Screen: +AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x08000000
  Gui, FindText_Screen: Margin, 0, 0
  Gui, FindText_Screen: Add, Pic,, HBITMAP:*%hBM%
  Gui, FindText_Screen: Show, NA x%zx% y%zy% w%zw% h%zh%, Show Pic
}

; Running AHK code dynamically with new threads

Class Thread
{
  __New(args*)
  {
    this.pid:=this.Exec(args*)
  }
  __Delete()
  {
    Process, Close, % this.pid
  }
  Exec(s, Ahk:="", args:="")
  {
    local
    Ahk:=Ahk ? Ahk:A_IsCompiled ? A_ScriptDir "\AutoHotkey.exe":A_AhkPath
    s:="DllCall(""SetWindowText"",""Ptr"",A_ScriptHwnd,""Str"",""<AHK>"")`n"
      . StrReplace(s,"`r"), pid:=""
    Try
    {
      shell:=ComObjCreate("WScript.Shell")
      oExec:=shell.Exec("""" Ahk """ /f * " args)
      oExec.StdIn.Write(s)
      oExec.StdIn.Close(), pid:=oExec.ProcessID
    }
    Catch
    {
      f:=A_Temp "\~ahk.tmp"
      s:="`n FileDelete, " f "`n" s
      FileDelete, %f%
      FileAppend, %s%, %f%
      r:=ObjBindMethod(this, "Clear")
      SetTimer, %r%, -3000
      Run, "%Ahk%" /f "%f%" %args%,, UseErrorLevel, pid
    }
    return pid
  }
  Clear()
  {
    FileDelete, % A_Temp "\~ahk.tmp"
    SetTimer,, Off
  }
}

WindowToScreen(ByRef x, ByRef y, x1, y1, id:="")
{
  local
  WinGetPos, winx, winy,,, % id ? "ahk_id " id : "A"
  x:=x1+Floor(winx), y:=y1+Floor(winy)
}

ScreenToWindow(ByRef x, ByRef y, x1, y1, id:="")
{
  local
  this.WindowToScreen(dx,dy,0,0,id), x:=x1-dx, y:=y1-dy
}

ClientToScreen(ByRef x, ByRef y, x1, y1, id:="")
{
  local
  if (!id)
    WinGet, id, ID, A
  VarSetCapacity(pt,8,0), NumPut(0,pt,"int64")
  , DllCall("ClientToScreen","Ptr",id,"Ptr",&pt)
  , x:=x1+NumGet(pt,"int"), y:=y1+NumGet(pt,4,"int")
}

ScreenToClient(ByRef x, ByRef y, x1, y1, id:="")
{
  local
  this.ClientToScreen(dx,dy,0,0,id), x:=x1-dx, y:=y1-dy
}

QPC()  ; <==> A_TickCount
{
  local
  static c:=0, f:=0, init:=DllCall("QueryPerformanceFrequency", "Int*",f)
  return (!DllCall("QueryPerformanceCounter","Int64*",c))*0+(c/f)*1000
}

; It is not like FindText always use Screen Coordinates,
; But like built-in command ImageSearch using CoordMode Settings

ImageSearch(ByRef rx, ByRef ry, x1, y1, x2, y2, text
  , ScreenShot:=1, FindAll:=0)
{
  local
  dx:=dy:=0
  if (A_CoordModePixel="Window")
    this.WindowToScreen(dx,dy,0,0)
  else if (A_CoordModePixel="Client")
    this.ClientToScreen(dx,dy,0,0)
  if (ok:=this.FindText(x1+dx, y1+dy, x2+dx, y2+dy
    , 0, 0, text, ScreenShot, FindAll))
  {
    rx:=ok.1.x-dx, ry:=ok.1.y-dy, ErrorLevel:=0
    return 1
  }
  else
  {
    rx:=ry:="", ErrorLevel:=1
    return 0
  }
}


/***** C source code of machine code *****

int __attribute__((__stdcall__)) PicFind(
  int mode, unsigned int c, unsigned int n, int dir
  , unsigned char * Bmp, int Stride, int zw, int zh
  , int sx, int sy, int sw, int sh
  , char * ss, unsigned int * s1, unsigned int * s0
  , char * text, int w, int h, int err1, int err0
  , unsigned int * allpos, int allpos_max )
{
  int ok=0, o, i, j, k, v, r, g, b, rr, gg, bb;
  int x, y, x1, y1, x2, y2, len1, len0, e1, e0, max;
  int r_min, r_max, g_min, g_max, b_min, b_max, x3, y3;
  unsigned char * gs;
  unsigned int * Bmp2;
  //----------------------
  // MultiColor or PixelSearch or ImageSearch Mode
  if (mode==5)
  {
    max=n; v=c;
    if (max==0)  // ImageSearch
    {
      o=0; Bmp2=(unsigned int *)text;
      i=Bmp2[0]&0xFFFFFF; j=Bmp2[w-1]&0xFFFFFF;
      k=Bmp2[w*h-w]&0xFFFFFF; r=Bmp2[w*h-1]&0xFFFFFF;
      if (i!=j || i!=k || i!=r) i=-1;
      for (y=0; y<h; y++)
      {
        for (x=0; x<w; x++)
        {
          j=Bmp2[o++]&0xFFFFFF;
          if (j!=i) { s1[max]=y*Stride+x*4; s0[max++]=j; }
        }
      }
      err1=(err1*max)>>8;
    }
    else
    {
      for (i=-1, c=0, o=0; (j=text[o])!='\0'; o++)
      {
        if (j>='0' && j<='9') c=c*10+(j-'0');
        if (j=='/' || text[o+1]=='\0')
        {
          if ((++i&1)==0)
            s1[i>>1]=(c>>16)*Stride+(c&0xFFFF)*4;
          else
            s0[i>>1]=c;
          c=0;
        }
      }
    }
    for (i=1; i<max; i++)
    {
      for (j=i; j<max; j++)
        if (s0[j]!=s0[i-1])
        {
          if (j==i) break;
          c=s1[i]; s1[i]=s1[j]; s1[j]=c;
          c=s0[i]; s0[i]=s0[j]; s0[j]=c; break;
        }
    }
    goto StartLookUp;
  }
  //----------------------
  // Generate Lookup Table
  o=0; len1=0; len0=0;
  for (y=0; y<h; y++)
  {
    for (x=0; x<w; x++)
    {
      i=(mode==3) ? y*Stride+x*4 : y*sw+x;
      if (text[o++]=='1')
        s1[len1++]=i;
      else
        s0[len0++]=i;
    }
  }
  if (err1>=len1) len1=0;
  if (err0>=len0) len0=0;
  max=(len1>len0) ? len1 : len0;
  //----------------------
  // Color Position Mode
  // only used to recognize multicolored Verification Code
  if (mode==3)
    { c=(c/w)*Stride+(c%w)*4; goto StartLookUp; }
  //----------------------
  // Generate Two Value Image
  o=sy*Stride+sx*4; j=Stride-sw*4; i=0;
  if (mode==0)  // Color Mode
  {
    rr=(c>>16)&0xFF; gg=(c>>8)&0xFF; bb=c&0xFF;
    for (y=0; y<sh; y++, o+=j)
      for (x=0; x<sw; x++, o+=4, i++)
      {
        r=Bmp[2+o]-rr; g=Bmp[1+o]-gg; b=Bmp[o]-bb; v=r+rr+rr;
        ss[i]=((1024+v)*r*r+2048*g*g+(1534-v)*b*b<=n) ? 1:0;
      }
  }
  else if (mode==1)  // Gray Threshold Mode
  {
    c=(c+1)<<7;
    for (y=0; y<sh; y++, o+=j)
      for (x=0; x<sw; x++, o+=4, i++)
        ss[i]=(Bmp[2+o]*38+Bmp[1+o]*75+Bmp[o]*15<c) ? 1:0;
  }
  else if (mode==2)  // Gray Difference Mode
  {
    gs=(unsigned char *)(ss+sw*sh);
    x2=sx+sw; y2=sy+sh;
    for (y=sy-1; y<=y2; y++)
    {
      for (x=sx-1; x<=x2; x++, i++)
        if (x<0 || x>=zw || y<0 || y>=zh)
          gs[i]=0;
        else
        {
          o=y*Stride+x*4;
          gs[i]=(Bmp[2+o]*38+Bmp[1+o]*75+Bmp[o]*15)>>7;
        }
    }
    k=sw+2; i=0;
    for (y=1; y<=sh; y++)
      for (x=1; x<=sw; x++, i++)
      {
        o=y*k+x; n=gs[o]+c;
        ss[i]=(gs[o-1]>n || gs[o+1]>n
          || gs[o-k]>n   || gs[o+k]>n
          || gs[o-k-1]>n || gs[o-k+1]>n
          || gs[o+k-1]>n || gs[o+k+1]>n) ? 1:0;
      }
  }
  else  // (mode==4) Color Difference Mode
  {
    r=(c>>16)&0xFF; g=(c>>8)&0xFF; b=c&0xFF;
    rr=(n>>16)&0xFF; gg=(n>>8)&0xFF; bb=n&0xFF;
    r_min=r-rr; g_min=g-gg; b_min=b-bb;
    r_max=r+rr; g_max=g+gg; b_max=b+bb;
    for (y=0; y<sh; y++, o+=j)
      for (x=0; x<sw; x++, o+=4, i++)
      {
        r=Bmp[2+o]; g=Bmp[1+o]; b=Bmp[o];
        ss[i]=(r>=r_min && r<=r_max
            && g>=g_min && g<=g_max
            && b>=b_min && b<=b_max) ? 1:0;
      }
  }
  //----------------------
  StartLookUp:
  if (mode==5 || mode==3)
    { x1=sx; y1=sy; x2=sx+sw-w; y2=sy+sh-h; sx=0; sy=0; }
  else
    { x1=0; y1=0; x2=sw-w; y2=sh-h; }
  if (dir<1 || dir>8) dir=1;
  // 1 ==> Top to Bottom ( Left to Right )
  // 2 ==> Top to Bottom ( Right to Left )
  // 3 ==> Bottom to Top ( Left to Right )
  // 4 ==> Bottom to Top ( Right to Left )
  // 5 ==> Left to Right ( Top to Bottom )
  // 6 ==> Left to Right ( Bottom to Top )
  // 7 ==> Right to Left ( Top to Bottom )
  // 8 ==> Right to Left ( Bottom to Top )
  if (--dir>3) { i=y1; y1=x1; x1=i; i=y2; y2=x2; x2=i; }
  for (y3=y1; y3<=y2; y3++)
  {
    for (x3=x1; x3<=x2; x3++)
    {
      y=((dir&3)>1) ? y1+y2-y3 : y3;
      x=(dir&1) ? x1+x2-x3 : x3;
      if (dir>3) { i=y; y=x; x=i; }
      //----------------------
      if (mode==5)
      {
        o=y*Stride+x*4; e1=err1;
        for (i=0; i<max; i++)
        {
          j=o+s1[i]; c=s0[i]; r=Bmp[2+j]-((c>>16)&0xFF);
          g=Bmp[1+j]-((c>>8)&0xFF); b=Bmp[j]-(c&0xFF);
          if ((r>v||r<-v||g>v||g<-v||b>v||b<-v) && (--e1)<0)
            goto NoMatch;
        }
      }
      else if (mode==3)
      {
        o=y*Stride+x*4; e1=err1; e0=err0;
        j=o+c; rr=Bmp[2+j]; gg=Bmp[1+j]; bb=Bmp[j];
        for (i=0; i<max; i++)
        {
          if (i<len1)
          {
            j=o+s1[i]; r=Bmp[2+j]-rr; g=Bmp[1+j]-gg; b=Bmp[j]-bb; v=r+rr+rr;
            if ((1024+v)*r*r+2048*g*g+(1534-v)*b*b>n && (--e1)<0)
              goto NoMatch;
          }
          if (i<len0)
          {
            j=o+s0[i]; r=Bmp[2+j]-rr; g=Bmp[1+j]-gg; b=Bmp[j]-bb; v=r+rr+rr;
            if ((1024+v)*r*r+2048*g*g+(1534-v)*b*b<=n && (--e0)<0)
              goto NoMatch;
          }
        }
      }
      else
      {
        o=y*sw+x; e1=err1; e0=err0;
        for (i=0; i<max; i++)
        {
          if (i<len1 && ss[o+s1[i]]==0 && (--e1)<0) goto NoMatch;
          if (i<len0 && ss[o+s0[i]]!=0 && (--e0)<0) goto NoMatch;
        }
        // Clear the image that has been found
        for (i=0; i<len1; i++)
          ss[o+s1[i]]=0;
      }
      allpos[ok*2]=sx+x; allpos[ok*2+1]=sy+y;
      if (++ok>=allpos_max) goto Return1;
      NoMatch:;
    }
  }
  //----------------------
  Return1:
  return ok;
}

*/


;==== Optional GUI interface ====


Gui(cmd, arg1:="")
{
  local
  static
  global FindText
  local lls, bch, cri
  ListLines, % InStr("|KeyDown|LButtonDown|MouseMove|"
    , "|" cmd "|") ? "Off" : A_ListLines
  static init:=0
  if (!init)
  {
    init:=1
    Gui_:=ObjBindMethod(FindText,"Gui")
    Gui_G:=ObjBindMethod(FindText,"Gui","G")
    Gui_Run:=ObjBindMethod(FindText,"Gui","Run")
    Gui_Off:=ObjBindMethod(FindText,"Gui","Off")
    Gui_Show:=ObjBindMethod(FindText,"Gui","Show")
    Gui_KeyDown:=ObjBindMethod(FindText,"Gui","KeyDown")
    Gui_LButtonDown:=ObjBindMethod(FindText,"Gui","LButtonDown")
    Gui_MouseMove:=ObjBindMethod(FindText,"Gui","MouseMove")
    Gui_ScreenShot:=ObjBindMethod(FindText,"Gui","ScreenShot")
    Gui_ShowPic:=ObjBindMethod(FindText,"Gui","ShowPic")
    Gui_ToolTip:=ObjBindMethod(FindText,"Gui","ToolTip")
    Gui_ToolTipOff:=ObjBindMethod(FindText,"Gui","ToolTipOff")
    bch:=A_BatchLines, cri:=A_IsCritical
    Critical
    #NoEnv
    %Gui_%("Load_Language_Text")
    %Gui_%("MakeCaptureWindow")
    %Gui_%("MakeMainWindow")
    OnMessage(0x100, Gui_KeyDown)
    OnMessage(0x201, Gui_LButtonDown)
    OnMessage(0x200, Gui_MouseMove)
    Menu, Tray, Add
    Menu, Tray, Add, % Lang["1"], %Gui_Show%
    if (!A_IsCompiled and A_LineFile=A_ScriptFullPath)
    {
      Menu, Tray, Default, % Lang["1"]
      Menu, Tray, Click, 1
      Menu, Tray, Icon, Shell32.dll, 23
    }
    Critical, %cri%
    SetBatchLines, %bch%
  }
  Switch cmd
  {
  Case "Off":
    return (KeyDown:=1)
  Case "G":
    GuiControl, +g, %id%, %Gui_Run%
    return
  Case "Run":
    Critical
    %Gui_%(A_GuiControl)
    return
  Case "Show":
    Gui, FindText_Main: Default
    Gui, Show, Center
    GuiControl, Focus, scr
    return
  Case "MakeCaptureWindow":
    ww:=35, hh:=12, WindowColor:="0xDDEEFF"
    Gui, FindText_Capture: New
    Gui, +AlwaysOnTop -DPIScale
    Gui, Margin, 15, 15
    Gui, Color, %WindowColor%
    Gui, Font, s12, Verdana
    Gui, -Theme
    nW:=71, nH:=25, w:=12, C_:=[], Cid_:=[]
    Loop, % nW*(nH+1)
    {
      i:=A_Index, j:=i=1 ? "" : Mod(i,nW)=1 ? "xm y+1":"x+1"
      j.=i>nW*nH ? " cRed BackgroundFFFFAA" : ""
      Gui, Add, Progress, w%w% h%w% %j% Hwndid
      Control, ExStyle, -0x20000,, ahk_id %id%
      C_[i]:=id, Cid_[id]:=i
    }
    Gui, +Theme
    GuiControlGet, p, Pos, %id%
    w:=pX+pW-15, h:=pY+pH-15
    Gui, Add, Slider, xm w%w% vMySlider1 Hwndid Disabled
      +Center Page20 Line10 NoTicks AltSubmit
    %Gui_G%()
    Gui, Add, Slider, ym h%h% vMySlider2 Hwndid Disabled
      +Center Page20 Line10 NoTicks AltSubmit +Vertical
    %Gui_G%()
    GuiControlGet, p, Pos, %id%
    k:=pX+pW, MySlider1:=MySlider2:=dx:=dy:=0
    ;--------------
    Gui, Add, Button, xm Hwndid Hidden Section, % Lang["Auto"]
    GuiControlGet, p, Pos, %id%
    w:=Round(pW*0.75), i:=Round(w*3+15+pW*0.5-w*1.5)
    Gui, Add, Button, xm+%i% yp w%w% hp -Wrap vRepU Hwndid, % Lang["RepU"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp hp -Wrap vCutU Hwndid, % Lang["CutU"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp hp -Wrap vCutU3 Hwndid, % Lang["CutU3"]
    %Gui_G%()
    Gui, Add, Button, xm wp hp -Wrap vRepL Hwndid, % Lang["RepL"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp hp -Wrap vCutL Hwndid, % Lang["CutL"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp hp -Wrap vCutL3 Hwndid, % Lang["CutL3"]
    %Gui_G%()
    Gui, Add, Button, x+15 w%pW% hp -Wrap vAuto Hwndid, % Lang["Auto"]
    %Gui_G%()
    Gui, Add, Button, x+15 w%w% hp -Wrap vRepR Hwndid, % Lang["RepR"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp hp -Wrap vCutR Hwndid, % Lang["CutR"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp hp -Wrap vCutR3 Hwndid, % Lang["CutR3"]
    %Gui_G%()
    Gui, Add, Button, xm+%i% wp hp -Wrap vRepD Hwndid, % Lang["RepD"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp hp -Wrap vCutD Hwndid, % Lang["CutD"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp hp -Wrap vCutD3 Hwndid, % Lang["CutD3"]
    %Gui_G%()
    ;--------------
    Gui, Add, Text, x+80 ys+3 Section, % Lang["SelGray"]
    Gui, Add, Edit, x+3 yp-3 w60 vSelGray ReadOnly
    Gui, Add, Text, x+15 ys, % Lang["SelColor"]
    Gui, Add, Edit, x+3 yp-3 w120 vSelColor ReadOnly
    Gui, Add, Text, x+15 ys, % Lang["SelR"]
    Gui, Add, Edit, x+3 yp-3 w60 vSelR ReadOnly
    Gui, Add, Text, x+5 ys, % Lang["SelG"]
    Gui, Add, Edit, x+3 yp-3 w60 vSelG ReadOnly
    Gui, Add, Text, x+5 ys, % Lang["SelB"]
    Gui, Add, Edit, x+3 yp-3 w60 vSelB ReadOnly
    ;--------------
    x:=w*6+pW+15*4, w:=k-x
    Gui, Add, Tab3, x%x% y+15 w%w% -Wrap, % Lang["2"]
    Gui, Tab, 1
    Gui, Add, Text, x+15 y+15, % Lang["Threshold"]
    Gui, Add, Edit, x+15 w100 vThreshold
    Gui, Add, Button, x+15 yp-3 vGray2Two Hwndid, % Lang["Gray2Two"]
    %Gui_G%()
    Gui, Tab, 2
    Gui, Add, Text, x+15 y+15, % Lang["GrayDiff"]
    Gui, Add, Edit, x+15 w100 vGrayDiff, 50
    Gui, Add, Button, x+15 yp-3 vGrayDiff2Two Hwndid, % Lang["GrayDiff2Two"]
    %Gui_G%()
    Gui, Tab, 3
    Gui, Add, Text, x+15 y+15, % Lang["Similar1"] " 0"
    Gui, Add, Slider, x+0 w120 vSimilar1 Hwndid
      +Center Page1 NoTicks ToolTip, 100
    %Gui_G%()
    Gui, Add, Text, x+0, 100
    Gui, Add, Button, x+15 yp-3 vColor2Two Hwndid, % Lang["Color2Two"]
    %Gui_G%()
    Gui, Tab, 4
    Gui, Add, Text, x+15 y+15, % Lang["Similar2"] " 0"
    Gui, Add, Slider, x+0 w120 vSimilar2 Hwndid
      +Center Page1 NoTicks ToolTip, 100
    %Gui_G%()
    Gui, Add, Text, x+0, 100
    Gui, Add, Button, x+15 yp-3 vColorPos2Two Hwndid, % Lang["ColorPos2Two"]
    %Gui_G%()
    Gui, Tab, 5
    Gui, Add, Text, x+10 y+15, % Lang["DiffR"]
    Gui, Add, Edit, x+5 w80 vDiffR Limit3
    Gui, Add, UpDown, vdR Range0-255 Wrap
    Gui, Add, Text, x+5, % Lang["DiffG"]
    Gui, Add, Edit, x+5 w80 vDiffG Limit3
    Gui, Add, UpDown, vdG Range0-255 Wrap
    Gui, Add, Text, x+5, % Lang["DiffB"]
    Gui, Add, Edit, x+5 w80 vDiffB Limit3
    Gui, Add, UpDown, vdB Range0-255 Wrap
    Gui, Add, Button, x+15 yp-3 vColorDiff2Two Hwndid, % Lang["ColorDiff2Two"]
    %Gui_G%()
    Gui, Tab, 6
    Gui, Add, Text, x+10 y+15, % Lang["DiffRGB"]
    Gui, Add, Edit, x+5 w80 vDiffRGB Limit3
    Gui, Add, UpDown, vdRGB Range0-255 Wrap
    Gui, Add, Checkbox, x+15 yp+5 vMultiColor Hwndid, % Lang["MultiColor"]
    %Gui_G%()
    Gui, Add, Button, x+15 yp-5 vUndo Hwndid, % Lang["Undo"]
    %Gui_G%()
    Gui, Tab
    ;--------------
    Gui, Add, Button, xm vReset Hwndid, % Lang["Reset"]
    %Gui_G%()
    Gui, Add, Checkbox, x+15 yp+5 vModify Hwndid, % Lang["Modify"]
    %Gui_G%()
    Gui, Add, Text, x+30, % Lang["Comment"]
    Gui, Add, Edit, x+5 yp-2 w150 vComment
    Gui, Add, Button, x+30 yp-3 vSplitAdd Hwndid, % Lang["SplitAdd"]
    %Gui_G%()
    Gui, Add, Button, x+10 vAllAdd Hwndid, % Lang["AllAdd"]
    %Gui_G%()
    Gui, Add, Button, x+10 wp vOK Hwndid, % Lang["OK"]
    %Gui_G%()
    Gui, Add, Button, x+10 wp vCancel gCancel, % Lang["Cancel"]
    Gui, Add, Button, xm vBind0 Hwndid, % Lang["Bind0"]
    %Gui_G%()
    Gui, Add, Button, x+15 vBind1 Hwndid, % Lang["Bind1"]
    %Gui_G%()
    Gui, Add, Button, x+15 vBind2 Hwndid, % Lang["Bind2"]
    %Gui_G%()
    Gui, Add, Button, x+15 vBind3 Hwndid, % Lang["Bind3"]
    %Gui_G%()
    Gui, Add, Button, x+15 vBind4 Hwndid, % Lang["Bind4"]
    %Gui_G%()
    Gui, Show, Hide, % Lang["3"]
    return
  Case "MakeMainWindow":
    Gui, FindText_Main: New
    Gui, +AlwaysOnTop -DPIScale
    Gui, Margin, 15, 15
    Gui, Color, %WindowColor%
    Gui, Font, s12, Verdana
    Gui, Add, Text, xm, % Lang["NowHotkey"]
    Gui, Add, Edit, x+5 w200 vNowHotkey ReadOnly
    Gui, Add, Hotkey, x+5 w200 vSetHotkey1
    Gui, Add, DDL, x+5 w180 vSetHotkey2
      , % "||F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|LWin|MButton"
      . "|ScrollLock|CapsLock|Ins|Esc|BS|Del|Tab|Home|End|PgUp|PgDn"
      . "|NumpadDot|NumpadSub|NumpadAdd|NumpadDiv|NumpadMult"
    Gui, Add, GroupBox, xm y+0 w280 h55 vMyGroup cBlack
    Gui, Add, Text, xp+15 yp+20 Section, % Lang["Myww"] ": "
    Gui, Add, Text, x+0 w60, %ww%
    Gui, Add, UpDown, vMyww Range1-100, %ww%
    Gui, Add, Text, x+15 ys, % Lang["Myhh"] ": "
    Gui, Add, Text, x+0 w60, %hh%
    Gui, Add, UpDown, vMyhh Hwndid Range1-100, %hh%
    GuiControlGet, p, Pos, %id%
    GuiControl, Move, MyGroup, % "w" (pX+pW) " h" (pH+30)
    x:=pX+pW+15*2
    Gui, Add, Button, x%x% ys-8 w150 vApply Hwndid, % Lang["Apply"]
    %Gui_G%()
    Gui, Add, Checkbox, x+30 ys Checked vAddFunc, % Lang["AddFunc"] " FindText()"
    Gui, Add, Button, xm y+18 w144 vCutL2 Hwndid, % Lang["CutL2"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp vCutR2 Hwndid, % Lang["CutR2"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp vCutU2 Hwndid, % Lang["CutU2"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp vCutD2 Hwndid, % Lang["CutD2"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp vUpdate Hwndid, % Lang["Update"]
    %Gui_G%()
    Gui, Font, s6 bold, Verdana
    Gui, Add, Edit, xm y+10 w720 r20 vMyPic -Wrap
    Gui, Font, s12 norm, Verdana
    Gui, Add, Button, xm w240 vCapture Hwndid, % Lang["Capture"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp vTest Hwndid, % Lang["Test"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp vCopy Hwndid, % Lang["Copy"]
    %Gui_G%()
    Gui, Add, Button, xm y+0 wp vCaptureS Hwndid, % Lang["CaptureS"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp vGetRange Hwndid, % Lang["GetRange"]
    %Gui_G%()
    Gui, Add, Button, x+0 wp vTestClip Hwndid, % Lang["TestClip"]
    %Gui_G%()
    Gui, Font, s12 cBlue, Verdana
    Gui, Add, Edit, xm w720 h350 vscr Hwndhscr -Wrap HScroll
    Gui, Show, Hide, % Lang["4"]
    return
  Case "Capture","CaptureS":
    Gui, FindText_Main: +Hwndid
    if (show_gui:=(WinExist()=id))
    {
      WinMinimize
      Gui, FindText_Main: Hide
    }
    ShowScreenShot:=InStr(cmd,"CaptureS")
    if (ShowScreenShot)
    {
      f:=%Gui_%("SelectPic")
      if (f="") or !FileExist(f)
      {
        if (show_gui)
        {
          Gui, FindText_Main: Show
          GuiControl, FindText_Main: Focus, scr
        }
        Exit
      }
      FindText.ShowPic(f)
    }
    ;----------------------
    if GetKeyState("RButton")
      Send {RButton Up}
    if GetKeyState("Ctrl")
      Send {Ctrl Up}
    KeyDown:=0, KeyDown2:=GetKeyState("RButton","P")
    Gui, FindText_HotkeyIf: New, -Caption +ToolWindow +E0x80000
    Gui, Show, NA x0 y0 w0 h0, FindText_HotkeyIf
    Hotkey, IfWinExist, FindText_HotkeyIf
    Hotkey, *RButton, %Gui_Off%, On UseErrorLevel
    ListLines, % (lls:=A_ListLines)?"Off":"Off"
    CoordMode, Mouse
    w:=ww, h:=hh, oldx:=oldy:="", r:=StrSplit(Lang["5"],"|")
    if (!show_gui)
      w:=20, h:=8
    Critical, Off
    Loop
    {
      Sleep, 50
      MouseGetPos, x, y, Bind_ID
      if (!show_gui)
      {
        w:=x<=1 ? w-1 : x>=A_ScreenWidth-2 ? w+1:w
        h:=y<=1 ? h-1 : y>=A_ScreenHeight-2 ? h+1:h
        w:=(w<1 ? 1:w), h:=(h<1 ? 1:h)
      }
      %Gui_%("Mini_Show")
      if (oldx=x and oldy=y)
        Continue
      oldx:=x, oldy:=y
      ToolTip, % r.1 " : " x "," y "`n" r.2
    }
    Until (KeyDown=1)
      or GetKeyState("RButton") or GetKeyState("Ctrl")
    if GetKeyState("RButton")
      KeyWait, RButton, L
    if GetKeyState("Ctrl")
      KeyWait, Ctrl, L
    KeyDown:=0
    px:=x, py:=y, oldx:=oldy:=""
    Loop
    {
      Sleep, 50
      %Gui_%("Mini_Show")
      MouseGetPos, x1, y1
      if (oldx=x1 and oldy=y1)
        Continue
      oldx:=x1, oldy:=y1
      ToolTip, % r.1 " : " x "," y "`n" r.2
    }
    Until (KeyDown=1)
      or GetKeyState("RButton") or GetKeyState("Ctrl")
    ToolTip
    if GetKeyState("RButton")
      KeyWait, RButton, L
    if GetKeyState("Ctrl")
      KeyWait, Ctrl, L
    if (KeyDown2=0)
      KeyWait, RButton
    Critical
    %Gui_%("Mini_Hide")
    ListLines, %lls%
    Hotkey, *RButton, %Gui_Off%, Off UseErrorLevel
    Hotkey, IfWinExist
    Gui, FindText_HotkeyIf: Destroy
    if (ShowScreenShot)
      FindText.ShowPic()
    if (!show_gui)
      return [px-w, py-h, px+w, py+h]
    ;-----------------------
    %Gui_%("getcors", !ShowScreenShot)
    %Gui_%("Reset")
    Gui, FindText_Capture: Default
    Loop, 71
      GuiControl,, % C_[71*25+A_Index], 0
    Loop, 6
      GuiControl,, Edit%A_Index%
    GuiControl,, Modify, % Modify:=0
    GuiControl,, MultiColor, % MultiColor:=0
    GuiControl,, GrayDiff, 50
    GuiControl, Focus, Gray2Two
    GuiControl, +Default, Gray2Two
    Gui, Show, Center
    Event:=Result:=""
    DetectHiddenWindows, Off
    Critical, Off
    Gui, +LastFound
    WinWaitClose, % "ahk_id " WinExist()
    Critical
    ToolTip
    Gui, FindText_Main: Default
    ;--------------------------------
    if (cors.bind!="")
    {
      WinGetTitle, tt, ahk_id %Bind_ID%
      WinGetClass, tc, ahk_id %Bind_ID%
      tt:=Trim(SubStr(tt,1,30) (tc ? " ahk_class " tc:""))
      tt:=StrReplace(RegExReplace(tt,"[;``]","``$0"),"""","""""")
      Result:="`nSetTitleMatchMode, 2`nid:=WinExist(""" tt """)"
        . "`nFindText.BindWindow(id" (cors.bind=0 ? "":"," cors.bind)
        . ")  `; " Lang["6"] " FindText.BindWindow(0)`n`n" Result
    }
    if (Event="OK")
    {
      if (!A_IsCompiled)
      {
        FileRead, s, %A_LineFile%
        s:=SubStr(s, s~="i)\n[;=]+ Copy The")
      }
      else s:=""
      GuiControl,, scr, % Result "`n" s
      if !InStr(Result,"##")
        GuiControl,, MyPic, % Trim(FindText.ASCII(Result),"`n")
      Result:=s:=""
    }
    else if (Event="SplitAdd") or (Event="AllAdd")
    {
      GuiControlGet, s,, scr
      i:=j:=0, r:="<[^>\n]*>[^$\n]+\$[\w+/,.\-]+"
      While j:=RegExMatch(s,r,"",j+1)
        i:=InStr(s,"`n",0,j)
      GuiControl,, scr, % SubStr(s,1,i) . Result . SubStr(s,i+1)
      if !InStr(Result,"##")
        GuiControl,, MyPic, % Trim(FindText.ASCII(Result),"`n")
      Result:=s:=""
    }
    ;----------------------
    Gui, Show
    GuiControl, Focus, scr
    return
  Case "SelectPic":
    Gui, FindText_SelectPic: +LastFoundExist
    IfWinExist
      return
    Pics:=[], Names:=[], s:=""
    Loop, Files, % A_Temp "\Ahk_ScreenShot\*.bmp"
      Pics.Push(LoadPicture(v:=A_LoopFileFullPath, "w800 h500"))
      , Names.Push(v), s.="|" RegExReplace(v,"i)^.*\\|\.bmp$")
    if !Pics.Length()
    {
      Pics:="", Names:=""
      SetTimer, %Gui_ToolTip%, Off
      ToolTip
      MsgBox, 4096, Tip, % "`n" Lang["15"] " !`n", 3
      return
    }
    Gui, FindText_SelectPic: New
    Gui, +LastFound +AlwaysOnTop -DPIScale
    Gui, Margin, 15, 15
    Gui, Font, s12, Verdana
    Gui, Add, Pic, HwndhPic w800 h500 +Border, % "HBITMAP:*" Pics.1
    Gui, Add, ListBox, % "x+15 w120 hp vSelectBox Hwndid"
      . " AltSubmit 0x100 Choose1", % Trim(s,"|")
    %Gui_G%()
    Gui, Add, Button, xm w223 vOK2 Hwndid Default, % Lang["OK2"]
    %Gui_G%()
    Gui, Add, Button, x+15 wp vCancel2 gCancel, % Lang["Cancel2"]
    Gui, Add, Button, x+15 wp vClearAll Hwndid, % Lang["ClearAll"]
    %Gui_G%()
    Gui, Add, Button, x+15 wp vOpenDir Hwndid, % Lang["OpenDir"]
    %Gui_G%()
    GuiControl, Focus, SelectBox
    Gui, Show,, Select ScreenShot
    ;-----------------------
    DetectHiddenWindows, Off
    Critical, Off
    file:=""
    WinWaitClose, % "ahk_id " WinExist()
    Critical
    Gui, Destroy
    Loop, % Pics.Length()
      DllCall("DeleteObject", "Ptr",Pics[A_Index])
    Pics:="", Names:=""
    return file
  Case "SelectBox":
    Gui, FindText_SelectPic: Default
    GuiControlGet, SelectBox
    if (Pics[SelectBox])
      GuiControl,, %hPic%, % "HBITMAP:*" Pics[SelectBox]
    return
  Case "OK2":
    GuiControlGet, SelectBox
    file:=Names[SelectBox]
    Gui, FindText_SelectPic: Hide
    return
  Case "ClearAll":
    FileDelete, % A_Temp "\Ahk_ScreenShot\*.bmp"
    Gui, FindText_SelectPic: Hide
    return
  Case "OpenDir":
    Run, % A_Temp "\Ahk_ScreenShot\"
    return
  Case "Mini_Show":
    Gui, FindText_Mini_4: +LastFoundExist
    IfWinNotExist
    {
      Loop, 4
      {
        i:=A_Index
        Gui, FindText_Mini_%i%: +AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x08000000
        Gui, FindText_Mini_%i%: Show, Hide, Mini
      }
    }
    d:=2, w:=w<0 ? 0:w, h:=h<0 ? 0:h, c:=A_MSec<500 ? "Red":"Blue"
    Loop, 4
    {
      i:=A_Index
      x1:=Floor(i=3 ? x+w+1 : x-w-d)
      y1:=Floor(i=4 ? y+h+1 : y-h-d)
      w1:=Floor(i=1 or i=3 ? d : 2*(w+d)+1)
      h1:=Floor(i=2 or i=4 ? d : 2*(h+d)+1)
      Gui, FindText_Mini_%i%: Color, %c%
      Gui, FindText_Mini_%i%: Show, NA x%x1% y%y1% w%w1% h%h1%
    }
    return
  Case "Mini_Hide":
    Gui, FindText_Mini_4: +Hwndid
    Loop, 4
      Gui, FindText_Mini_%A_Index%: Destroy
    WinWaitClose, ahk_id %id%,, 3
    return
  Case "getcors":
    FindText.xywh2xywh(px-ww,py-hh,2*ww+1,2*hh+1,x,y,w,h)
    if (w<1 or h<1)
      return
    SetBatchLines, % (bch:=A_BatchLines)?"-1":"-1"
    if (arg1)
      FindText.ScreenShot()
    cors:=[], gray:=[], k:=0
    ListLines, % (lls:=A_ListLines)?"Off":"Off"
    Loop, %nH%
    {
      j:=py-hh+A_Index-1, i:=px-ww
      Loop, %nW%
        cors[++k]:=c:=FindText.GetColor(i++,j,0)
        , gray[k]:=(((c>>16)&0xFF)*38+((c>>8)&0xFF)*75+(c&0xFF)*15)>>7
    }
    ListLines, %lls%
    cors.CutLeft:=Abs(px-ww-x)
    cors.CutRight:=Abs(px+ww-(x+w-1))
    cors.CutUp:=Abs(py-hh-y)
    cors.CutDown:=Abs(py+hh-(y+h-1))
    SetBatchLines, %bch%
    return
  Case "GetRange":
    Gui, FindText_Main: +Hwndid
    if (show_gui:=(WinExist()=id))
      Gui, FindText_Main: Hide
    ;---------------------
    Gui, FindText_GetRange: New
    Gui, +LastFound +AlWaysOnTop +ToolWindow -Caption -DPIScale +E0x08000000
    Gui, Color, White
    WinSet, Transparent, 10
    FindText.xywh2xywh(0,0,0,0,0,0,0,0,x,y,w,h)
    Gui, Show, NA x%x% y%y% w%w% h%h%, GetRange
    ;---------------------
    if GetKeyState("LButton")
      Send {LButton Up}
    if GetKeyState("Ctrl")
      Send {Ctrl Up}
    KeyDown:=0, KeyDown2:=GetKeyState("LButton","P")
    Gui, FindText_HotkeyIf: New, -Caption +ToolWindow +E0x80000
    Gui, Show, NA x0 y0 w0 h0, FindText_HotkeyIf
    Hotkey, IfWinExist, FindText_HotkeyIf
    Hotkey, *LButton, %Gui_Off%, On UseErrorLevel
    Hotkey, *LButton Up, %Gui_Off%, On UseErrorLevel
    ListLines, % (lls:=A_ListLines)?"Off":"Off"
    CoordMode, Mouse
    oldx:=oldy:="", r:=Lang["7"]
    Critical, Off
    Loop
    {
      Sleep, 50
      MouseGetPos, x, y
      if (oldx=x and oldy=y)
        Continue
      oldx:=x, oldy:=y
      ToolTip, %r%
    }
    Until (KeyDown=1)
      or GetKeyState("LButton") or GetKeyState("Ctrl")
    KeyDown--
    px:=x, py:=y, oldx:=oldy:=""
    Loop
    {
      Sleep, 50
      MouseGetPos, x, y
      w:=Abs(px-x)//2, h:=Abs(py-y)//2, x:=(px+x)//2, y:=(py+y)//2
      %Gui_%("Mini_Show")
      if (oldx=x and oldy=y)
        Continue
      oldx:=x, oldy:=y
      ToolTip, %r%
    }
    Until (KeyDown=1) or (KeyDown<0
      and !(GetKeyState("LButton") or GetKeyState("Ctrl")))
    ToolTip
    if GetKeyState("LButton")
      KeyWait, LButton, L
    if GetKeyState("Ctrl")
      KeyWait, Ctrl, L
    if (KeyDown2=0)
      KeyWait, LButton
    Critical
    %Gui_%("Mini_Hide")
    ListLines, %lls%
    Hotkey, *LButton, %Gui_Off%, Off UseErrorLevel
    Hotkey, *LButton Up, %Gui_Off%, Off UseErrorLevel
    Hotkey, IfWinExist
    Gui, FindText_HotkeyIf: Destroy
    Gui, FindText_GetRange: Destroy
    Clipboard:=p:=(x-w) ", " (y-h) ", " (x+w) ", " (y+h)
    if (!show_gui)
      return StrSplit(p, ",", " ")
    ;---------------------
    Gui, FindText_Main: Default
    GuiControlGet, s,, scr
    if RegExMatch(s, "i)(=\s*FindText\()([^,]*,){4}", r)
    {
      s:=StrReplace(s, r, r1 . p ",", 0, 1)
      GuiControl,, scr, %s%
    }
    Gui, Show
    return
  Case "Test","TestClip":
    Gui, FindText_Main: Default
    Gui, +LastFound
    WinMinimize
    Gui, Hide
    DetectHiddenWindows, Off
    WinWaitClose, % "ahk_id " WinExist()
    Sleep, 100
    ;----------------------
    if (cmd="Test")
      GuiControlGet, s,, scr
    else
      s:=Clipboard
    if (!A_IsCompiled) and InStr(s,"MCode(") and (cmd="Test")
    {
      s:="`n#NoEnv`nMenu, Tray, Click, 1`n" s "`nExitApp`n"
      Thread:= new FindText.Thread(s)
      DetectHiddenWindows, On
      WinWait, % "ahk_class AutoHotkey ahk_pid " Thread.pid,, 3
      if (!ErrorLevel)
        WinWaitClose,,, 30
      Thread:=""  ; kill the Thread
    }
    else
    {
      Gui, +OwnDialogs
      t:=A_TickCount, n:=150000
      , RegExMatch(s,"<[^>\n]*>[^$\n]+\$[\w+/,.\-]+",k)
      , v:=FindText.FindText(-n, -n, n, n, 0, 0, k)
      , X:=v.1.x, Y:=v.1.y, Comment:=v.1.id
      r:=StrSplit(Lang["8"],"|")
      MsgBox, 4096, Tip, % r.1 ":`t" Round(v.MaxIndex()) "`n`n"
        . r.2 ":`t" (A_TickCount-t) " " r.3 "`n`n"
        . r.4 ":`t" X ", " Y "`n`n"
        . r.5 ":`t" (v ? r.6 " ! " Comment : r.7 " !"), 3
      for i,j in v
        if (i<=2)
          FindText.MouseTip(j.x, j.y)
      v:=""
    }
    ;----------------------
    Gui, Show
    GuiControl, Focus, scr
    return
  Case "Copy":
    Gui, FindText_Main: Default
    ControlGet, s, Selected,,, ahk_id %hscr%
    if (s="")
    {
      GuiControlGet, s,, scr
      GuiControlGet, r,, AddFunc
      if (r != 1)
        s:=RegExReplace(s,"\n\K[\s;=]+ Copy The[\s\S]*")
    }
    Clipboard:=RegExReplace(s,"\R","`r`n")
    ;----------------------
    Gui, Hide
    Sleep, 100
    Gui, Show
    GuiControl, Focus, scr
    return
  Case "Apply":
    Gui, FindText_Main: Default
    GuiControlGet, NowHotkey
    GuiControlGet, SetHotkey1
    GuiControlGet, SetHotkey2
    if (NowHotkey!="")
      Hotkey, *%NowHotkey%,, Off UseErrorLevel
    k:=SetHotkey1!="" ? SetHotkey1 : SetHotkey2
    if (k!="")
      Hotkey, *%k%, %Gui_ScreenShot%, On UseErrorLevel
    GuiControl,, NowHotkey, %k%
    GuiControl,, SetHotkey1
    GuiControl, Choose, SetHotkey2, 0
    ;------------------------
    GuiControlGet, Myww
    GuiControlGet, Myhh
    if (Myww!=ww or Myhh!=hh)
    {
      nW:=71, dx:=dy:=0
      Loop, % 71*25
        k:=A_Index, c:=WindowColor, %Gui_%("SetColor")
      ww:=Myww, hh:=Myhh, nW:=2*ww+1, nH:=2*hh+1
      i:=nW>71, j:=nH>25
      Gui, FindText_Capture: Default
      GuiControl, Enable%i%, MySlider1
      GuiControl, Enable%j%, MySlider2
      GuiControl,, MySlider1, % MySlider1:=0
      GuiControl,, MySlider2, % MySlider2:=0
    }
    return
  Case "ScreenShot":
    Critical
    f:=A_Temp "\Ahk_ScreenShot"
    if !InStr(r:=FileExist(f), "D")
    {
      if (r)
      {
        FileSetAttrib, -R, %f%
        FileDelete, %f%
      }
      FileCreateDir, %f%
    }
    Loop
      f:=A_Temp "\Ahk_ScreenShot\" Format("{:03d}",A_Index) ".bmp"
    Until !FileExist(f)
    FindText.SavePic(f)
    Gui, FindText_Tip: New
    ; WS_EX_NOACTIVATE:=0x08000000, WS_EX_TRANSPARENT:=0x20
    Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption -DPIScale +E0x08000020
    Gui, Color, Yellow
    Gui, Font, cRed s48 bold
    Gui, Add, Text,, % Lang["9"]
    WinSet, Transparent, 200
    Gui, Show, NA y0, ScreenShot Tip
    Sleep, 100
    Gui, Destroy
    return
  Case "Bind0","Bind1","Bind2","Bind3","Bind4":
    FindText.BindWindow(Bind_ID, bind_mode:=SubStr(cmd,0))
    if GetKeyState("RButton")
      Send {RButton Up}
    if GetKeyState("Ctrl")
      Send {Ctrl Up}
    KeyDown:=0, KeyDown2:=GetKeyState("RButton","P")
    Gui, FindText_HotkeyIf: New, -Caption +ToolWindow +E0x80000
    Gui, Show, NA x0 y0 w0 h0, FindText_HotkeyIf
    Hotkey, IfWinExist, FindText_HotkeyIf
    Hotkey, *RButton, %Gui_Off%, On UseErrorLevel
    ListLines, % (lls:=A_ListLines)?"Off":"Off"
    CoordMode, Mouse
    oldx:=oldy:=""
    Critical, Off
    Loop
    {
      Sleep, 50
      MouseGetPos, x, y
      if (oldx=x and oldy=y)
        Continue
      oldx:=x, oldy:=y
      ;---------------
      px:=x, py:=y, %Gui_%("getcors",1)
      %Gui_%("Reset"), r:=StrSplit(Lang["10"],"|")
      ToolTip, % r.1 " : " x "," y "`n" r.2
    }
    Until (KeyDown=1)
      or GetKeyState("RButton") or GetKeyState("Ctrl")
    ToolTip
    if GetKeyState("RButton")
      KeyWait, RButton, L
    if GetKeyState("Ctrl")
      KeyWait, Ctrl, L
    if (KeyDown2=0)
      KeyWait, RButton
    if (KeyDown=1)
      Sleep, 500
    Critical
    ListLines, %lls%
    Hotkey, *RButton, %Gui_Off%, Off UseErrorLevel
    Hotkey, IfWinExist
    Gui, FindText_HotkeyIf: Destroy
    FindText.BindWindow(0), cors.bind:=bind_mode
    return
  Case "MySlider1","MySlider2":
    Thread, Priority, 10
    Critical, Off
    dx:=nW>71 ? Round((nW-71)*MySlider1/100) : 0
    dy:=nH>25 ? Round((nH-25)*MySlider2/100) : 0
    if (oldx=dx and oldy=dy)
      return
    oldx:=dx, oldy:=dy, k:=0
    Loop, % nW*nH
      c:=(!show[++k] ? WindowColor
      : bg="" ? cors[k] : ascii[k]
      ? "Black":"White"), %Gui_%("SetColor")
    if (cmd="MySlider2")
      return
    Loop, 71
      GuiControl,, % C_[71*25+A_Index], 0
    Loop, % nW
    {
      i:=A_Index-dx
      if (i>=1 && i<=71 && show[nW*nH+A_Index])
        GuiControl,, % C_[71*25+i], 100
    }
    return
  Case "Reset":
    show:=[], ascii:=[], bg:=""
    CutLeft:=CutRight:=CutUp:=CutDown:=k:=0
    Loop, % nW*nH
      show[++k]:=1, c:=cors[k], %Gui_%("SetColor")
    Loop, % cors.CutLeft
      %Gui_%("CutL")
    Loop, % cors.CutRight
      %Gui_%("CutR")
    Loop, % cors.CutUp
      %Gui_%("CutU")
    Loop, % cors.CutDown
      %Gui_%("CutD")
    return
  Case "SetColor":
    if (nW=71 && nH=25)
      tk:=k
    else
    {
      tx:=Mod(k-1,nW)-dx, ty:=(k-1)//nW-dy
      if (tx<0 || tx>=71 || ty<0 || ty>=25)
        return
      tk:=ty*71+tx+1
    }
    c:=c="Black" ? 0x000000 : c="White" ? 0xFFFFFF
      : ((c&0xFF)<<16)|(c&0xFF00)|((c&0xFF0000)>>16)
    SendMessage, 0x2001, 0, c,, % "ahk_id " . C_[tk]
    return
  Case "RepColor":
    show[k]:=1, c:=(bg="" ? cors[k] : ascii[k]
      ? "Black":"White"), %Gui_%("SetColor")
    return
  Case "CutColor":
    show[k]:=0, c:=WindowColor, %Gui_%("SetColor")
    return
  Case "RepL":
    if (CutLeft<=cors.CutLeft)
    or (bg!="" and InStr(color,"**")
    and CutLeft=cors.CutLeft+1)
      return
    k:=CutLeft-nW, CutLeft--
    Loop, %nH%
      k+=nW, (A_Index>CutUp and A_Index<nH+1-CutDown
        ? %Gui_%("RepColor") : "")
    return
  Case "CutL":
    if (CutLeft+CutRight>=nW)
      return
    CutLeft++, k:=CutLeft-nW
    Loop, %nH%
      k+=nW, (A_Index>CutUp and A_Index<nH+1-CutDown
        ? %Gui_%("CutColor") : "")
    return
  Case "CutL3":
    Loop, 3
      %Gui_%("CutL")
    return
  Case "RepR":
    if (CutRight<=cors.CutRight)
    or (bg!="" and InStr(color,"**")
    and CutRight=cors.CutRight+1)
      return
    k:=1-CutRight, CutRight--
    Loop, %nH%
      k+=nW, (A_Index>CutUp and A_Index<nH+1-CutDown
        ? %Gui_%("RepColor") : "")
    return
  Case "CutR":
    if (CutLeft+CutRight>=nW)
      return
    CutRight++, k:=1-CutRight
    Loop, %nH%
      k+=nW, (A_Index>CutUp and A_Index<nH+1-CutDown
        ? %Gui_%("CutColor") : "")
    return
  Case "CutR3":
    Loop, 3
      %Gui_%("CutR")
    return
  Case "RepU":
    if (CutUp<=cors.CutUp)
    or (bg!="" and InStr(color,"**")
    and CutUp=cors.CutUp+1)
      return
    k:=(CutUp-1)*nW, CutUp--
    Loop, %nW%
      k++, (A_Index>CutLeft and A_Index<nW+1-CutRight
        ? %Gui_%("RepColor") : "")
    return
  Case "CutU":
    if (CutUp+CutDown>=nH)
      return
    CutUp++, k:=(CutUp-1)*nW
    Loop, %nW%
      k++, (A_Index>CutLeft and A_Index<nW+1-CutRight
        ? %Gui_%("CutColor") : "")
    return
  Case "CutU3":
    Loop, 3
      %Gui_%("CutU")
    return
  Case "RepD":
    if (CutDown<=cors.CutDown)
    or (bg!="" and InStr(color,"**")
    and CutDown=cors.CutDown+1)
      return
    k:=(nH-CutDown)*nW, CutDown--
    Loop, %nW%
      k++, (A_Index>CutLeft and A_Index<nW+1-CutRight
        ? %Gui_%("RepColor") : "")
    return
  Case "CutD":
    if (CutUp+CutDown>=nH)
      return
    CutDown++, k:=(nH-CutDown)*nW
    Loop, %nW%
      k++, (A_Index>CutLeft and A_Index<nW+1-CutRight
        ? %Gui_%("CutColor") : "")
    return
  Case "CutD3":
    Loop, 3
      %Gui_%("CutD")
    return
  Case "Gray2Two":
    Gui, FindText_Capture: Default
    GuiControl, Focus, Threshold
    GuiControlGet, Threshold
    if (Threshold="")
    {
      pp:=[]
      Loop, 256
        pp[A_Index-1]:=0
      Loop, % nW*nH
        if (show[A_Index])
          pp[gray[A_Index]]++
      IP:=IS:=0
      Loop, 256
        k:=A_Index-1, IP+=k*pp[k], IS+=pp[k]
      Threshold:=Floor(IP/IS)
      Loop, 20
      {
        LastThreshold:=Threshold
        IP1:=IS1:=0
        Loop, % LastThreshold+1
          k:=A_Index-1, IP1+=k*pp[k], IS1+=pp[k]
        IP2:=IP-IP1, IS2:=IS-IS1
        if (IS1!=0 and IS2!=0)
          Threshold:=Floor((IP1/IS1+IP2/IS2)/2)
        if (Threshold=LastThreshold)
          Break
      }
      GuiControl,, Threshold, %Threshold%
    }
    Threshold:=Round(Threshold)
    color:="*" Threshold, k:=i:=0
    Loop, % nW*nH
    {
      ascii[++k]:=v:=(gray[k]<=Threshold)
      if (show[k])
        i:=(v?i+1:i-1), c:=(v?"Black":"White"), %Gui_%("SetColor")
    }
    bg:=i>0 ? "1":"0"
    return
  Case "GrayDiff2Two":
    Gui, FindText_Capture: Default
    GuiControlGet, GrayDiff
    if (GrayDiff="")
    {
      Gui, +OwnDialogs
      MsgBox, 4096, Tip, % "`n" Lang["11"] " !`n", 1
      return
    }
    if (CutLeft=cors.CutLeft)
      %Gui_%("CutL")
    if (CutRight=cors.CutRight)
      %Gui_%("CutR")
    if (CutUp=cors.CutUp)
      %Gui_%("CutU")
    if (CutDown=cors.CutDown)
      %Gui_%("CutD")
    GrayDiff:=Round(GrayDiff)
    color:="**" GrayDiff, k:=i:=0
    Loop, % nW*nH
    {
      j:=gray[++k]+GrayDiff
      , ascii[k]:=v:=( gray[k-1]>j or gray[k+1]>j
      or gray[k-nW]>j or gray[k+nW]>j
      or gray[k-nW-1]>j or gray[k-nW+1]>j
      or gray[k+nW-1]>j or gray[k+nW+1]>j )
      if (show[k])
        i:=(v?i+1:i-1), c:=(v?"Black":"White"), %Gui_%("SetColor")
    }
    bg:=i>0 ? "1":"0"
    return
  Case "Color2Two","ColorPos2Two":
    Gui, FindText_Capture: Default
    GuiControlGet, c,, SelColor
    if (c="")
    {
      Gui, +OwnDialogs
      MsgBox, 4096, Tip, % "`n" Lang["12"] " !`n", 1
      return
    }
    UsePos:=(cmd="ColorPos2Two") ? 1:0
    GuiControlGet, n,, Similar1
    n:=Round(n/100,2), color:=c "@" n
    , n:=Floor(512*9*255*255*(1-n)*(1-n)), k:=i:=0
    , rr:=(c>>16)&0xFF, gg:=(c>>8)&0xFF, bb:=c&0xFF
    Loop, % nW*nH
    {
      c:=cors[++k], r:=((c>>16)&0xFF)-rr
      , g:=((c>>8)&0xFF)-gg, b:=(c&0xFF)-bb, j:=r+rr+rr
      , ascii[k]:=v:=((1024+j)*r*r+2048*g*g+(1534-j)*b*b<=n)
      if (show[k])
        i:=(v?i+1:i-1), c:=(v?"Black":"White"), %Gui_%("SetColor")
    }
    bg:=i>0 ? "1":"0"
    return
  Case "ColorDiff2Two":
    Gui, FindText_Capture: Default
    GuiControlGet, c,, SelColor
    if (c="")
    {
      Gui, +OwnDialogs
      MsgBox, 4096, Tip, % "`n" Lang["12"] " !`n", 1
      return
    }
    GuiControlGet, dR
    GuiControlGet, dG
    GuiControlGet, dB
    rr:=(c>>16)&0xFF, gg:=(c>>8)&0xFF, bb:=c&0xFF
    , n:=Format("{:06X}",(dR<<16)|(dG<<8)|dB)
    , color:=StrReplace(c "-" n,"0x"), k:=i:=0
    Loop, % nW*nH
    {
      c:=cors[++k], r:=(c>>16)&0xFF, g:=(c>>8)&0xFF
      , b:=c&0xFF, ascii[k]:=v:=(Abs(r-rr)<=dR
      and Abs(g-gg)<=dG and Abs(b-bb)<=dB)
      if (show[k])
        i:=(v?i+1:i-1), c:=(v?"Black":"White"), %Gui_%("SetColor")
    }
    bg:=i>0 ? "1":"0"
    return
  Case "Modify":
    GuiControlGet, Modify
    return
  Case "MultiColor":
    GuiControlGet, MultiColor
    Result:=""
    ToolTip
    return
  Case "Undo":
    Result:=RegExReplace(Result,",[^/]+/[^/]+/[^/]+$")
    ToolTip, % Trim(Result,"/,")
    return
  Case "Similar1":
    GuiControl, FindText_Capture:, Similar2, %Similar1%
    return
  Case "Similar2":
    GuiControl, FindText_Capture:, Similar1, %Similar2%
    return
  Case "GetTxt":
    txt:=""
    if (bg="")
      return
    ListLines, % (lls:=A_ListLines)?"Off":"Off"
    k:=0
    Loop, %nH%
    {
      v:=""
      Loop, %nW%
        v.=!show[++k] ? "" : ascii[k] ? "1":"0"
      txt.=v="" ? "" : v "`n"
    }
    ListLines, %lls%
    return
  Case "Auto":
    %Gui_%("GetTxt")
    if (txt="")
    {
      Gui, FindText_Capture: +OwnDialogs
      MsgBox, 4096, Tip, % "`n" Lang["13"] " !`n", 1
      return
    }
    While InStr(txt,bg)
    {
      if (txt~="^" bg "+\n")
        txt:=RegExReplace(txt,"^" bg "+\n"), %Gui_%("CutU")
      else if !(txt~="m`n)[^\n" bg "]$")
        txt:=RegExReplace(txt,"m`n)" bg "$"), %Gui_%("CutR")
      else if (txt~="\n" bg "+\n$")
        txt:=RegExReplace(txt,"\n\K" bg "+\n$"), %Gui_%("CutD")
      else if !(txt~="m`n)^[^\n" bg "]")
        txt:=RegExReplace(txt,"m`n)^" bg), %Gui_%("CutL")
      else Break
    }
    txt:=""
    return
  Case "OK","SplitAdd","AllAdd":
    Gui, FindText_Capture: Default
    Gui, +OwnDialogs
    %Gui_%("GetTxt")
    if (txt="") and (!MultiColor)
    {
      MsgBox, 4096, Tip, % "`n" Lang["13"] " !`n", 1
      return
    }
    if InStr(color,"@") and (UsePos) and (!MultiColor)
    {
      r:=StrSplit(color,"@")
      k:=i:=j:=0
      Loop, % nW*nH
      {
        if (!show[++k])
          Continue
        i++
        if (k=cors.SelPos)
        {
          j:=i
          Break
        }
      }
      if (j=0)
      {
        MsgBox, 4096, Tip, % "`n" Lang["12"] " !`n", 1
        return
      }
      color:="#" (j-1) "@" r.2
    }
    GuiControlGet, Comment
    if (cmd="SplitAdd") and (!MultiColor)
    {
      if InStr(color,"#")
      {
        MsgBox, 4096, Tip, % Lang["14"], 3
        return
      }
      bg:=StrLen(StrReplace(txt,"0"))
        > StrLen(StrReplace(txt,"1")) ? "1":"0"
      s:="", i:=0, k:=nW*nH+1+CutLeft
      Loop, % w:=nW-CutLeft-CutRight
      {
        i++
        if (!show[k++] and A_Index<w)
          Continue
        i:=Format("{:d}",i)
        v:=RegExReplace(txt,"m`n)^(.{" i "}).*","$1")
        txt:=RegExReplace(txt,"m`n)^.{" i "}"), i:=0
        While InStr(v,bg)
        {
          if (v~="^" bg "+\n")
            v:=RegExReplace(v,"^" bg "+\n")
          else if !(v~="m`n)[^\n" bg "]$")
            v:=RegExReplace(v,"m`n)" bg "$")
          else if (v~="\n" bg "+\n$")
            v:=RegExReplace(v,"\n\K" bg "+\n$")
          else if !(v~="m`n)^[^\n" bg "]")
            v:=RegExReplace(v,"m`n)^" bg)
          else Break
        }
        if (v!="")
        {
          v:=Format("{:d}",InStr(v,"`n")-1) "." FindText.bit2base64(v)
          s.="`nText.=""|<" SubStr(Comment,1,1) ">" color "$" v """`n"
          Comment:=SubStr(Comment, 2)
        }
      }
      Event:=cmd, Result:=s
      Gui, Hide
      return
    }
    if (!MultiColor)
      txt:=Format("{:d}",InStr(txt,"`n")-1) "." FindText.bit2base64(txt)
    else
    {
      GuiControlGet, dRGB
      r:=StrSplit(Trim(StrReplace(Result,",","/"),"/"),"/")
      , x:=r.1, y:=r.2, s:="", i:=1
      Loop, % r.MaxIndex()//3
        s.="," (r[i++]-x) "/" (r[i++]-y) "/" r[i++]
      txt:=SubStr(s,2), color:="##" dRGB
    }
    s:="`nText.=""|<" Comment ">" color "$" txt """`n"
    if (cmd="AllAdd")
    {
      Event:=cmd, Result:=s
      Gui, Hide
      return
    }
    x:=px-ww+CutLeft+(nW-CutLeft-CutRight)//2
    y:=py-hh+CutUp+(nH-CutUp-CutDown)//2
    s:=StrReplace(s, "Text.=", "Text:="), r:=StrSplit(Lang["8"],"|")
    s:="`; #Include <FindText>`n"
    . "`n t1:=A_TickCount, X:=Y:=""""`n" s
    . "`n if (ok:=FindText(" x "-150000, " y "-150000, " x "+150000, " y "+150000, 0, 0, Text))"
    . "`n {"
    . "`n   CoordMode, Mouse"
    . "`n   X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id"
    . "`n   `; Click, `%X`%, `%Y`%"
    . "`n }`n"
    . "`n MsgBox, 4096, Tip, `% """ r.1 ":``t"" Round(ok.MaxIndex())"
    . "`n   . ""``n``n" r.2 ":``t"" (A_TickCount-t1) "" " r.3 """"
    . "`n   . ""``n``n" r.4 ":``t"" X "", "" Y"
    . "`n   . ""``n``n" r.5 ":``t"" (ok ? """ r.6 " !"" : """ r.7 " !"")`n"
    . "`n for i,v in ok"
    . "`n   if (i<=2)"
    . "`n     FindText.MouseTip(ok[i].x, ok[i].y)`n"
    Event:=cmd, Result:=s
    Gui, Hide
    return
  Case "KeyDown":
    Critical
    if (A_Gui="FindText_Main" && A_GuiControl="scr")
      SetTimer, %Gui_ShowPic%, -150
    return
  Case "ShowPic":
    ControlGet, i, CurrentLine,,, ahk_id %hscr%
    ControlGet, s, Line, %i%,, ahk_id %hscr%
    GuiControl, FindText_Main:, MyPic, % Trim(FindText.ASCII(s),"`n")
    return
  Case "LButtonDown":
    Critical
    if (A_Gui!="FindText_Capture")
      return %Gui_%("KeyDown")
    MouseGetPos,,,, k2, 2
    if (k1:=Round(Cid_[k2]))<1
      return
    Gui, FindText_Capture: Default
    if (k1>71*25)
    {
      GuiControlGet, k3,, %k2%
      GuiControl,, %k2%, % k3 ? 0:100
      show[nW*nH+(k1-71*25)+dx]:=(!k3)
      return
    }
    k2:=Mod(k1-1,71)+dx, k3:=(k1-1)//71+dy
    if (k2>=nW || k3>=nH)
      return
    k1:=k, k:=k3*nW+k2+1, k2:=c
    if (MultiColor and show[k])
    {
      c:="," Mod(k-1,nW) "/" k3 "/"
      . Format("{:06X}",cors[k]&0xFFFFFF)
      , Result.=InStr(Result,c) ? "":c
      ToolTip, % Trim(Result,"/,")
    }
    else if (Modify and bg!="" and show[k])
    {
      c:=((ascii[k]:=!ascii[k]) ? "Black":"White")
      , %Gui_%("SetColor")
    }
    else
    {
      c:=cors[k], cors.SelPos:=k
      GuiControl,, SelGray, % gray[k]
      GuiControl,, SelColor, % Format("0x{:06X}",c&0xFFFFFF)
      GuiControl,, SelR, % (c>>16)&0xFF
      GuiControl,, SelG, % (c>>8)&0xFF
      GuiControl,, SelB, % c&0xFF
    }
    k:=k1, c:=k2
    return
  Case "MouseMove":
    static PrevControl:=""
    if (PrevControl!=A_GuiControl)
    {
      PrevControl:=A_GuiControl
      SetTimer, %Gui_ToolTip%, % PrevControl ? -500 : "Off"
      SetTimer, %Gui_ToolTipOff%, % PrevControl ? -5500 : "Off"
      ToolTip
    }
    return
  Case "ToolTip":
    MouseGetPos,,, _TT
    IfWinExist, ahk_id %_TT% ahk_class AutoHotkeyGUI
      ToolTip, % Tip_Text[PrevControl ""]
    return
  Case "ToolTipOff":
    ToolTip
    return
  Case "CutL2","CutR2","CutU2","CutD2":
    Gui, FindText_Main: Default
    GuiControlGet, s,, MyPic
    s:=Trim(s,"`n") . "`n", v:=SubStr(cmd,4,1)
    if (v="U")
      s:=RegExReplace(s,"^[^\n]+\n")
    else if (v="D")
      s:=RegExReplace(s,"[^\n]+\n$")
    else if (v="L")
      s:=RegExReplace(s,"m`n)^[^\n]")
    else if (v="R")
      s:=RegExReplace(s,"m`n)[^\n]$")
    GuiControl,, MyPic, % Trim(s,"`n")
    return
  Case "Update":
    Gui, FindText_Main: Default
    GuiControl, Focus, scr
    ControlGet, i, CurrentLine,,, ahk_id %hscr%
    ControlGet, s, Line, %i%,, ahk_id %hscr%
    if !RegExMatch(s,"(<[^>]*>[^$]+\$)\d+\.[\w+/]+",r)
      return
    GuiControlGet, v,, MyPic
    v:=Trim(v,"`n") . "`n", w:=Format("{:d}",InStr(v,"`n")-1)
    v:=StrReplace(StrReplace(v,"0","1"),"_","0")
    s:=StrReplace(s,r,r1 . w "." FindText.bit2base64(v))
    v:="{End}{Shift Down}{Home}{Shift Up}{Del}"
    ControlSend,, %v%, ahk_id %hscr%
    Control, EditPaste, %s%,, ahk_id %hscr%
    ControlSend,, {Home}, ahk_id %hscr%
    return
  Case "Load_Language_Text":
    s=
    (
Myww       = Width = Adjust the width of the capture range
Myhh       = Height = Adjust the height of the capture range
AddFunc    = Add = Additional FindText() in Copy
NowHotkey  = Hotkey = Current screenshot hotkey
SetHotkey1 = = First sequence Screenshot hotkey
SetHotkey2 = = Second sequence Screenshot hotkey
Apply      = Apply = Apply new screenshot hotkey and adjusted capture range values
CutU2      = CutU = Cut the Upper Edge of the text in the edit box below
CutL2      = CutL = Cut the Left Edge of the text in the edit box below
CutR2      = CutR = Cut the Right Edge of the text in the edit box below
CutD2      = CutD = Cut the Lower Edge of the text in the edit box below
Update     = Update = Update the text in the edit box below to the line of code
GetRange   = GetRange = Get screen range to clipboard and replace the range in the code
TestClip   = TestClipboard = Test the Text data in the clipboard for searching images
Capture    = Capture = Initiate Image Capture Sequence
CaptureS   = CaptureS = Restore the Saved ScreenShot By Hotkey and then start capturing
Test       = Test = Test Results of Code
Copy       = Copy = Copy Code to Clipboard
Reset      = Reset = Reset to Original Captured Image
SplitAdd   = SplitAdd = Using Markup Segmentation to Generate Text Library
AllAdd     = AllAdd = Append Another FindText Search Text into Previously Generated Code
OK         = OK = Create New FindText Code for Testing
Cancel     = Cancel = Close the Window Don't Do Anything
Gray2Two      = Gray2Two = Converts Image Pixels from Gray Threshold to Black or White
GrayDiff2Two  = GrayDiff2Two = Converts Image Pixels from Gray Difference to Black or White
Color2Two     = Color2Two = Converts Image Pixels from Color Similar to Black or White
ColorPos2Two  = ColorPos2Two = Converts Image Pixels from Color Position to Black or White
ColorDiff2Two = ColorDiff2Two = Converts Image Pixels from Color Difference to Black or White
SelGray    = Gray = Gray value of the selected color
SelColor   = Color = The selected color
SelR       = R = Red component of the selected color
SelG       = G = Green component of the selected color
SelB       = B = Blue component of the selected color
RepU       = -U = Undo Cut the Upper Edge by 1
CutU       = U = Cut the Upper Edge by 1
CutU3      = U3 = Cut the Upper Edge by 3
RepL       = -L = Undo Cut the Left Edge by 1
CutL       = L = Cut the Left Edge by 1
CutL3      = L3 = Cut the Left Edge by 3
Auto       = Auto = Automatic Cut Edge after image has been converted to black and white
RepR       = -R = Undo Cut the Right Edge by 1
CutR       = R = Cut the Right Edge by 1
CutR3      = R3 = Cut the Right Edge by 3
RepD       = -D = Undo Cut the Lower Edge by 1
CutD       = D = Cut the Lower Edge by 1
CutD3      = D3 = Cut the Lower Edge by 3
Modify     = Modify = Allows Modify the Black and White Image
MultiColor = FindMultiColor = Click multiple colors with the mouse, then Click OK button
Undo       = Undo = Undo the last selected color
Comment    = Comment = Optional Comment used to Label Code ( Within <> )
Threshold  = Gray Threshold = Gray Threshold which Determines Black or White Pixel Conversion (0-255)
GrayDiff   = Gray Difference = Gray Difference which Determines Black or White Pixel Conversion (0-255)
Similar1   = Similarity = Adjust color similarity as Equivalent to The Selected Color
Similar2   = Similarity = Adjust color similarity as Equivalent to The Selected Color
DiffR      = R = Red Difference which Determines Black or White Pixel Conversion (0-255)
DiffG      = G = Green Difference which Determines Black or White Pixel Conversion (0-255)
DiffB      = B = Blue Difference which Determines Black or White Pixel Conversion (0-255)
DiffRGB    = R/G/B = Determine the allowed R/G/B Error (0-255) when Find MultiColor
Bind0      = BindWindow1 = Bind the window and Use GetDCEx() to get the image of background window
Bind1      = BindWindow1+ = Bind the window Use GetDCEx() and Modify the window to support transparency
Bind2      = BindWindow2 = Bind the window and Use PrintWindow() to get the image of background window
Bind3      = BindWindow2+ = Bind the window Use PrintWindow() and Modify the window to support transparency
Bind4      = BindWindow3 = Bind the window and Use PrintWindow(,,3) to get the image of background window
OK2        = OK = Restore this ScreenShot
Cancel2    = Cancel = Close the Window Don't Do Anything
ClearAll   = ClearAll = Clean up all saved ScreenShots
OpenDir    = OpenDir = Open the saved screenshots directory
1  = FindText
2  = Gray|GrayDiff|Color|ColorPos|ColorDiff|MultiColor
3  = Capture Image To Text
4  = Capture Image To Text And Find Text Tool
5  = Position|First click RButton\nMove the mouse away\nSecond click RButton
6  = Unbind Window using
7  = Please drag a range with the LButton\nCoordinates are copied to clipboard
8  = Found|Time|ms|Pos|Result|Success|Failed
9  = Success
10 = The Capture Position|Perspective binding window\nRight click to finish capture
11 = Please Set Gray Difference First
12 = Please select the core color first
13 = Please convert the image to black or white first
14 = Can't be used in ColorPos mode, because it can cause position errors
15 = Please set Hotkey and use Hotkey to get ScreenShot first
    )
    Lang:=[], Tip_Text:=[]
    Loop, Parse, s, `n, `r
      if InStr(v:=A_LoopField, "=")
        r:=StrSplit(StrReplace(v,"\n","`n"), "=", "`t ")
        , Lang[r.1 ""]:=r.2, Tip_Text[r.1 ""]:=r.3
    return
  }
}

}  ;// Class End

;================= The End =================

;
