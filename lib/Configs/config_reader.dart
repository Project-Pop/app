// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:yaml/yaml.dart';

class ConfigReader {
  static Map<String, dynamic> _config = {};

  static Future<void> initialize(String env) async {
    final configString =
        await rootBundle.loadString('config/app_config.$env.yaml');

    _config = (loadYaml(configString) as YamlMap).cast();
  }

  // aws cognito related configurations
  static String get cognitoUserPoolId => _config['aws_cognito']['user_pool_id'];
  static String get cognitoClientId => _config['aws_cognito']['client_id'];
  static String get cognitoRegion => _config['aws_cognito']['region'];

  // Databse apis related configurations
  static String get _apiDomainUrl => _config['api_config']['domain_base_url'];
  static String get apiUserServiceUrl =>
      _apiDomainUrl + _config['api_config']['user_service_prefix'];
  static String get apiPostServiceUrl =>
      _apiDomainUrl + _config['api_config']['post_service_prefix'];
}
