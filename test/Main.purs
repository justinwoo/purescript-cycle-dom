module Test.Main where

import Prelude
import Control.Cycle (run)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.XStream (fold)
import Cycle.DOM (makeDOMDriver)
import Cycle.DOM.Types (DOMSource(DOMSource), Selector(Selector))
import Cycle.DOM.VDOM (h, text)
import DOM (DOM)
import DOM.HTML.Event.EventTypes (click)

main :: forall t17.
  Eff
    ( dom :: DOM
    , console :: CONSOLE
    | t17
    )
    Unit
main = do
  _ <- run main_ driver
  log "You should add some tests."
  where
    driver vnodes = do
      let domDriver = makeDOMDriver (Selector "#app")
      domDriver vnodes
    main_ domSource = do
      DOMSource button <- pure $ domSource.select (Selector "button")
      let events = button.events click
      let counter = fold (\b _ -> b + 1) 0 events
      render <<< show <$> counter
      where
        render x =
          h (Selector "div") {}
          [ h (Selector "button") {} [text "BUTTON"]
          , h (Selector "h1") {} [text $ "COUNT: " <> x]
          ]