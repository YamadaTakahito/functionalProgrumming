module HTMLEscapedString
    (HTMLEscapedString
    , escape
    , putHTMLEscapedStrLn
    ) where

data HTMLEscapedString =  HTMLEscapedString String

escape::String -> HTMLEscapedString
escape str = HTMLEscapedString(str >>= escapeAmp >>= escapeOther) where
    escapeAmp '&' = 