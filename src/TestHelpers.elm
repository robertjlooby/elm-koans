module TestHelpers (..) where

import Date
import Set


xBool =
  False


xString =
  "-"


xChar =
  '-'


xNum =
  -1


xList =
  []


xMaybe =
  Just 0


xResult =
  Ok 0


xTime =
  0


xMonth =
  Date.Apr


xDay =
  Date.Mon


xSet =
  Set.singleton 1


xRecord =
  { x = 0, y = 0, z = 0 }


xTuple =
  ( 0, 0 )


xTuple2 =
  ( 100, "" )


xTuple3 =
  ( 1, "hello", [ 1, 2, 3 ] )
