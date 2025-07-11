class TravelModel {
  final String title;
  final String subTitle;
  final String imageName;

  TravelModel({
    required this.title,
    required this.subTitle,
    required this.imageName,
  });

  String get imagePath => 'assets/images/feed/$imageName.png';

  static final List<TravelModel> mockItmes = [
    TravelModel(
      title: 'Sopparo',
      subTitle: 'Sopparo Tower',
      imageName: 'discover',
    ),
    TravelModel(title: 'Osaka', subTitle: 'Japan', imageName: 'dest'),
    TravelModel(
      title: 'Costentino',
      subTitle: 'Cosentinoto',
      imageName: 'cosentino',
    ),
  ];
}
