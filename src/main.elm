import Mouse
import Window
import Signal
import Time
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

--
relativeMouse : (Int, Int) -> (Int, Int) -> (Int, Int)
relativeMouse (ox, oy) (x, y) = (x - ox, y - oy)

center : (Int, Int) -> (Int, Int)
center (w, h) = (w //2, h // 2)

type alias Vec = (Float, Float)
type alias Pill = {pos : Vec, vel : Vec, rad : Float, col : Color }


vecAdd : Vec -> Vec -> Vec
vecAdd (ax, ay) (bx, by) = ( ax + bx, ay + by )

vecMulS : Vec -> Time.Time -> Vec
vecMulS (x, y) s = (x*s, y*s)


defaultPill =
  { pos = (0, 0)
  , vel = (0, -60)
  , rad = 15
  , col = lightRed
  }

stepPill : Time.Time -> Pill -> Pill
stepPill t p =
  { p | pos = vecAdd p.pos <| vecMulS p.vel t }

render : (Int, Int) -> Pill -> Element
render (w, h) pill =
  let
    formPill {rad, col, pos} =
      circle rad
      |> filled col
      |> move pos
    forms = [ formPill pill ]
  in
    color lightGray <| container w h middle
      <| color white
      <| collage 400 400 forms

sig = Signal.map Time.inSeconds (Time.fps 30)

main = Signal.map2 render Window.dimensions (Signal.foldp stepPill defaultPill sig)
--}
