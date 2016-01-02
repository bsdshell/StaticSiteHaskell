#!/bin/bash
echo "runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/currindex.html /Library/WebServer/Documents/tiny3/index.html"
cd $g/StaticSiteHaskell

#runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/currindex.html /Library/WebServer/Documents/tiny3/index.html

echo "No argument with $g/test.html file"
echo "One argument with $g/currindex.html file"
echo "arg num=$#"
if [ $# -gt 0 ]; then 
    runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/currindex.html /Library/WebServer/Documents/tiny3/index.html
else
    runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/test.html /Library/WebServer/Documents/tiny3/index.html
fi

echo "----------------------------------------"
echo "generate html from currindex.html to index.html in [$w/tiny3]"
echo "run.sh is in [$g/StaticSiteHaskell/run.sh]"
echo "Haskell code is [$g/StaticSiteHaskell/geneHtml.hs]"
echo "[$w/tiny3/currindex.html] -> [$w/tiny3/index.html]"
echo "----------------------------------------"
echo "$g/StaticSiteHaskell"
