import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_management_is_life/feature/onboard/onboard_model.dart';
import 'package:state_management_is_life/feature/onboard/tab_indicator.dart';
import 'package:state_management_is_life/product/padding/page_padding.dart';
import 'package:state_management_is_life/product/widget/onboard_card.dart';
part 'module/start_fab_button.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTile = 'Skip';

  int _selectedIndex = 0;
  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == _selectedIndex;
  bool get _isFirstPage => _selectedIndex == 0;

  // ----xx
  ValueNotifier<bool> isBackEnabled = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    isBackEnabled.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    isBackEnabled.dispose();
    super.dispose();
  }
  // ----xx

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnabled(true);
      return;
    }
    _changeBackEnabled(false);
    _incrementSelectedPage(value);
  }

  void _changeBackEnabled(bool value) {
    if (value == isBackEnabled.value) return;
    isBackEnabled.value = value;
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: PagePadding.all(),
        child: Column(
          children: [
            Expanded(child: _pageViewItems()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(selectedIndex: _selectedIndex),
                _StartFabButton(
                  isLastPage: _isLastPage,
                  onPressed: () {
                    _incrementAndChange();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: isBackEnabled,
          builder: (BuildContext context, bool value, Widget? child) {
            return value
                ? SizedBox()
                : TextButton(onPressed: () {}, child: Text(_skipTile));
          },
        ),
      ],
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon: Icon(Icons.chevron_left_outlined),
              color: Colors.grey,
            ),
    );
  }

  Widget _pageViewItems() {
    return PageView.builder(
      itemCount: OnBoardModels.onBoardItems.length,
      onPageChanged: (value) => setState(() {
        _selectedIndex = value;
      }),
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }
}
