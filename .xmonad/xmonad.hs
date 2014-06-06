--
--xmonad 
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import Data.Monoid
import System.Exit
import XMonad.Layout.NoBorders

import Data.List 
import XMonad.Hooks.ManageDocks
import Control.Monad (liftM2)

import Control.Monad (liftM2)
import XMonad.Util.EZConfig
import XMonad.Util.CustomKeys
import qualified XMonad.StackSet as W
import qualified Data.Map as M

import XMonad.Layout.PerWorkspace
import XMonad.Hooks.DynamicLog

import XMonad.Actions.WindowGo

import XMonad.Hooks.EwmhDesktops

import XMonad.Hooks.ManageHelpers

myManageHook = composeAll  . concat $
	[  [ className =? "Xmessage"  --> doFloat ]
	,  [ className =? "Zenity"  --> doFloat ]
	,  [ className =? "Gimp"  --> viewShift "2" ]
	,  [ className =? "Vlc"  --> viewShift "1" ]
	,  [ className =? "Thunar"  --> viewShift "1" ]
	,  [ className =? "Firefox"  --> viewShift "1" ]
	,  [(className =? "Firefox" <&&> resource =? "Dialog") --> doFloat]
	,  [(className =? "Firefox" <&&> resource =? "Browser") --> doFloat]
	,  [ isFullscreen --> doFullFloat ]
	]
        where viewShift = doF . liftM2 (.) W.greedyView W.shift


myTerminal      = "urxvt -tr -rv -tint darkgrey"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth   = 1

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod1Mask

myWorkspaces    = ["1","2","3"]

myNormalBorderColor  = "#999999"
myFocusedBorderColor = "#ffffff"
------------------------------------------------------------------------
-- Layouts:
myLayout = 	avoidStruts $
		onWorkspace "3" l1 $
		l2
l1 = smartBorders ( Mirror tiled )
	where 
	tiled= Tall nmaster delta ratio
	nmaster=2
	delta=3/100
	ratio=1/2

l2 =  noBorders ( Full )
------------------------------------------------------------------------

mykeys = customKeys delkeys inskeys
	where
delkeys :: XConfig l -> [(KeyMask, KeySym)]
delkeys XConfig {modMask = modm} =
           -- we're preferring Futurama to Xinerama here
           [ (modm .|. m, k) | (m, k) <- zip [0, shiftMask] [xK_w, xK_e, xK_r] ]

inskeys :: XConfig l -> [((KeyMask, KeySym), X ())]
inskeys conf@(XConfig {modMask = modm}) =
		[((mod1Mask,             xK_Down), spawn "amixer set Master 1-")
		,((mod1Mask,             xK_Up  ), spawn "amixer set Master 1+")
		, ((0            , 0x1008ff11), spawn "amixer -q set Master unmute & amixer -q set LFE unmute & amixer -q set PCM 7%-")
		, ((0            , 0x1008ff13), spawn "amixer -q set Master unmute & amixer -q set LFE unmute & amixer -q set PCM 7%+")
		, ((0            , 0x1008ff12), spawn "amixer -q set Master toggle & amixer -q set LFE toggle")
		,((mod1Mask,           xK_u ), spawn "devmon -u")
		,((modm 	, xK_f), runOrRaiseMaster "firefox" (className =? "Firefox"))
		,((modm 	, xK_a), runOrRaiseMaster "thunar" (className =? "Thunar"))
		,((mod1Mask,           xK_s ), spawn "plug_monitor")
		,((modm,	xK_b     ), sendMessage ToggleStruts)
		,((mod1Mask,             0xf1), spawn "ping -W 2 -c 5 www.google.es | dzen2")
		]
--------------------------------------------------------------------
myMouseBindings :: XConfig Layout -> M.Map (KeyMask, Button) (Window -> X ())
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
	[ ((modMask, button1), (\w -> focus w >> windows W.shiftMaster))]
------------------------------------------------------------------------

myStartupHook = do
        spawn ""

------------------------------------------------------------------------

main = xmonad $ ewmh defaults
defaults = defaultConfig {
	handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook,
	-- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

	-- hooks, layouts 
	manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig,
	layoutHook         = smartBorders (myLayout),
	startupHook        = myStartupHook,
    
	-- keybindings
	mouseBindings      = myMouseBindings,
	keys		   = mykeys
}
