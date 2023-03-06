import 'package:solid_test/data/server_simulator/server_simulator.dart';

class ApiClient {
  final ServerSimulator server;

  ApiClient({required this.server});

  Future<String> getNewColor() async {
    return await server.randomColor();
  }
}
