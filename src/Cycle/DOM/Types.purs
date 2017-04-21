module Cycle.DOM.Types
  ( VNode
  , VNodeData
  , DOMSource(..)
  , MainDOMSource
  , Selector(..)
  , Driver
  ) where

import Control.Monad.Eff (Eff)
import Control.XStream (Stream)
import DOM (DOM)
import DOM.Event.Event (Event)
import DOM.Event.Types (EventType)
import DOM.Node.Types (Element)
import Prelude (Unit)

newtype DOMSource = DOMSource MainDOMSource

type MainDOMSource =
  { select :: Selector -> DOMSource
  , elements :: Unit -> Stream Element
  , events :: EventType -> Stream Event
  }

type Driver e = Stream VNode -> Eff (dom :: DOM | e) MainDOMSource

newtype Selector = Selector String

type VNodeData =
  {}

type VNode =
  { text :: String }