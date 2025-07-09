import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_is_life/feature/login/viewModel/login_view_model.dart';
import 'package:state_management_is_life/product/constant/image_enum.dart';
import 'package:state_management_is_life/product/model/state/user_context.dart';
import 'package:state_management_is_life/product/padding/page_padding.dart';

import '../../../product/utility/input_decoration.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewModel _loginViewModel = LoginViewModel();
  final String data = 'Login';
  final String data2 = 'Remember me';
  final String username = 'Username';
  final String Login = 'Login';

  @override
  void initState() {
    super.initState();
    print(context.read<UserContext?>()?.name);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(leading: _loadingWidget()),
          body: SingleChildScrollView(
            child: Padding(
              padding: const PagePadding.allLow(),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: MediaQuery.of(context).viewInsets.bottom != 0
                        ? 0
                        : MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ImageEnums.pro.toImage,
                  ),
                  Text(Login, style: Theme.of(context).textTheme.headlineLarge),
                  TextField(decoration: ProjectInputs(username)),
                  ElevatedButton(
                    onPressed: _loginViewModel.isLoading
                        ? null
                        : () {
                            context.read<LoginViewModel>().controlTextValue();
                          },
                    child: Center(child: Text(data)),
                  ),
                  CheckboxListTile(
                    value: _loginViewModel.isCheckBoxOkay,
                    title: Text(data2),
                    onChanged: (value) {
                      _loginViewModel.checkBoxChanged(value ?? false);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _loadingWidget() {
    return Selector<LoginViewModel, bool>(
      selector: (context, viewModel) {
        return viewModel.isLoading;
      },
      builder: (context, value, child) {
        return value
            ? Center(child: CircularProgressIndicator())
            : const SizedBox.shrink();
      },
    );
  }
}
