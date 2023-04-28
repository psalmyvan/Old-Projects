# Machine Problem

## Creating a Candy Crush-like game using terminal.

1. Variable sized array and characters
2. Input should be in the form of integer+character *ex. "3A"*.  
*a. If input is in the table, the pattern will be highlighted then deleted.  *
*All characters above the deleted pattern will go down one block, and then an empty block of random characters will be added at the top.*  
3. Another valid input is "hint". When entered, a valid pattern will be highlighted.  



*SAMPLE OUTPUT*

<><><><><><><><><><><><><><><><><><><><><><><><><>  
<>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Your score: 0&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<>  
<><><><><><><><><><><><><><><><><><><><><><><><><>  


&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;D  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; B&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;A  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; C&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;A  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;A  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B  
  
    
     
input: hint
  
    
_________________________________________________________________________________________________________________________________  
  
  
  
<><><><><><><><><><><><><><><><><><><><><><><><><>  
<>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Your score: 0&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<>  
<><><><><><><><><><><><><><><><><><><><><><><><><>  


&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;D  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; B&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;**A**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; C&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;**A**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;**A**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B  
  
   
input: 3A      
_________________________________________________________________________________________________________________________________  
  
  
  
<><><><><><><><><><><><><><><><><><><><><><><><><>  
<>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Your score: 1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<>  
<><><><><><><><><><><><><><><><><><><><><><><><><>  


&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;D  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; B&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; C&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B  
  
    
   
input: 3A  
_________________________________________________________________________________________________________________________________  
  
  
  
<><><><><><><><><><><><><><><><><><><><><><><><><>  
<>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Your score: 1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<>  
<><><><><><><><><><><><><><><><><><><><><><><><><>  


&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; B&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; C&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;D  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B  
  
    
   
input: 3A
_________________________________________________________________________________________________________________________________  
  
  
  
<><><><><><><><><><><><><><><><><><><><><><><><><>  
<>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Your score: 1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<>  
<><><><><><><><><><><><><><><><><><><><><><><><><>  


&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;C  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; B&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;D  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp; C&emsp;&emsp;&emsp;&emsp;E&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;D  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;C&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;D  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;B&emsp;&emsp;&emsp;&emsp;D&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;A&emsp;&emsp;&emsp;&emsp;B  
  
    
   
input:|  
  
![#f03c15](https://via.placeholder.com/15/f03c15/f03c15.png)
