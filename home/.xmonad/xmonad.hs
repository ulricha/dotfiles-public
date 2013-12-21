import System.IO

import XMonad
import XMonad.Layout.Fullscreen
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog

main = do
    xmproc <- spawnPipe "/home/au/.cabal/bin/xmobar /home/au/.xmobarrc"
  
    xmonad $ defaultConfig
        { modMask = mod4Mask
        , terminal = "urxvt" 
        , layoutHook = myLayout
        , manageHook =  manageDocks <+> manageHook defaultConfig
	, logHook = dynamicLogWithPP xmobarPP { ppOutput = hPutStrLn xmproc }
        }

myLayout = avoidStruts (
    Full |||
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2))) |||
    noBorders (fullscreenFull Full)
