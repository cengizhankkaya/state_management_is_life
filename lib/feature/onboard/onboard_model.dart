class OnboardModel {
  final String title;
  final String description;
  final String imageName;

  OnboardModel(this.title, this.description, this.imageName);

  String get getImagePath => 'assets/images/$imageName.png';
}

class OnBoardModels {
  static final List<OnboardModel> onBoardItems = [
    OnboardModel(
      'Order Your Food',
      'Choose from a variety of restaurants',
      'ic_back',
    ),
    OnboardModel(
      'Order Your Food',
      'Choose from a variety of restaurants',
      'ic_order',
    ),
    OnboardModel(
      'Order Your Food',
      'Choose from a variety of restaurants',
      'ic_pro',
    ),
  ];
}
