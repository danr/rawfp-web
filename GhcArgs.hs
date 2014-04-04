module GhcArgs (ghcArgs) where

import CabalCargs.Args (Args(..))
import qualified CabalCargs.Format as F
import CabalCargs.Formatting
import CabalCargs.CompilerArgs (fromCmdArgs)
import Control.Applicative

-- | Get the command line parameters that cabal would pass to GHC
ghcArgs :: IO [String]
ghcArgs = do
    let args = Args { library    = True
                    , executable = []
                    , testSuite  = []
                    , benchmark  = []
                    , only       = []
                    , format     = Ghc
                    , sourceFile = Nothing
                    , cabalFile  = Nothing
                    , enable     = []
                    , disable    = []
                    , os         = Nothing
                    , arch       = Nothing
                    , relative   = False
                    }
    either error (F.format Ghc) <$> fromCmdArgs args
