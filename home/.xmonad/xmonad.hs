import System.IO

import XMonad
import XMonad.Layout.Fullscreen
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Config.Xfce

main = do
    xmonad $ xfceConfig
        { modMask = mod4Mask
        , terminal = "urxvt" 
        , layoutHook = myLayout
        }

myLayout = smartBorders $ avoidStruts (
    Full |||
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2))) |||
    noBorders (fullscreenFull Full)
