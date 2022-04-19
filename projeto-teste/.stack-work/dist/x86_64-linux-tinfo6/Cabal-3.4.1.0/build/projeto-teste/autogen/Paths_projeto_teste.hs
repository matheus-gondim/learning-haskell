{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_projeto_teste (
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

bindir     = "/home/matheus-gondim/development/learning-haskell/projeto-teste/.stack-work/install/x86_64-linux-tinfo6/89f97f7cae7319589dde22c8b85c688519842f5bae67147c14531b8101fb635e/9.0.2/bin"
libdir     = "/home/matheus-gondim/development/learning-haskell/projeto-teste/.stack-work/install/x86_64-linux-tinfo6/89f97f7cae7319589dde22c8b85c688519842f5bae67147c14531b8101fb635e/9.0.2/lib/x86_64-linux-ghc-9.0.2/projeto-teste-0.1.0.0-5Zg4AFQJM5q5lAGsY2oh31-projeto-teste"
dynlibdir  = "/home/matheus-gondim/development/learning-haskell/projeto-teste/.stack-work/install/x86_64-linux-tinfo6/89f97f7cae7319589dde22c8b85c688519842f5bae67147c14531b8101fb635e/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/matheus-gondim/development/learning-haskell/projeto-teste/.stack-work/install/x86_64-linux-tinfo6/89f97f7cae7319589dde22c8b85c688519842f5bae67147c14531b8101fb635e/9.0.2/share/x86_64-linux-ghc-9.0.2/projeto-teste-0.1.0.0"
libexecdir = "/home/matheus-gondim/development/learning-haskell/projeto-teste/.stack-work/install/x86_64-linux-tinfo6/89f97f7cae7319589dde22c8b85c688519842f5bae67147c14531b8101fb635e/9.0.2/libexec/x86_64-linux-ghc-9.0.2/projeto-teste-0.1.0.0"
sysconfdir = "/home/matheus-gondim/development/learning-haskell/projeto-teste/.stack-work/install/x86_64-linux-tinfo6/89f97f7cae7319589dde22c8b85c688519842f5bae67147c14531b8101fb635e/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "projeto_teste_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "projeto_teste_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "projeto_teste_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "projeto_teste_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "projeto_teste_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "projeto_teste_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
