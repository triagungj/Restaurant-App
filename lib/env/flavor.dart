import 'package:restaurant_app/env/env_config.dart';

class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'https://api.smartschool.var-x.id/v1',
      apiSentry:
          'https://f275f297ec794b519fdd25adba380803@o993546.ingest.sentry.io/5951603',
    );
  }
}
