import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_is_life/feature/maps/model/map_model.dart';
import 'package:state_management_is_life/feature/maps/services/map_services.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  late IMapService mapService;
  setUp(() {
    networkManager = NetworkManager<MapModel>(
      options: BaseOptions(baseUrl: 'https://fluttertr-ead5c.firebaseio.com/'),
    );
    mapService = MapService(networkManager);
  });
  test('Fetch all map datas', () async {
    final response = await mapService.fetchMapItesm();

    expect(response, isNotNull);
  });
}
