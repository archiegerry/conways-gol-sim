BRIEF-------------------------------------------------------------------
This folder contains work I undertook to build Conway's Game of Life in Delphi. 
Some of the code here is very old (built when I was back in college), so much of it is uncommented and incomplete.
However most of it it works quite well, and there is a lot of useful functionality.

RUNNING INSTRUCTIONS----------------------------------------------------
To run the code you will need a copy of RAD Studio Community edition.
You will, once you have this copy, also have to modify the paths to the databases pointed to in FDConnection1 in all of the various modules.
The databases you need to point to vary; here is a list of which modules require which database:
  -Account.pas -> Saves Database
  -Login.pas -> Acccount Database
  -Signup.pas -> Account Database
  -Start.pas -> Saves Database
  
FUNCTIONALITY -----------------------------------------------------------
You are able to play the standard game of life, as well as modifying the rules of the original game by choosing which quantity of cells live, die or survive.
You are also able to make saves to an account you create, and load those saves. 
There is loads more to uncover, so have fun!
