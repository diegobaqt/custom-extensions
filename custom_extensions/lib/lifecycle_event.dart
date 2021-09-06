library custom_extensions;

import 'package:lifecycle/lifecycle.dart';

extension LifecycleEventExt on LifecycleEvent {
  /// check if is active and push
  bool isOnResume() =>
      this == LifecycleEvent.push || this == LifecycleEvent.active;
}
