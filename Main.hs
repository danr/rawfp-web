{-# LANGUAGE OverloadedStrings #-}
module Main where

import Hakyll

main :: IO ()
main = hakyll $ do
    match "bootstrap/css/bootstrap.min.css" $ do
        route (constRoute "css/bootstrap.css")
        compile compressCssCompiler

    match "css/*.sass" $ do
        route $ setExtension "css"
        compile $
            getResourceString >>=
            withItemBody (unixFilter "sass" ["-s"]) >>=
            return . fmap compressCss

    match "*.md" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/bootstrap.html" defaultContext
            >>= relativizeUrls

{-
    match (fromList ["background.md"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/bootstrap.html" defaultContext
            >>= relativizeUrls
            -}

    match "templates/*" $ compile templateCompiler
