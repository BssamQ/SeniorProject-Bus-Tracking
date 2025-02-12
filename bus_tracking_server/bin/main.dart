
import 'package:serverpod/serverpod.dart';

import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:bus_tracking_server/src/generated/endpoints.dart';

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
void main(List<String> args) {


  run(args);


}

void run(List<String> args) async {


  var pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler, // Add this line
  );


  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode)  async {
      print(validationCode);
      return true;
    },
    sendPasswordResetEmail: (session, email, validationCode)  async {
      print(validationCode);
      return true;
    },
  ));

  await pod.start();
}
