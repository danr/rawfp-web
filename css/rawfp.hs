{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Monoid
import Clay

main :: IO ()
main = putCss $ do

    body ? do
        fontFamily ["Open Sans"] []
        fontSize (px 16)
        paddingBottom (em 4)

    (ul # ".nav") ? li ? a ? do
        paddingLeft  (px 10)
        paddingRight (px 10)

    ".Background" <> ".DSLs" <> ".Telecom" <> ".Automotive" ? do
        ".content" ? do
            ".page-header" <> p <> li ? do
                maxWidth (em 45)
                lineHeight (em 1.5)
            p <> li ? do
                marginBottom (em 1.5)

    ".jumbotron" ? do
        "text-align" -: "center"

