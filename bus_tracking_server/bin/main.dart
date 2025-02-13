
import 'package:mailer/smtp_server/gmail.dart';
import 'package:serverpod/serverpod.dart';

import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:bus_tracking_server/src/generated/endpoints.dart';
import 'package:mailer/mailer.dart';

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

  String username = 'wkv.ali8x3b@gmail.com';
  String password = 'unrr bquf havb oizt';
  final smtpServer = gmail(username, password);
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      final message = Message()
        ..from = Address(username, 'Bus Tracking System')
        ..recipients.add(email)
        ..subject = 'Bus Tracking System OTP'
        ..text = 'Here is your code:\n $validationCode';

      try {
        final sendReport = await send(message, smtpServer);
        print('Message sent: $sendReport');
      } on MailerException catch (e) {
        print('Message not sent.');
        for (var p in e.problems) {
          print('Problem: ${p.code}: ${p.msg}');
        }
      }
      print(validationCode);
      return true;
    },
    sendPasswordResetEmail: (session, email, validationCode) async {
      final message = Message()
        ..from = Address(username, 'Bus Tracking System')
        ..recipients.add(email)
        ..subject = 'Bus Tracking System Password Reset'
        ..text = 'Here is your password reset code:\n $validationCode';

      try {
        final sendReport = await send(message, smtpServer);
        print('Password reset email sent: $sendReport');
      } on MailerException catch (e) {
        print('Password reset email not sent.');
        for (var p in e.problems) {
          print('Problem: ${p.code}: ${p.msg}');
        }
      }
      print(validationCode);
      return true;
    },
  ));

  await pod.start();
}
