------------------------------
-- imports
------------------------------
import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Loggers

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier

import XMonad.Hooks.EwmhDesktops

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
------------------------------
-- mis layouts
------------------------------
myLayout = smartBorders $ tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.2 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Número predeterminado de ventanas en el panel maestro
    ratio    = 1/2    -- Proporción predeterminada de la ventana ocupada por el panel maestro
    delta    = 4/100  -- Porcentaje de la pantalla a incrementar en un entorno resize
------------------------------
-- función main
------------------------------
main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) toggleStrutsKey
     $ myConfig
  where
    toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    toggleStrutsKey XConfig{ modMask = m } = (m, xK_m)
------------------------------
-- config
------------------------------
myConfig = def
  { terminal	= "kitty"
  , modMask     = mod4Mask
  , borderWidth	= 5
  , layoutHook  = spacingRaw True (Border 0 3 3 3) True (Border 3 3 3 3) True $ myLayout
  , focusedBorderColor  = "#65f298"
  , normalBorderColor   = "#000000"
  }
------------------------------
-- launchers
------------------------------
  `additionalKeysP`
  [ ("M-<Return>", spawn "kitty")
  , ("M-c", kill)
  , ("M-p", spawn "rofi -show run")
  , ("M-f", spawn "pcmanfm")
  , ("M-b", spawn "vivaldi-stable")
  , ("M-S-b", spawn "qutebrowser")
  --, ("M-y", spawn "manuskript")
  , ("M-o", spawn "libreoffice")
  , ("M-S-o", spawn "lowriter")
  , ("M-S-n", spawn "wpdesk")
  , ("M-S-m", spawn "rembar")
  , ("M-z", spawn "zathura")
  , ("M-ñ", spawn "screenkey")
  , ("M-S-ñ", spawn "pkill screenkey")
  , ("M-y", spawn "sr")
  , ("M-S-y", spawn "srstop")
  , ("M-s", unGrab *> spawn "scrot -s")
  , ("M-u", spawn "scrot -u")
  , ("<Print>", spawn "scrot")
  , ("<XF86MonBrightnessDown>", spawn "light -U 4")
  , ("<XF86MonBrightnessUp>", spawn "light -A 4")
  , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +2%")
  , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -2%")
  , ("<XF86AudioMute>", spawn "pactl set-sink-mute 0 toggle")
  ]
------------------------------
-- función xmobar
------------------------------
myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = orange " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = green . wrap " " "" . xmobarBorder "Top" "#00b333" 2
    , ppHidden          = yellow . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . orange . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30 --Extensión título de ventana (30)

    blue, lowWhite, orange, red, white, yellow, green :: String -> String
    orange   = xmobarColor "#ff7e3f" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#555555" ""
    green    = xmobarColor "#00ff88" ""
