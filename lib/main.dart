import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:state_management_is_life/feature/travel/view/travel_tab_view.dart';
import 'package:state_management_is_life/product/model/state/project_context.dart';
import 'package:state_management_is_life/product/model/state/user_context.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductContext()),
        ProxyProvider<ProductContext, UserContext?>(
          update: (context, productContext, userContext) {
            return userContext != null
                ? userContext.copyWith(name: productContext.newUserName)
                : UserContext(productContext.newUserName);
          },
        ),
      ],
      child: MaterialApp(
        home: TravelTabView(),
        theme: ThemeData.light().copyWith(
          tabBarTheme: TabBarThemeData(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey.withValues(alpha: 0.5),
            indicatorColor: Colors.orange,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(),
          ),
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),

          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(11, 23, 84, 1),
          ),
        ),
      ),
    );
  }
}
