import 'package:delicious/features/orders/presentation/pages/order_details_page.dart';
import 'package:delicious/features/orders/presentation/pages/order_list_page.dart';
import 'package:go_router/go_router.dart';

class RouterGo {
  static final router = GoRouter(
    initialLocation: OrderPage.routerPath,
    routes: [
      GoRoute(
        path: OrderPage.routerPath,
        name: OrderPage.routerName,
        builder: (context, state) => const OrderPage(),
      ),
      GoRoute(
        path: OrderDetails.path,
        name: OrderDetails.name,
        builder: (context, state) => OrderDetails(id: state.extra.toString()),
      )
    ],
  );
}
