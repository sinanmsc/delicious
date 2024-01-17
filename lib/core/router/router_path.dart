import 'package:delicious/features/Admin_Page/prasentation/pages/admin_main_page.dart';
import 'package:delicious/features/menu/presentation/pages/add_category_page.dart';
import 'package:delicious/features/menu/presentation/pages/add_dishes_page.dart';
import 'package:delicious/features/menu/presentation/pages/view_dish_page.dart';
import 'package:delicious/features/orders/presentation/pages/order_details_page.dart';
import 'package:delicious/features/orders/presentation/pages/order_list_page.dart';
import 'package:go_router/go_router.dart';

class RouterGo {
  static final router = GoRouter(
    initialLocation: AdminMainPage.routerPath,
    routes: [
      GoRoute(
        path: AdminMainPage.routerPath,
        name: AdminMainPage.routerName,
        builder: (context, state) => const AdminMainPage(),
      ),
      GoRoute(
        path: AddCategory.routerPath,
        name: AddCategory.routerName,
        builder: (context, state) => const AddCategory(),
      ),
      GoRoute(
        path: OrderPage.routerPath,
        name: OrderPage.routerName,
        builder: (context, state) => const OrderPage(),
      ),
      GoRoute(
        path: OrderDetails.routerPath,
        name: OrderDetails.routerName,
        builder: (context, state) => OrderDetails(id: state.extra.toString()),
      ),
      GoRoute(
        path: AddDishes.routerPath,
        name: AddDishes.routerName,
        builder: (context, state) => const AddDishes(),
      ),
      GoRoute(
        path: ViewDish.routerPath,
        name: ViewDish.routerName,
        builder: (context, state) => const ViewDish(),
      ),
     
    ],
  );
}
