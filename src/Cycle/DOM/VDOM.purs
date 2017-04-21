module Cycle.DOM.VDOM
  ( h
  , text
  ) where

import Cycle.DOM.Types (Selector, VNode, VNodeData)

foreign import h :: Selector -> VNodeData -> Array VNode -> VNode

text :: String -> VNode
text string = { text: string }