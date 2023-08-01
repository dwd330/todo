import 'package:get_storage/get_storage.dart';
import '../../utils/constants.dart';

class GetStorageServices {
  final box = GetStorage();

  void storeusertoken(String token) async {
    //write local data
    await box.write(isusertoken, true);
    await box.write(usertokenkey, token);
  }

  void clearusertoken() async {
    await box.erase();
  }

//read usertoken
  String? readusertoken() {
    if (box.read(isusertoken) == true) {
      return box.read(usertokenkey);
    }
    return null;
  }
}
