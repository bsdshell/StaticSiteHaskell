#!/bin/bash
echo "-----------------------------------------------------------------------------------------------------------------------"
echo "	runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/currindex.txt /Library/WebServer/Documents/tiny3/index.html"
cd $g/StaticSiteHaskell

www=" runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/currindex.txt /Library/WebServer/Documents/tiny3/index.html"
test=" runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/test.txt /Library/WebServer/Documents/tiny3/index.html"

if [ $# -gt 0 ]; then 
    echo "arg $1"
    if [ $1 = "w" ]; then
        echo $test 
        runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/currindex.txt /Library/WebServer/Documents/tiny3/index.html
    elif [ $1 = "t" ]; then 
        echo $www 
        runhaskell geneHtml.hs /Library/WebServer/Documents/tiny3/test.txt /Library/WebServer/Documents/tiny3/index.html
    fi 
else
    echo "Usage"
    echo "tin w ->[$www]"
    echo "tin t ->[$test]"
fi

echo "---------------------------------------------------------------"
echo "	generate html from currindex.txt to index.html in [$w/tiny3]"
echo "	run.sh is in [$g/StaticSiteHaskell/run.sh]"
echo "	Haskell code is [$g/StaticSiteHaskell/geneHtml.hs]"
echo "	[$w/tiny3/currindex.txt] -> [$w/tiny3/index.html]"
echo "	[$w/tiny3/test.txt] -> [$w/tiny3/index.html]"
echo "---------------------------------------------------------------"
echo "	$g/StaticSiteHaskell"
