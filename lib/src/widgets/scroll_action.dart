// This file is adapted from:
// https://github.com/flutter/flutter/blob/515c28da01b51070660a95c9c69c0e099bd8117d/packages/flutter/lib/src/widgets/scrollable_helpers.dart#L374

import 'package:flutter/widgets.dart';

class FasterScrollAction extends ScrollAction {
  static double get scrollPerLine => 100;
  static double get scrollPerPage => 0.8;

  /// Returns the scroll increment for a single scroll request, for use when
  /// scrolling using a hardware keyboard.
  ///
  /// Must not be called when the position is null, or when any of the position
  /// metrics (pixels, viewportDimension, maxScrollExtent, minScrollExtent) are
  /// null. The widget must have already been laid out so that the position
  /// fields are valid.
  static double _calculateScrollIncrement(
    ScrollableState state, {
    ScrollIncrementType type = ScrollIncrementType.line,
  }) {
    assert(state.position.hasPixels);
    assert(
      state.resolvedPhysics == null ||
          state.resolvedPhysics!.shouldAcceptUserOffset(state.position),
    );
    if (state.widget.incrementCalculator != null) {
      return state.widget.incrementCalculator!(
        ScrollIncrementDetails(type: type, metrics: state.position),
      );
    }
    return switch (type) {
      ScrollIncrementType.line => scrollPerLine,
      ScrollIncrementType.page => scrollPerPage * state.position.viewportDimension,
    };
  }

  /// Find out how much of an increment to move by, taking the different
  /// directions into account.
  double getDirectionalIncrement(ScrollableState state, ScrollIntent intent) {
    if (axisDirectionToAxis(intent.direction) == axisDirectionToAxis(state.axisDirection)) {
      final double increment = _calculateScrollIncrement(state, type: intent.type);
      return intent.direction == state.axisDirection ? increment : -increment;
    }
    return 0.0;
  }

  @override
  void invoke(ScrollIntent intent, [BuildContext? context]) {
    assert(context != null, 'Cannot scroll without a context.');
    ScrollableState? state = Scrollable.maybeOf(context!);
    if (state == null) {
      final ScrollController primaryScrollController = PrimaryScrollController.of(context);
      assert(() {
        if (primaryScrollController.positions.length != 1) {
          throw FlutterError.fromParts(<DiagnosticsNode>[
            ErrorSummary(
              'A ScrollAction was invoked with the PrimaryScrollController, but '
              'more than one ScrollPosition is attached.',
            ),
            ErrorDescription(
              'Only one ScrollPosition can be manipulated by a ScrollAction at '
              'a time.',
            ),
            ErrorHint(
              'The PrimaryScrollController can be inherited automatically by '
              'descendant ScrollViews based on the TargetPlatform and scroll '
              'direction. By default, the PrimaryScrollController is '
              'automatically inherited on mobile platforms for vertical '
              'ScrollViews. ScrollView.primary can also override this behavior.',
            ),
          ]);
        }
        return true;
      }());

      final BuildContext? notificationContext =
          primaryScrollController.position.context.notificationContext;
      if (notificationContext != null) {
        state = Scrollable.maybeOf(notificationContext);
      }
      if (state == null) {
        return;
      }
    }
    assert(
      state.position.hasPixels,
      'Scrollable must be laid out before it can be scrolled via a ScrollAction',
    );

    // Don't do anything if the user isn't allowed to scroll.
    if (state.resolvedPhysics != null &&
        !state.resolvedPhysics!.shouldAcceptUserOffset(state.position)) {
      return;
    }
    final double increment = getDirectionalIncrement(state, intent);
    if (increment == 0.0) {
      return;
    }
    state.position.moveTo(
      state.position.pixels + increment,
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeInOut,
    );
  }
}