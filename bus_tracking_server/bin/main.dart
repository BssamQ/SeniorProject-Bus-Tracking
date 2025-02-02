import 'package:bus_tracking_server/server.dart';
import 'package:serverpod/serverpod.dart';

import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
void main(List<String> args) {
  run(args);


}

void run(List<String> args) async {
  var pod = Serverpod(
    args,
    auth.Protocol(),
    auth.Endpoints(),
    authenticationHandler: auth.authenticationHandler, // Add this line
  );

  await pod.start();
}
