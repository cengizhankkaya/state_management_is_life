import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:state_management_is_life/feature/maps/view/map_select_view.dart';
import 'package:state_management_is_life/feature/onboard/on_board_view.dart';
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
        home: MapSelectView(),
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          scaffoldBackgroundColor: Colors.grey[100],
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(11, 23, 84, 1),
          ),
        ),
      ),
    );
  }
}
