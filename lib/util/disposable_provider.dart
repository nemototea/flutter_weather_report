import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'disposable.dart';

// Disposableを継承したクラスを対象としたProvider
class DisposableProvider<T extends Disposable> extends Provider<T> {
  DisposableProvider({
    Key key,
    @required Create<T> create,
    Widget child,
    TransitionBuilder builder,
    bool lazy,
  }) : super(
          key: key,
          create: create,
          dispose: (_context, disposable) => disposable.dispose(),
          child: child,
          builder: builder,
          lazy: lazy,
        );

  DisposableProvider.value({
    Key key,
    @required T value,
    Widget child,
    TransitionBuilder builder,
  }) : super.value(
          key: key,
          value: value,
          child: child,
          builder: builder,
        );

  static T of<T extends Disposable>(BuildContext context) {
    try {
      return Provider.of<T>(context, listen: false);
    } on Exception catch (error) {
      // ここ、コントリビューターになれるかも？
      // on Exception について要チェック(https://dart-lang.github.io/linter/lints/avoid_catches_without_on_clauses.html)
      throw FlutterError(
        '''
        DisposableProvider.of() called with a context that does not contain
        a Disposable of type $T.
        The context used was: $context
        Error: $error
        ''',
      );
    }
  }
}
