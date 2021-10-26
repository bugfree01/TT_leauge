
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:tt_league/helper/constant/apiUrls.dart';

class AppMailer {
  static String getErrorHTMLBody(
          {required String targetURL,
          var varPrameter,
          var errorData,
          required String deviceName}) =>
      "<p> DEVICE INFO : ${deviceName}"
      "<br/> URL : ${targetURL}"
      "<br/> PARAMETER : ${varPrameter.toString()} "
      "<br/> ERROR TRACE : ${errorData}</p>";

  static void sendMail(
      {required String targetEmail,
      required String mailSubject,
      required String mailBody,
      String htmlBody = ""}) async {
    String username = AppAuth.appMailerEmail;
    String password = AppAuth.appMailerPassword;

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Shivam Kumar')
      ..recipients.add(targetEmail)
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = mailSubject
      ..text = mailBody
      ..html = htmlBody;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    // DONE
  }
}
