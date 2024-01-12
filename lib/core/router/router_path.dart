import 'package:delicious/features/Admin_Page/prasentation/pages/admin_main_page.dart';
import 'package:delicious/features/menu/presentation/pages/add_category_page.dart';
import 'package:delicious/features/menu/presentation/pages/add_dishes_page.dart';
import 'package:delicious/features/orders/presentation/pages/order_details_page.dart';
import 'package:delicious/features/orders/presentation/pages/order_list_page.dart';
import 'package:delicious/features/banner/presentation/pages/offers_and_discount.dart';
import 'package:delicious/features/banner/presentation/pages/sliver_app.dart';
import 'package:go_router/go_router.dart';

class RouterGo {
  static final router = GoRouter(
    initialLocation: AdminMainPage.pagepath,
    routes: [
      GoRoute(
        path: AdminMainPage.pagepath,
        name: AdminMainPage.pagename,
        builder: (context, state) => const AdminMainPage(),
      ),
      GoRoute(
        path: AddCategory.routPath,
        name: AddCategory.routName,
        builder: (context, state) => const AddCategory(),
      ),
      GoRoute(
        path: OrderPage.routerPath,
        name: OrderPage.routerName,
        builder: (context, state) => const OrderPage(),
      ),
      GoRoute(
        path: OrderDetails.path,
        name: OrderDetails.name,
        builder: (context, state) => OrderDetails(id: state.extra.toString()),
      ),
      GoRoute(
        path: AddDishes.routerPath,
        name: AddDishes.routerNAme,
        builder: (context, state) => const AddDishes(),
      ),
      GoRoute(
        path: OfferPage.path,
        name: OfferPage.name,
        builder: (context, state) => const OfferPage(),
      ),
      GoRoute(
        path: Bannerpage.path,
        name: Bannerpage.name,
        builder: (context, state) => const Bannerpage(),
      )
    ],
  );
}
