import 'package:injectable/injectable.dart';

import '../../../core/services/user_storage.dart';

@injectable
class ProfileLocalDataSource {

  Future<Map<String, String>> getProfile() async {

    final name =
        await UserStorage.getName() ?? "User";

    final email =
        await UserStorage.getEmail() ?? "";

    return {
      "name": name,
      "email": email,
    };
  }
}