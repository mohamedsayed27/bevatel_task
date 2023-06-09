import 'package:flutter/material.dart';
import 'package:untitled/core/app_router/screens_name.dart';

import '../../presentation/screens/cart_screen.dart';
import '../../presentation/screens/main_layout.dart';
import '../../presentation/screens/product_details_screen.dart';
import '../../presentation/screens/splash_screen.dart';



class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.splashscreen:
          return MaterialPageRoute(builder: (_)=> const SplashScreen());
        case ScreenName.mainLayoutScreen:
          return MaterialPageRoute(builder: (_)=> const MainLayoutScreen());
        case ScreenName.productDetails:
          final args = settings.arguments as Map<String, dynamic>;
          return _animateRouteBuilder(ProductDetailsScreen(product: args,));
        case ScreenName.cartScreen:
          return _animateRouteBuilder(const CartScreen());
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static PageRouteBuilder _animateRouteBuilder(Widget to, {double x = 1, double y = 0}) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => to,
      transitionDuration: const Duration(milliseconds: 190),
      reverseTransitionDuration: const Duration(milliseconds: 190),
      transitionsBuilder: (context, animation, animationTime, child) {
        final tween = Tween<Offset>(begin: Offset(x, y), end: Offset.zero);
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }

}