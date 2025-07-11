import 'package:state_management_is_life/feature/maps/model/map_model.dart';
import 'package:vexana/vexana.dart';

class NetworkProduct {
  static NetworkProduct? _instace;
  static NetworkProduct get instance {
    _instace ??= NetworkProduct._init();
    return _instace!;
  }

  late final INetworkManager<MapModel> networkManager;

  NetworkProduct._init() {
    networkManager = NetworkManager(
      options: BaseOptions(baseUrl: 'https://fluttertr-ead5c.firebaseio.com/'),
    );
  }
}
