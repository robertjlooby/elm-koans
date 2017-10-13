module Utils.Blank
    exposing
        ( FILL_ME_IN
        , me____x
        , x____replace
        )


type FILL_ME_IN
    = Blank


me____x : FILL_ME_IN
me____x =
    Blank


x____replace : FILL_ME_IN -> a
x____replace _ =
    Debug.crash "FILL IN THE BLANK"
