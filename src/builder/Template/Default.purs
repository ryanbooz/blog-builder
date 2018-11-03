module Template.Default (defaultTemplate) where 

import Prelude

import Template.Common (copyright, defaultNav, iconLink)
import Text.Smolder.HTML as HTML
import Text.Smolder.HTML.Attributes as HA
import Text.Smolder.Markup (Markup, text, (!))
import Utils.String (stripeSentences)
import Utils.Writer (assetsDir)


defaultHead :: forall e. String -> Markup e 
defaultHead title = HTML.head do 
  HTML.meta ! HA.charset "utf-8"
  HTML.meta ! HA.name "viewport" ! HA.content "width=device-width, initial-scale=1"

  HTML.title $ text title 
  HTML.link ! HA.rel "stylesheet" ! HA.href ("/" <> assetsDir <> "/main.min.css")
  HTML.link ! HA.rel "stylesheet" ! HA.href "https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome-font-awesome.min.css"

defaultHeader :: forall e. Markup e 
defaultHeader = do 
  HTML.header do 
    HTML.div ! HA.className "container grid-lg" $ do
      defaultNav "horizontal main-nav"
        
defaultFooter :: forall e. Markup e 
defaultFooter = HTML.footer do
  HTML.div ! HA.className "wrapper" $ do
    HTML.div ! HA.className "container grid-lg"  $ do 
      HTML.hr
      HTML.div ! HA.className "text-center" $ do 
        iconLink "https://github.com/hgiasac" "fa fa-github fa-2x"
        iconLink "https://www.linkedin.com/in/toan-nguyen-83295527/" "fa fa-linkedin fa-2x"
        iconLink "https://stackoverflow.com/users/4230985/hgiasac" "fa fa-stack-overflow fa-2x"
      HTML.div ! HA.className "text-center mt-2" $ text copyright

defaultTemplate :: forall e. String -> String -> Markup e -> Markup e 
defaultTemplate title description content = HTML.html $ do 
  defaultHead title

  HTML.meta ! HA.name "description" ! HA.content (stripeSentences description 297)
  HTML.body do
    defaultHeader
    HTML.section ! HA.className "section" $ 
      HTML.div ! HA.id "main" $ content
    defaultFooter
