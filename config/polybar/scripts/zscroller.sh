#!/bin/sh
if ! mpc >/dev/null 2>&1; then
	  echo  Server offline
	    exit 1
    elif mpc status | grep -qE 'playing|paused'; then
	      #( mpc current | zscroll -l 24 -d 0.4 -n true) &
	       zscroll -n true -d 0.6 -l 20 -p "   " -b " " -u true "mpc current" &
      else
	        echo  Not playing
fi
# Block until an event is emitted
mpc idle >/dev/null
