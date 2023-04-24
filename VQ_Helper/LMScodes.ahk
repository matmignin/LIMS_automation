#NoEnv
#SingleInstance, Force
#Persistent
SendMode, Input
; #maxthreadsperhotkey, 2
SetWorkingDir, %A_ScriptDir%

#Include JSON.ahk
; #Include JsonTree.ahk

product = "K303"
batch = "101-0215"
lot = "4658H8"
coated = "null"

data = {"product": product, "batch": batch, "lot": lot, "coated": coated}

; with open("LMScodes.json", "w") as f:
; ; Read the mock data from a file
; jsonFile :=
;---------------------
product := "K555"
batch := "111-5555"
lot := "4655H8,4558H2B"
coated := "101-5551"

; Create the data structure
; json := JsonTree()
; json["product"] := product
; json["batch"] := batch
; json["lot"] := lot
; json["coated"] := coated

; ; Write the json data to a file
; json.append("LMScodes.json")
; ------------------
; Parse the JSON data
; Json := Json.Load(jsonFile)

FileRead, jsonFile, LMScodes.json
    json.dump(jsonFile)

; ; MsgBox % Json.Products[1].product " " Json.Products[1].Batches[1].batch " " Json.Products[1].Batches[1].lots[1].lot "/" Json.Products[1].Batches[1].lots[2].lot

; ;  " " Json.Products[1].Batches[1].batch " " Json.Products[1].Batches[1].lots[1].lot "/" Json.Products[1].Batches[1].lots[2].lot
; ; ; Loop through the products
; for i, obj in Json.products
; {
;     for k, v in obj
;     ; if (v.Batch = "Police")
;     ; {
;         MsgBox % k[i].product " " v.batch ;[batches].batch
;     ; }
; }
; {
;     for k, v in obj
;     ; if (v.Batch = "Police")
;     ; {
;         MsgBox % v.batch ;[batches].batch
;     ; }
; }
; ;     ; Output the product name

; ;     ; Loop through the batches
; ;     for batch in aproduct.batches {
; ;         ; Output the batch number
; ;         MsgBox % "Batch: " batch.batch

; ;         ; Loop through the lots
; ;         for lot in batch.lots {
; ;             ; Output the lot number
; ;             MsgBox  "Lot: " lot.lot
; ;         }
; ;     }
; ; }
; return

; ; ; Parse the JSON
; ; obj := Json.Parse(jsonFile)

; ; ; Loop through the products
; ; for product in obj["products"]
; ; {
; ;     MsgBox % "Product: " product["product"]
; ;     ; Loop through the batches
; ;     for batch in product["batches"]
; ;     {
; ;         MsgBox % "    Batch: " batch["batch"] " coated: " batch["coated"]
; ;         ; Loop through the lots
; ;         for lot in batch["lots"]
; ;         {
; ;             MsgBox % "        Lot: " lot["lot"]
; ;         }
; ;     }
; ; }
; ; msgbox % product["product"]

; ; return