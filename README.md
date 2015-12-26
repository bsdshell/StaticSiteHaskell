# Generate HTML/CSS from specific syntax file 

#### What does the Haskell script do? 
- Parse specific syntax file and generate HTML from a given CSS file 

#### How to use it 
- Assume your have file called myfile.txt as following

    ```java
    [My Linux Commands]
    :grep --color -Hnris string *.java // Search string in all java files
    :history                // Show Shell history
    `[
        String str = "my string";
        int len = str.length();
    `]
    ```
- You want to style it or put some nice colors on it

- 1. Install Haskell in your machine(I use Mac)
- 2. Clone the repo. 
- 3. Put myfile.txt in your cloned directory
- 4. Goto your cloned directory and run following command
```sh
runhaskell geneHtml.hs mytext.txt myhtml.html
```
- 5. myhtml.html will be generated and point your favour browner to the file
- Note: The haskell script uses mycss.css file to style mytext.txt file

#### The Haskell script support following syntaxes 

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
##### Command syntax
    :grep --color -Hnris string *.java
