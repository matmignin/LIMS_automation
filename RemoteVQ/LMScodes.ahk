#NoEnv
#SingleInstance, Force
SendMode, Input
#maxthreadsperhotkey, 2
SetWorkingDir, %A_ScriptDir%

#Include JSON.ahk

; ; Read the mock data from a file
; jsonFile :=
FileRead, jsonFile, LMScodes.json

; Parse the JSON data
parsedJson := Json.Load(jsonFile)

; Loop through the products
for product in parsedJson {
    ; Output the product name
    MsgBox % "Product: " parsedJson.product

    ; Loop through the batches
    for batch in aproduct.batches {
        ; Output the batch number
        MsgBox % "Batch: " batch.batch

        ; Loop through the lots
        for lot in batch.lots {
            ; Output the lot number
            MsgBox  "Lot: " lot.lot
        }
    }
}

return

; ; Parse the JSON
; obj := Json.Parse(jsonFile)

; ; Loop through the products
; for product in obj["products"]
; {
;     MsgBox % "Product: " product["product"]
;     ; Loop through the batches
;     for batch in product["batches"]
;     {
;         MsgBox % "    Batch: " batch["batch"] " coated: " batch["coated"]
;         ; Loop through the lots
;         for lot in batch["lots"]
;         {
;             MsgBox % "        Lot: " lot["lot"]
;         }
;     }
; }
; msgbox % product["product"]

; return