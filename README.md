# Generate HTML/CSS from specific syntax file 

#### What does the Haskell code do? 
    - Parse specific syntax file and generate HTML/CSS file 
##### Title syntax
    [ my title ]

##### Comment syntax
    // This is my comments
##### Source code syntax
    `[
        myMax::[Int]->Int
        myMax [] = 0
        myMax [x] = x 
        mymax (x:xs) = if x > mymax xs then x else mymax xs  
    `]
##### Command code syntax
    :grep --color -Hnris string *.java
