import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

class Environment {

  getEnvironment() async {
    String environment = await getModeFile();
    return loadYaml(environment);
  }

  Future<String> getModeFile() async {
    if (kReleaseMode) {
      return await rootBundle.loadString('application-release.yaml');
    } else if (kProfileMode) {
      return await rootBundle.loadString('application-profile.yaml');
    } else if (kDebugMode) {
      return await rootBundle.loadString('application-debug.yaml');
    } else {
      throw Exception("Env is wrong!!");
    }
  }

}