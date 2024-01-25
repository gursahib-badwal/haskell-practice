{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_v4 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\SAINI\\OneDrive\\Desktop\\CMPT 383\\CMPT-383-Vitamins\\v4\\.stack-work\\install\\76c540f9\\bin"
libdir     = "C:\\Users\\SAINI\\OneDrive\\Desktop\\CMPT 383\\CMPT-383-Vitamins\\v4\\.stack-work\\install\\76c540f9\\lib\\x86_64-windows-ghc-9.0.2\\v4-0.1.0.0-1sLepCQI0Ux7R4aJ6EQfWX-v4-test"
dynlibdir  = "C:\\Users\\SAINI\\OneDrive\\Desktop\\CMPT 383\\CMPT-383-Vitamins\\v4\\.stack-work\\install\\76c540f9\\lib\\x86_64-windows-ghc-9.0.2"
datadir    = "C:\\Users\\SAINI\\OneDrive\\Desktop\\CMPT 383\\CMPT-383-Vitamins\\v4\\.stack-work\\install\\76c540f9\\share\\x86_64-windows-ghc-9.0.2\\v4-0.1.0.0"
libexecdir = "C:\\Users\\SAINI\\OneDrive\\Desktop\\CMPT 383\\CMPT-383-Vitamins\\v4\\.stack-work\\install\\76c540f9\\libexec\\x86_64-windows-ghc-9.0.2\\v4-0.1.0.0"
sysconfdir = "C:\\Users\\SAINI\\OneDrive\\Desktop\\CMPT 383\\CMPT-383-Vitamins\\v4\\.stack-work\\install\\76c540f9\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "v4_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "v4_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "v4_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "v4_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "v4_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "v4_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
