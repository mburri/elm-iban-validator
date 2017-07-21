module Tests exposing (..)

import Expect
import IBAN
import Test exposing (..)


all : Test
all =
    describe "IBan validator Test Suite"
        [ describe "Validate CH Iban"
            [ test "valid ch iban" <|
                \() ->
                    "CH9300762011623852957"
                        |> IBAN.validate
                        |> Expect.equal True
            , test "invalid ch iban" <|
                \() ->
                    "CH9300762011623852958"
                        |> IBAN.validate
                        |> Expect.equal False
            ]
        ]
