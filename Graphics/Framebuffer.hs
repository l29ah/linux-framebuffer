{-|
This module reexports the functions you probably want to use. "Graphics.Framebuffer.Internal" does all the heavy lifting.
 -}

module Graphics.Framebuffer
	( getVarScreenInfo
	, C'fb_var_screeninfo(..)
	) where
import Graphics.Framebuffer.Internal
