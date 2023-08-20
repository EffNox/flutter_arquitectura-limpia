import 'dart:async';

import 'package:faker/faker.dart';

import '../../domain/models/notification.dart';
import '../../domain/repositories/notifications_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl() {
    _init();
  }

  final _ctl = StreamController<AppNotification>.broadcast();

  Timer? _timer;

  void _init() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final fk = Faker();

      if (_ctl.hasListener && !_ctl.isClosed) {
        print('🤙');
        _ctl.add(AppNotification(
          title: fk.food.dish(),
          body: fk.lorem.sentence(),
          createdAt: DateTime.now(),
        ));
      }
    });
  }

  @override
  Stream<AppNotification> get onNotification => _ctl.stream;

  @override
  Future<void> dispose() {
    _timer?.cancel();
    return _ctl.close();
  }
}
