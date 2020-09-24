#  UIStackView responds to backgroundColor on iOS 14

Submitted as FB8363575 - 12 August 2020

## Description

Before iOS 14 setting a background color on a stack view has no effect. Starting with iOS 14 the stack view shows the background color. This is not documented anywhere and is likely to be a surprise to many developers who have inadvertently set a background color on a stack view as it will be displayed with iOS 14.

The documentation for UIStackView still makes the claim that it should have no effect.

## Details

+ Xcode Version 12.0 (12A7209)
+ iOS Version 14.0 (18A372)
+ macOS Version 10.15.6 (19G2021)

## Steps to reproduce (see attached sample project)

1. Create a new Xcode project using the single view app template and UIKit storyboards
2. Add two labels with some text to the root view of the view controller.
3. Embed the two labels in a vertical stack view
4. Add constraints to pin the stack view to the leading, top and trailing margins of the superview
5. Using the attributes inspector set the background color of the stack view to the system blue color.
6. Build and run on iOS 14 simulator or device

## Expected behavior

The stack view does not show the blue background.

## Actual behavior

The stack view is displayed with a blue background

This is a regression compared to iOS 13 where the background is not displayed.
