part of '../on_board_view.dart';

class _StartFabButton extends StatelessWidget {
  const _StartFabButton({required this.isLastPage, this.onPressed});
  final String _next = 'Next';
  final String _start = 'Start';

  final VoidCallback? onPressed;

  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Text(
        isLastPage ? _start : _next,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
