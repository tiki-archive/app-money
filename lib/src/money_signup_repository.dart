import 'package:httpp/httpp.dart';

import 'model/money_signup_api_model.dart';

class MoneySignupRepository {
  static const String _path = '/api/0-1-0/user';
  static const String _domain = 'signup.mytiki.com';

  static Future<void> total(String code, HttppClient httppClient,
      Function? onSuccess, Function? onError) async {
    var query = {"referrer": code};
    HttppRequest request = HttppRequest(
        uri: Uri.https(_domain, _path, query),
        verb: HttppVerb.GET,
        headers: HttppHeaders.typical(),
        timeout: const Duration(seconds: 30),
        onSuccess: (rsp) {
          if (rsp.statusCode == 200) {
            MoneySignUpModel apiRsp =
                MoneySignUpModel.fromJson(rsp.body?.jsonBody);
            int? total = apiRsp.total;
            onSuccess != null && total != null ? onSuccess(total) : null;
          }
        },
        onError: (error) async =>
            onError != null ? onError(error) : throw error);
    httppClient.request(request);
  }
}
