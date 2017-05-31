{-# LANGUAGE CPP, ScopedTypeVariables #-}
module Main where

import Lib
import Control.Exception

data ExceptionWithLocation = ExceptionWithLocation String deriving (Show)
instance Exception ExceptionWithLocation

baz :: IO ()
baz = throw (ExceptionWithLocation (__FILE__ ++ " " ++ (show __LINE__)))
bar :: IO ()
bar = baz
foo :: IO ()
foo = bar
main :: IO ()
main = foo `catch` \(e :: SomeException) -> putStrLn (show e)
