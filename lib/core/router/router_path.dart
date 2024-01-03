import 'package:delicious/features/Admin_Page/prasentation/pages/admin_main_page.dart';
import 'package:go_router/go_router.dart';

class RouterGo {
  static final router =
      GoRouter(initialLocation: AdminMainPage.pagepath, routes: [
    GoRoute(
      path: AdminMainPage.pagepath,
      name: AdminMainPage.pagename,
      builder: (context, state) => const AdminMainPage(),
    )
  ]);
}
