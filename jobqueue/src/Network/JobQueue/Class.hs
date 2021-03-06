-- Copyright (c) Gree, Inc. 2013
-- License: MIT-style

{- | Class definitions
-}
module Network.JobQueue.Class where

{- | Environment class
-}
class Env a where

{- | Description class
-}
class (Show a) => Desc a where
  {- | Define the description of a unit.
  -}
  desc :: a -> String
  desc x = show x
  
  {- | Define the short description of a unit.
  -}
  shortDesc :: a -> String
  shortDesc x = takeWhile (/= ' ') $ show x

{- | Unit class
-}
class (Read a, Show a, Desc a, Eq a) => Unit a where
  {- | Define the priority of a unit.
  -}
  getPriority :: a -> Int
  getPriority _ju = 1
  
  {- | Define the recovery state of a unit.
  -}
  getRecovery :: a -> a
  getRecovery ju = ju

  {- | Define the logging necessity of a unit.
  -}
  toBeLogged :: a -> Bool
  toBeLogged _ju = False
