import Mouse
import Window
import Signal
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

relativeMouse : (Int, Int) -> (Int, Int) -> (Int, Int)
relativeMouse (ox, oy) (x, y) = (x - ox, y - oy)

center : (Int, Int) -> (Int, Int)
center (w, h) = (w //2, h // 2)

render (w, h) =
  let forms = [circle 15 |> filled lightBlue]
  in
    color lightGray <| container w h middle
      <| color white
      <| collage 400 400 forms


main = Signal.map render Window.dimensions
