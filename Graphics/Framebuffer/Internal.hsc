module Graphics.Framebuffer.Internal where
#strict_import
#include <linux/fb.h>
#include <bindings.dsl.h>

import System.IO
import System.Posix.IO
import System.Posix.Types

#starttype struct fb_var_screeninfo
#field xres , Word32
#field yres , Word32
#field bits_per_pixel , Word32
#stoptype

#num FBIOGET_VSCREENINFO
#num FBIOPUT_VSCREENINFO
#num FBIOGET_FSCREENINFO
#num FBIOGETCMAP
#num FBIOPUTCMAP
#num FBIOPAN_DISPLAY

#ccall ioctl , Fd -> CInt -> Ptr <struct fb_var_screeninfo> -> IO CInt

-- | Asks the properties of the supplied framebuffer device
getVarScreenInfo :: Handle -> IO C'fb_var_screeninfo
getVarScreenInfo h = do
	fd <- handleToFd h
	alloca $ \ptr -> c'ioctl fd c'FBIOGET_VSCREENINFO ptr >> peek ptr
