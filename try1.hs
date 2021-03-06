import System.IO
import System.Directory
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Data.List 
import Data.List.Split 
import AronModule

-- display image syntax
-- [[ src=image/img.png w=50% h=30% ]]
replaceImgTab::String->String
replaceImgTab input = subRegex(mkRegex imgPattern) filterStr  rep 
                where
                    imgPattern = "(src[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++
                                 "(w[[:space:]]*=[[:space:]]*)([^[:space:]]+)" ++ "[[:space:]]+" ++ 
                                 "(h[[:space:]]*=[[:space:]]*)([^[:space:]]*)"
                    rep = "<div class=\"cen\"><img src=\\2 width=\"\\4\" height=\"\\6\"></div>"

                    filterStr 
                        | length l > 0 =  head l 
                        | otherwise = input 
                        where 
                            l = filter(\x-> length x > 0) $ splitRegex(mkRegex "^[[:space:]]*{{|}}[[:space:]]*") input
 

style::String->String->String->[String]->[String]
style pat l r list = map(`op` rep) list 
                        where op = subRegex $ mkRegex pat 
                              rep = l ++ match ++ r
                              match = "\\0"

replace::String->String->[String]->[String]
replace pat rep list = map (`op` rep) list
                        where op = subRegex $ mkRegex pat

htmlTab::String->String->[String]->[String]
htmlTab _ _ [] = []
htmlTab left right list = map(left ++) $ map (++ right) list

html::String->String->[String]->String
html open close list = open ++ (unlines list) ++ close

codeHighLight::String->[String]->[String]
codeHighLight pat list = map(`op` rep) list 
                where rep = "<span class=\"bracket\">\\1</span>"
                      op = subRegex $ mkRegex pat

displayPath::String->String->String->String
displayPath path inFile outFile = if inFile == "mytext.txt" 
                            then "file://" ++path ++ "/" ++ outFile 
                            else ""


lt                      =  "(<)"
gt                      =  "(>)"

html_lt                 =  "&lt;"
html_gt                 =  "&gt;"

htmlOpen                =  "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"mycss/style.css\"/></head><body class=\"htmlbg\">"
htmlClose               =  "</body></html>"

openSpan                =  "<span class=\"keyword\">"
closeSpan               =  "</span>"

-- //xxx, // xxx
comment                 =  "//.*$"
commentOpen             =  "<span class=\"comment\">"
commentClose            =  "</span>"

-- :xxx
keyword                 =  "^[[:space:]]*(:[[:graph:]]+)[[:space:]]*"

-- [ xxx ], [xxx]
titleOpen               =  "<span class=\"tit\">"
titleClose              =  "</span>"
title                   =  "^[[:space:]]*\\[[a-zA-Z0-9 ]+\\]"

-- { xxx }, {xxx}
header                  =  "^[[:space:]]*{[a-zA-Z0-9 ]+}"                                                                       
headerOpen              =  "<span class =\"header\">"
headerClose             =  "</span>"
preOpen                 =  "<pre>"
preClose                =  "</pre>"

-- 1. , 2.
numName                 =  "^[[:space:]]*[0-9]+\\.[[:space:]]+"
spanNumOpen             =  "<span class=\"num\">"
spanNumCose             =  "</span>"

html_tab                =  "^[[:space:]]*(<[^<>]+>[^<>]*<[[:space:]]*/[^<>]+>.*$)"

pattern                 = "(\\[|\\]|\\(|\\)|{|}|git|maybe |-&gt;)"
pattern1                = "([[:graph:]]+::)"
--pattern                 = "(git)"
-- cool
-- try2 
-- try3 

main = do
    print("geneHtml input.txt out.txt")
    [inFile, outFile] <- getArgs
    handle <- openFile inFile ReadMode
    contents <- hGetContents handle

    let line      = lines contents
    let splitcode  = splitRegex(mkRegex "([[:blank:]]+`\\[[[:blank:]]*\n)|([[:blank:]]+`\\][[:blank:]]*\n)") (unlines line)
    let oddList    = fst $ splitList splitcode
    let evenListCode   = snd $ splitList splitcode

    let ll = map(\x-> splitRegex(mkRegex "\n") x) oddList 
    print ll
    print "-------------------------------------------"

    print evenListCode

    hClose handle

