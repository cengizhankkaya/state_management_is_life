import 'package:flutter/material.dart';
import 'package:state_management_is_life/product/constant/image_enum.dart';

import '../../../product/utility/input_decoration.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            child: ImageEnums.pro.toImage,
          ),
          Text('Login', style: Theme.of(context).textTheme.headlineLarge),
          TextField(decoration: ProjectInputs('Username')),
        ],
      ),
    );
  }
}
