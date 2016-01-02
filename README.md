# Generate HTML/CSS from specific syntax file 

#### What does the Haskell script do? 
- Parse specific syntax file and generate HTML from a given CSS file 

- [Demo](http://tiny3.com)

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
- Install Haskell in your machine(I use Mac)
- Clone the repo. 
- Put myfile.txt in your cloned directory
- Goto your cloned directory and run following command
```sh
runhaskell geneHtml.hs mytext.txt myhtml.html
```
- myhtml.html will be generated and you can point your favour browser to the file

##### Note: The haskell script uses mycss.css file to style mytext.txt file

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
        myMax (x:xs) = if x > myMax xs then x else myMax xs  
    `]
##### Command syntax
    :grep --color -Hnris string *.java

##### Image syntax
    {{ src=path/image.png w=50% h=50% }}
