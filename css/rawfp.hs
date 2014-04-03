{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Monoid
import Clay
-- import qualified Data.Text.Lazy.IO as T

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

{-
body
  font-family: 'Open Sans'
  padding-bottom: 4em
  font-size: 16px

ul.nav li a
  padding-left: 10px
  padding-right: 10px

.Background,.DSLs,.Telecom,.Automotive
  .content
    .page-header, p, li
      max-width: 45em
      line-height: 1.5
    p, li
      margin-bottom: 1.5em

.jumbotron
  text-align:center
  -}
