import XMonad
import XMonad.Layout.Fullscreen
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders

main = do
  xmonad $ defaultConfig
    { modMask = mod4Mask
    , terminal = "urxvt" 
    , layoutHook = myLayout }

myLayout = avoidStruts (
    Full |||
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2))) |||
    noBorders (fullscreenFull Full)
