import 'package:flutter/widgets.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CustomVisibilityDetector extends StatefulWidget {
  const CustomVisibilityDetector({
    required this.child,
    this.onVisibleGained,
    this.onVisibleLost,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onVisibleGained;

  final VoidCallback? onVisibleLost;

  final Widget child;

  @override
  State<CustomVisibilityDetector> createState() => _CustomVisibilityDetectorState();
}

class _CustomVisibilityDetectorState extends State<CustomVisibilityDetector>
    with WidgetsBindingObserver {
  final _visibilityDetectorKey = UniqueKey();

  bool _isWidgetVisible = false;

  bool _isAppInForeground = true;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _notifyPlaneTransition(state);
  }

  /// Notifies app's transitions to/from the foreground.
  void _notifyPlaneTransition(AppLifecycleState state) {
    if (!_isWidgetVisible) {
      return;
    }

    final isAppResumed = state == AppLifecycleState.resumed;
    final wasResumed = _isAppInForeground;
    if (isAppResumed && !wasResumed) {
      _isAppInForeground = true;
      _notifyVisibleGain();
      return;
    }

    final isAppPaused = state == AppLifecycleState.paused;
    if (isAppPaused && wasResumed) {
      _isAppInForeground = false;
      _notifyVisibleLoss();
    }
  }

  @override
  Widget build(BuildContext context) => VisibilityDetector(
    key: _visibilityDetectorKey,
    onVisibilityChanged: (visibilityInfo) {
      final visibleFraction = visibilityInfo.visibleFraction;
      _notifyVisibilityStatusChange(visibleFraction);
    },
    child: widget.child,
  );

  void _notifyVisibilityStatusChange(double newVisibleFraction) {
    if (!_isAppInForeground) {
      return;
    }

    final wasFullyVisible = _isWidgetVisible;
    final isFullyVisible = newVisibleFraction > 0;
    if (!wasFullyVisible && isFullyVisible) {
      _isWidgetVisible = true;
      _notifyVisibleGain();
    }

    final isFullyInvisible = newVisibleFraction == 0;
    if (wasFullyVisible && isFullyInvisible) {
      _isWidgetVisible = false;
      _notifyVisibleLoss();
    }
  }

  void _notifyVisibleGain() {
    final onFocusGained = widget.onVisibleGained;
    if (onFocusGained != null) {
      onFocusGained();
    }
  }

  void _notifyVisibleLoss() {
    final onFocusLost = widget.onVisibleLost;
    if (onFocusLost != null) {
      onFocusLost();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}