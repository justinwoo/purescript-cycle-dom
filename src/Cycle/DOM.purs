module Cycle.DOM
  ( makeDOMDriver
  ) where

import Cycle.DOM.Types (Driver, Selector(..))

makeDOMDriver :: forall e.
  Selector
  -> Driver e
makeDOMDriver (Selector container) =
  _makeDOMDriver container

foreign import _makeDOMDriver :: forall e.
  String
  -> Driver e