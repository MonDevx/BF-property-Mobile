import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticatedHttpClient extends http.BaseClient {
  final baseUrl = Uri.parse('us-central1-bfproperty.cloudfunctions.net');
  // Use a memory cache to avoid local storage access in each call
  String _inMemoryToken = '';
  Future<String> get userAccessToken async {
    // use in memory token if available
    if (_inMemoryToken.isNotEmpty) return _inMemoryToken;

    // otherwise load it from local storage
    _inMemoryToken = await _loadTokenFromSharedPreference();

    return _inMemoryToken;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request)  {
    userAccessToken.then((value) => value.isNotEmpty
        ? request.headers['Authorization'] = 'Bearer $value'
        : null);

    return request.send();
  }

  Future<String> _loadTokenFromSharedPreference() async {
    final sharedPref = await SharedPreferences.getInstance();
    var accessToken = '';
    final sharedAccessToken = sharedPref.getString('accessToken');

    // If user is already authenticated, we can load his token from cache
    if (sharedAccessToken != null) {
      accessToken = sharedAccessToken;
    }
    return accessToken;
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}
