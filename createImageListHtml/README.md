# Script for creating html that include image list.
Crate block image list.
And insert h2 title, if directory has name prefixed "NUM_".

## Attribute
👇Sample command.   
`export_html.sh ~/captures images.html`   
　   
👇Command info.   
`export.sh $1=image_directory $2=html_file_name`

## Sample image directory tree

### create h2 title from directory's name

Captures   
　｜ー 1_bigImages   
　｜　　｜ー aaa.png   
　｜　　｜ー bbb.png   
　｜ー 2_middleImages   
　｜　　｜ー ccc.png   
　｜ー 3_middleImages   
　　　　｜ー ddd.png   

### or no directory

Captures   
　｜ー aaa.png   
　｜ー bbb.png   
　｜ー ccc.png   
 
