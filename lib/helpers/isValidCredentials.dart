import 'package:ifhm/helpers/fetchBills.dart';

Future<bool> isValidCredentials(String id, String password) async {
  // TODO: exception error crashses the app; fix it!
  dynamic res = await fetchBillsWithCustomCredentials(id, password);
  print(res);
  return res != null;
}
