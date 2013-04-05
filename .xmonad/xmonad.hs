import XMonad
import XMonad.Config.Gnome
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Hooks.SetWMName

myManageHook = composeAll (
    [ manageHook gnomeConfig
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat
    ])

myLayout = tiled ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio
 
    -- The default number of windows in the master pane
    nmaster = 1
 
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2
 
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

main = xmonad $ gnomeConfig { manageHook            = myManageHook, 
                              layoutHook            = desktopLayoutModifiers(myLayout), 
                              modMask               = mod4Mask,
                              normalBorderColor     = "#073642", 
                              focusedBorderColor    = "#586e75",
                              startupHook           = setWMName "LG3D" }
