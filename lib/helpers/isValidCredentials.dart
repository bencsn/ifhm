import 'package:ifhm/helpers/fetchBills.dart';

Future<bool> isValidCredentials(String id, String password) async {
  dynamic res = await fetchBillsWithCustomCredentials(id, password);
  print(res);
  return res != null;
}
