# SwiftUI list loses selection on iPadOS when row scrolls offscreen (FB9961092)

# Description

**Please describe the issue and what steps we can take to reproduce it:**

Running a split view app on iPadOS with enough items in the primary list to scroll. Select a row near the bottom of the list and scroll down until the row disappears offscreen. When you scroll the row back up onscreen it is no longer selected.

## Environment

* Xcode Version 13.3 (13E113)
* iPadOS Version 15.4 (19E241)

## Steps to Reproduce

1. Open the attached Xcode project
2. Run the project on iPad target (device or simulator)
3. With the device in landscape, use the + button to add enough new projects so that the project list can scroll.
4. Select a row near the bottom of the list
5. Scroll the list down until the selected row disappears offscreen.
6. Scroll the list back up to bring the previously selected back onscreen

## Expected Result

The selected row should still be selected when it appears back onscreen.

## Actual result

The selected row loses its selection when it goes offscreen.

## Further Information

See attached sample project and screen recording.


# SwiftUI split view primary list loses selection when navigating in detail view (FB9961758)

# Description

**Please describe the issue and what steps we can take to reproduce it:**

Running a split view app on iiPadOS, the selected item in the sidebar/primary list is lost when navigating to a new view in the detail/secondary view.

## Environment

* Xcode Version 13.3 (13E113)
* iPadOS Version 15.4 (19E241)

## Steps to Reproduce

1. Open the attached Xcode project
2. Run the project on iPad target (device or simulator)
3. With the device in landscape, use the + button to add projects to the primary/sidebar list.
4. Select a project and then use the + button in the detail view to add items to a project
5. Select an item in the item list to navigate to the detailed item view

## Expected Result

The selected project in the project list should remain selected

## Actual Result

The project list loses the selection

## Further Information

See attached sample project and screen recording
