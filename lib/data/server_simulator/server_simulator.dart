import 'dart:convert';
import 'dart:math';


/// * This class acts as the outside server
/// that generates a new color upon to the app request
class ServerSimulator {
  ServerSimulator();

  /// to generate a random color
  Future<String> randomColor() async {
    final json = {
      "colorCode": Random().nextInt(0xffffffff),
    };
    return jsonEncode(json);
  }
}
