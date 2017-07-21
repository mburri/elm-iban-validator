module IBAN exposing (validate)

import String.Extra


type alias IBAN =
    String


validate : IBAN -> Bool
validate iban =
    let
        rearranged =
            (String.dropLeft 4 iban) ++ (String.left 4 iban)

        replaced =
            String.Extra.replace "CH" "1217" rearranged
    in
        validateIban replaced


validateIban : String -> Bool
validateIban value =
    if (String.length value) <= 10 then
        let
            v =
                value |> String.toInt |> Result.withDefault 0
        in
            (v % 97) == 1
    else
        let
            modOfFirst10Digits =
                (value
                    |> String.left 10
                    |> String.toInt
                    |> Result.withDefault 0
                )
                    % 97

            newValue =
                (modOfFirst10Digits |> toString)
                    ++ (value
                            |> String.dropLeft 10
                       )
        in
            validateIban newValue
