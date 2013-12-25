import System.IO

import XMonad
import XMonad.Layout.Fullscreen
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Config.Xfce
import XMonad.Util.EZConfig
import XMonad.Layout.ResizableTile
import XMonad.Hooks.SetWMName

main = do
    xmonad $ xfceConfig
        { modMask = myModMask
	, terminal = "exo-open --launch TerminalEmulator" 
        , layoutHook = myLayout
        , startupHook = setWMName "LG3D"
        } `additionalKeys` myKeyBindings

myLayout = smartBorders $ avoidStruts (
    Full |||
    Tall 1 (3/100) (1/2) |||
    ResizableTall 1 (3/100) (1/2) [] |||
    Mirror (Tall 1 (3/100) (1/2))) |||
    noBorders (fullscreenFull Full)

myModMask = mod4Mask

myKeyBindings = 
    [ ((myModMask, xK_s), spawn "synapse")
    , ((myModMask, xK_f), spawn "exo-open --launch FileManager")
    , ((myModMask, xK_w), spawn "google-chrome")
    , ((myModMask, xK_p), spawn "xfce4-display-settings --minimal")
    , ((myModMask, xK_b), sendMessage ToggleStruts)
    , ((myModMask, xK_a), sendMessage MirrorShrink)
    , ((myModMask, xK_z), sendMessage MirrorExpand)
    ]
