class WebrtcApiConfig {
  final bool secureTraffic;

  final String apiHost;
  final int apiPort;
  final String websocketPath;
  final String turnPath;
  final String checkCodePath;

  WebrtcApiConfig({
    required this.secureTraffic,
    required this.apiHost,
    required this.apiPort,
    required this.websocketPath,
    required this.turnPath,
    required this.checkCodePath,
  });
}

final defaultConfig = WebrtcApiConfig(
  secureTraffic: true,
  apiHost: 'server.games.kedil.de',
  apiPort: 443,
  websocketPath: '/ws',
  turnPath: '/api/turn',
  checkCodePath: '/api/check',
);