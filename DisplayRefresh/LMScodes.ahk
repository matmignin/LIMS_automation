#NoEnv
#SingleInstance, Force
SendMode, Input
#maxthreadsperhotkey, 2
SetWorkingDir, %A_ScriptDir%

#Include, JSON.ahk

; Read the mock data from a file
json := FileRead("LMScodes.json")

; Parse the JSON data
parsedJson := Json.Parse(json)

; Loop through the products
for product in parsedJson.products {
    ; Output the product name
    MsgBoxv% "Product: " product.product

    ; Loop through the batches
    for batch in product.batches {
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