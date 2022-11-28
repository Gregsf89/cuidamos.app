import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _apiURL = prefs.getString('ff_apiURL') ?? _apiURL;
    _latlang = _latLngFromString(prefs.getString('ff_latlang')) ?? _latlang;
  }

  late SharedPreferences prefs;

  String token = '';

  int accountId = 0;

  int userId = 0;

  String _apiURL =
      '\"https://1300-2804-7f0-b9c0-3103-2909-40ba-b72f-1a97.sa.ngrok.io\"';
  String get apiURL => _apiURL;
  set apiURL(String _value) {
    _apiURL = _value;
    prefs.setString('ff_apiURL', _value);
  }

  LatLng? _latlang = LatLng(-23.604911598937996, -46.649114510971124);
  LatLng? get latlang => _latlang;
  set latlang(LatLng? _value) {
    if (_value == null) {
      return;
    }
    _latlang = _value;
    prefs.setString('ff_latlang', _value.serialize());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
