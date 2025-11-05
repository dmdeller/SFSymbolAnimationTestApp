## Animated SF Symbol in SwiftUI List causes severe UI performance degradation

### FB20929585

Place an SF Symbol in a SwiftUI List, using an animated modifier like this:

```
.symbolEffect(.variableColor.iterative.dimInactiveLayers.nonReversing, options: .repeat(.continuous))
```

Whenever the symbol is visible on screen, scrolling performance is severely negatively affected in all scroll views in the app (not only the view that the symbol is in). Other UI components in the app also fail to update in a timely and expected manner.

Removing the `symbolEffect()` modifier restores normal expected behavior.

This is a regression in macOS 26.1. It did not occur in 26.0, in 26.0.1, or in various versions of macOS 15.

I have included a minimal test case app.
