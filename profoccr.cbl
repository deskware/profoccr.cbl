

      **************************************
      * Program name: profoccr.cbl
      * Demonstrates multidimensional array
      * (OCCURS clause) usage.  This program
      * only works with CobolScript
      * Professional Edition.
      *
      * Run this program in interactive mode
      * and then type `dump variables` at
      * the prompt to see the list of
      * variables created (variables will be
      * written out to dump.var).
      *
      * Copyright 2000 Deskware, Inc.
      **************************************

      * This variable used as an occurs clause index
       1 occurs_num PIC 9 VALUE 4.

       1 day_of_week OCCURS 7 TIMES.
         5 hour_of_day  OCCURS 24 TIMES.
           10 fahr_temp      PIC ---9 VALUE -300.
           10 barom_pressure PIC 99.99.

       1 a OCCURS occurs_num TIMES.
         5 b PIC x VALUE `b`.
         5 c.
           10 d PIC 9  VALUE 1.
           10 e PIC xx VALUE `ee`.
         5 f OCCURS 2 times PIC xx VALUE `ff`.
         5 g OCCURS 3 times.
           10 h PIC xx VALUE `hh`.
           10 i OCCURS 4 times.
              20 j  PIC x VALUE `j`.
              20 k PIC x VALUE `k`.
              20 l OCCURS 2 times PIC xx VALUE `ll`.
              20 m OCCURS 2 times.
                30 n PIC x VALUE `n`.
          5 p PIC 99 VALUE 22.

       1 next_var PIC xx VALUE `ZZ`.

       MOVE 75 TO fahr_temp(1,13).
       DISPLAY `Temperature reading on Sunday at 1:00 PM = `
                & fahr_temp(1,13).
       DISPLAY `Temperature on Sunday at 2:00 PM = ` & fahr_temp(1,14) & linefeed.

       DISPLAY `a = ` & a & linefeed.
       DISPLAY `a(1) = ` & a(1) & linefeed.
       DISPLAY `g(1,1) = ` & g(1,1).

       DISPLAY `h(2,2) before MOVE = ` & h(2,2).
       MOVE `QQ` TO h(occurs_num-3+1,occurs_num-3+1).
       DISPLAY `h(2,2) after MOVE = ` & h(2,2).

       DISPLAY `next_var before MOVE = ` & next_var.
       MOVE g(1,1) TO next_var.
       MOVE `Q` TO next_var(occurs_num-2:d(occurs_num-3)).
       DISPLAY `next_var after MOVE = ` & next_var.

       DISPLAY `n(1,2,3,1) before MOVE = ` & n(1,2,3,1).
       MOVE `p` TO n(1,2,3,1).
       DISPLAY `n(1,2,3,1) after MOVE = ` & n(1, 1+1, occurs_num-1, 1).

       DISPLAY `g(1,occurs_num-1) = ` & g(1,occurs_num-1).
       DISPLAY `a(occurs_num-3) = ` & a(occurs_num-3).
