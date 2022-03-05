import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:games/config/app_config.dart';
import 'package:games/game_base/common/token_generator.dart';
import 'package:http/http.dart' as http;

part 'api_client.g.dart';

@JsonSerializable()
class TurnCredentials {
  final String username;
  final String password;
  final int ttl;
  final List<String> uris;

  TurnCredentials(this.username, this.password, this.ttl, this.uris);

  factory TurnCredentials.fromJson(Map<String, dynamic> json) =>
      _$TurnCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$TurnCredentialsToJson(this);
}

@JsonSerializable()
class SessionData {
  final String token;
  final String game;
  @JsonKey(name: 'game_config')
  final Map<String, dynamic> gameConfig;

  SessionData(this.token, this.game, this.gameConfig);

  factory SessionData.fromJson(Map<String, dynamic> json) =>
      _$SessionDataFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDataToJson(this);
}

class ApiClient {
  final AppConfig _config;

  ApiClient({required AppConfig config}) : _config = config;

  Uri _buildUri(String path, {Map<String, dynamic>? queryParameters}) {
    return Uri(
      scheme: _config.secureTraffic ? 'https' : 'http',
      host: _config.apiHost,
      port: _config.apiPort,
      path: path,
      queryParameters: queryParameters,
    );
  }

  Future<TurnCredentials> getTurnCredentials() async {
    final username = getRandomString(16);
    final password = getRandomString(16);

    final requestUri = _buildUri(_config.turnPath, queryParameters: {
      'username': username,
      'password': password,
      'service': 'turn'
    });

    final res = await http.get(requestUri);
    return TurnCredentials.fromJson(jsonDecode(res.body));
  }

  Future<SessionData> getSessionData(String sessionCode) async {
    final requestUri = _buildUri(_config.checkCodePath, queryParameters: {
      'code': sessionCode,
    });

    final res = await http.get(requestUri);
    return SessionData.fromJson(jsonDecode(res.body));
  }
}
