### installation and testing

`hakyll`'s dependencies are a bit awkward, so use a sandbox:

    cabal init sandbox
    cabal install
    .cabal-sandbox/bin/rawfp-web watch
