import 'package:flutter/material.dart';
import 'routes.dart';

class Coordinator {
  final BuildContext _context;

  Coordinator._(this._context);

  static Coordinator of(BuildContext context) => Coordinator._(context);

  Future<T?> push<T extends Object?>(
    RouteEntity entity,
  ) {
    return Navigator.of(_context).pushNamed<T?>(
      entity.name,
      arguments: _RouteArguments(view: entity.view),
    );
  }

  Future<T?> presentAsModal<T extends Object?>(RouteEntity entity) {
    return Navigator.of(_context).pushNamed<T?>(
      entity.name,
      arguments: _RouteArguments(view: entity.view),
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(_context).pop(result);
  }

  void popUntilFirst() {
    Navigator.of(_context).popUntil(
      (route) => route.isFirst,
    );
  }

  void popUntilNamed(String routeName) {
    Navigator.of(_context).popUntil(
      (route) => route.settings.name == routeName,
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments as _RouteArguments;
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => arguments.view,
    );
  }
}

class _RouteArguments {
  final Widget view;

  _RouteArguments({required this.view});
}
