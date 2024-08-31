import 'dart:math';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
Future<String?> getOTP(String recipientEmail) async {
  try {
    int otp = Random().nextInt(900000) + 100000;
    String OTP = otp.toString();
    const fromEmail = 'examapp312@gmail.com';
    const fromPassword = 'orzommhmuzsiqvck';

    final smtpServer = gmail(fromEmail, fromPassword);

    // Tạo email message
    final message = Message()
      ..from = const Address(fromEmail, 'ExamApp')
      ..recipients.add(recipientEmail)
      ..subject = 'OTP Code From ExamApp'
      ..html = '''
        <p>Your OTP code is: <strong style="color: red;">$OTP</strong>. Please don't share with anyone!</p>
      ''';

    await send(message, smtpServer);
    return OTP;
  } catch (e) {
    return null;
  }
}