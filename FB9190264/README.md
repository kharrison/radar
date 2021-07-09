# Column breakpoint unable to inspect anonymouse closure arguments

Submitted as FB9190264 - 18 June 2021

## Description

Watching the WWDC21 session video “Discover breakpoint improvements” there is a demonstration of the new in Xcode 13 feature of setting column breakpoints. The example shows a breakpoint on a complex closure where it is possible to examine the anonymous closure argument $0.

That does not seem to be possible in Xcode 13 beta 1.

## Details

+ Version 13.0 beta (13A5154h)

## Steps to reproduce (see attached project)

Set a column breakpoint on a closure expression and try to inspect the value of the $0 closure argument.

## Expected behavior

The closure arguments are displayed in the debugger as shown in the WWDC video

## Actual behavior

Nothing. There seems to be no way to inspect the closure arguments.
