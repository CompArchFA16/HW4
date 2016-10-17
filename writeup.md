Deliverable 1:
===
  


```
Version 1:
    ______________________
   /                      \__________
   |                                 \
   |   |\              ___________    |
   '---| |--------_   |           |   |
  D ---| |         '----D         |   /
       |/             |         Q ---'
        |             | D-FLIPFLOP|
        |             |           |
      wrenable        |   CLK     |
                      |____|______|
                           |
                         Clock in

Version 2:
              ___________   
             |           |
          D----D         |  
             |         Q ---
             | D-FLIPFLOP|
             |           |
             |   CLK     |
             |____|______|
                  |
           __     |
   clock--|  \   /
          |AND)-'
wrenable--|__/

```    

Deliverable 6:
===

The decoder functions by bit shifting the value of `enable` by `address` to the left. Thus, if `enable=1`, then the `out[address]` will be equal to one. This results in a decoder because the input is an address, as well as an enable bit, and the output is a high where the address specifies in the `out` bus.

Deliverable 7:
===

Received help from Hieu on how to better structure my code to make it easier to implement the registers.
