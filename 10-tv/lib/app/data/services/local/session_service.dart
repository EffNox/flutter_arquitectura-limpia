import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _key = 'sessionId';
const _accountKey = 'accountId';

class SessionService {
  final FlutterSecureStorage _secureStorage;

  SessionService(this._secureStorage);

  Future<String?> get sessionId => _secureStorage.read(key: _key);

  Future<String?> get accountId => _secureStorage.read(key: _accountKey);

  Future<void> saveSessionId(String sessionId) => _secureStorage.write(key: _key, value: sessionId);
  Future<void> saveAccountId(String accountId) => _secureStorage.write(key: _accountKey, value: accountId);

  Future<void> signOut() => _secureStorage.deleteAll();
}
