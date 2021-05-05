#!/bin/bash
   if lsof -Pi :80 -sTCP:LISTEN -t >/dev/null ; then

       exit 0;
        else
         echo "not running";
        exit 1;
fi
