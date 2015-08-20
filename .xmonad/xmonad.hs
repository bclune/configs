import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.NoBorders
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Hooks.SetWMName

myLayout = tiled ||| noBorders Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio
 
    -- The default number of windows in the master pane
    nmaster = 1
 
    -- Default proportion of screen occupied by master pane
    ratio   = 146/226
 
    -- Percent of screen to increment by when resizing panes
    delta   = 1/226

main = xmonad $ gnomeConfig { layoutHook            = desktopLayoutModifiers(myLayout),
                             modMask               = mod4Mask,
                             normalBorderColor     = "#073642",
                             focusedBorderColor    = "#586e75"
                            }
