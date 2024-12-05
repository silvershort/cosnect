import 'package:cosnect/src/router/app_router.gr.dart';
import 'package:cosnect/src/router/route_path.dart';
import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: RoutePath.home),
    AutoRoute(page: FormRoute.page, path: RoutePath.form),
    AutoRoute(page: MemoryRoute.page, path: RoutePath.memory),
    AutoRoute(page: MemoUpdateRoute.page, path: RoutePath.memoUpdate),
    AutoRoute(page: PhotoRoute.page, path: RoutePath.photo),
  ];
}