#!/bin/sh
# Build
runhaskell Setup configure --user && runhaskell Setup build && runhaskell Setup install || exit
echo "\n...Single-threaded tests....\n"
./tests.sh
echo "\n...Rerun the tests with multiple threads...\n"
./tests.sh +RTS -N4 -RTS --print-type
