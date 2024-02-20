import 'package:signals/signals.dart';

mixin LoadMixin {
  final isLoading = signal(false);

  void startLoading() {
    isLoading.set(true);
  }

  void stopLoading() {
    isLoading.set(false);
  }
}
