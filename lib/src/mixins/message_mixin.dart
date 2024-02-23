import 'package:signals/signals.dart';

mixin MessageMixin {
  final message = signal('');
  final messageError = signal('');

  void showError(Exception failure) {
    messageError.set(failure.toString());
  }

  void showSuccess(String success) {
    message.set(success);
  }
}
