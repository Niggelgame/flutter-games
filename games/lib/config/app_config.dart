class AppConfig {
  final bool secureTraffic;

  final String apiHost;
  final int apiPort;
  final String websocketPath;
  final String turnPath;
  final String checkCodePath;

  AppConfig({
    required this.secureTraffic,
    required this.apiHost,
    required this.apiPort,
    required this.websocketPath,
    required this.turnPath,
    required this.checkCodePath,
  });
}

final defaultConfig = AppConfig(
  secureTraffic: false,
  apiHost: '192.168.19.38',
  apiPort: 8080,
  websocketPath: '/ws',
  turnPath: '/api/turn',
  checkCodePath: '/api/check',
);