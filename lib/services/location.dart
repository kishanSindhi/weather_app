import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  late double latitude;
  late double longitude;
  Future<void> getCurrentLocation() async {
    var locationPermissionStatus = await Permission.location.status;
    if (locationPermissionStatus.isDenied) {
      await Permission.location.request();
    }
    try {
      if (locationPermissionStatus.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest,
          forceAndroidLocationManager: true,
        );
        latitude = position.latitude;
        longitude = position.longitude;
      }
    } catch (e) {
      print(e);
    }
  }
}
