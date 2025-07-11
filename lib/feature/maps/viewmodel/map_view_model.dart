import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:state_management_is_life/feature/maps/model/map_model.dart';
import 'package:state_management_is_life/feature/maps/services/map_services.dart';

part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase with Store {
  final IMapService mapService;

  @observable
  bool isLoading = false;
  @observable
  List<MapModel> mapModelItems = [];

  @observable
  int selectedIndex = 0;

  _MapViewModelBase(this.mapService);

  @action
  Future<void> fetchAllMaps() async {
    _changeLoading();
    final response = await mapService.fetchMapItesm();
    _changeLoading();
    mapModelItems = response ?? [];
    inspect(mapModelItems);
  }

  @action
  void changeIndex(int index) {
    selectedIndex = index;
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }
}
