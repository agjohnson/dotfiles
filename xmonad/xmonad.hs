import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.LayoutHints
import XMonad.Layout.Named
import XMonad.Layout.ResizableTile
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.LayoutHints
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.ManageHook
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import System.IO
import qualified XMonad.StackSet as W

main = do
    hXmobar <- spawnPipe "/usr/bin/xmobar"
    xmonad =<< xmobar ((withUrgencyHook NoUrgencyHook) defaultConfig
        { modMask               = mod4Mask
        , terminal              = "termite"
        , workspaces            = map show [1..6]
        , normalBorderColor     = colorNormalBorder
        , focusedBorderColor    = colorFocusedBorder
        , borderWidth           = 3
        , layoutHook            = avoidStruts $ wmLayout
        , manageHook            = manageDocks <+> wmManage <+> manageHook defaultConfig
        , logHook               = wmLog hXmobar
        } `additionalKeys` wmKeys)

-- Colors
colorNormalBorder   = "#4d4843"
colorFocusedBorder  = "#FFC469"

-- Layout
wmLayout = layoutHints (wmLayoutTall ||| wmLayoutWide ||| Full ||| wmLayoutTiny ||| wmLayoutResize ||| wmLayoutFull ||| wmLayoutFlat)

wmLayoutTall = named "Tall" (Tall 1 (3/100) (6/10))
wmLayoutWide = named "Wide" (Mirror $ Tall 1 (3/100) (7/10))
wmLayoutTiny = named "Tiny" (Tall 1 (1/10) (7/10))
wmLayoutResize = named "Tall" (ResizableTall 1 (3/100) (1/2) [])
wmLayoutFull = named "Full" (noBorders (fullscreenFull Full))
wmLayoutFlat = named "Tall" (noBorders (layoutHintsToCenter (Tall 1 (3/100) (6/10))))

-- Keys
wmKeys =
    [ ((mod4Mask, xK_z), sendMessage MirrorShrink)
    , ((mod4Mask, xK_a), sendMessage MirrorExpand)
    , ((0 , 0x1008ff11), spawn "amixer set Master 5-")
    , ((0 , 0x1008ff13), spawn "amixer set Master 5+")
    , ((0 , 0x1008ff12), spawn "amixer set Master toggle")
    ]

-- Manage
wmManage =
    composeAll 
        [ resource =? "pidgin" --> doFloat
        , resource =? "virt-manager" --> doFloat
        , resource =? "chromium-browser" --> doF (W.swapMaster)
        ]

-- Logging/Status
wmLog h = dynamicLogWithPP $ defaultPP
    { ppOutput              = hPutStrLn h
    , ppCurrent             = xmobarColor colorFocusedBorder "" . pad
    , ppVisible             = xmobarColor "#fb365b" "" . pad
    , ppHidden              = xmobarColor "#D1C8BC" "" . pad
    , ppHiddenNoWindows     = xmobarColor "#5C5245" "" . pad
    , ppUrgent              = xmobarColor "#101010" colorFocusedBorder . pad
    , ppWsSep               = ""
    , ppSep                 = " : "
    , ppLayout              = (\x -> case x of
        "Hinted Tall" -> "#"
        "Hinted Wide" -> "!"
        "Hinted Full" -> "*"
        "Hinted Tiny" -> "@"
        _             -> "~"
    )
    , ppTitle               = xmobarColor colorFocusedBorder "" . shorten 50
    }

