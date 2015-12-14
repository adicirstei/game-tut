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

type Vec = (Float, Float)
type Pill = {pos : Vec, vel : Vec, rad : Float, col : Color }


defaultPill =
  { pos = (0, 100)
  , vel = (0, -1)
  , rad = 15
  , col = lightRed
  }

stepPill : Pill -> Pill
stepPill p =
  { p | pos = vecAdd p.pos p.vel }


render (w, h) =
  let
    formPill {rad, col, pos} =
      circle rad
      |> filled col
      |> move pos
    forms = [ formPill defaultPill]
  in
    color lightGray <| container w h middle
      <| color white
      <| collage 400 400 forms


main = Signal.map render Window.dimensions
