#  FB9486787 - Changing font on button causes CompileStoryboard failed

## Basic information

### Please provide a descriptive title for your feedback:

Changing font on button causes CompileStoryboard failed.

### Which area are you seeing an issue with?

Xcode

### What type of feedback are you reporting?

Incorrect/Unexpected Behavior

## Details

### What version of Xcode are you using?

Version 13.0 beta 5 (13A5212g)

## Description

### Please describe the issue:

When adding a button to a storyboard, if I change the font it causes the storyboard to fail to compile

### Please list the steps you took to reproduce the issue:

1. Create a new Xcode project using the iOS app template.
2. Drag a button from the object library onto the root view in the main storyboard.
3. Use the attributes inspector to change the font for the button to “System” and set the font size to 24.0.
4. Build the project

### What did you expect to happen?

The project builds without error

### What actually happened?

The build fails with a compiler issue:

> Command CompileStoryboard failed with a nonzero exit code
