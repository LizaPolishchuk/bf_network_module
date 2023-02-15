import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/appointment_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetNotificationsListUseCase {
  final Repository repository;

  GetNotificationsListUseCase(this.repository);

  final _mockedNotifications = [
    NotificationEntity(
      id: "1",
      title: "Запись отменена",
      message: "Клиент Анна отменила запись на маникюр 25.12.2022 на 15:00.",
      date: DateTime(2023, 1, 12, 19, 30),
    ),
    NotificationEntity(
      id: "2",
      title: "Запись отменена2",
      message: "Клиент Liza отменила запись на маникюр 25.12.2022 на 15:00. Клиент Анна отменила запись на маникюр 25.12.2022 на 15:00. Клиент Анна отменила запись на маникюр 25.12.2022 на 15:00. Клиент Анна отменила запись на маникюр 25.12.2022 на 15:00.",
      date: DateTime(2023, 1, 13, 13, 30),
    ),
    NotificationEntity(
      id: "3",
      title: "Запись отменена3",
      message: "Клиент Vladik отменила запись на маникюр 25.12.2022 на 15:00.",
      date: DateTime(2023, 1, 12, 9, 20),
    ),
    NotificationEntity(
      id: "4",
      title: "Запись отменена4",
      message: "Клиент Henry отменила запись на маникюр 25.12.2022 на 15:00.",
      date: DateTime(2023, 1, 11, 23, 30),
    ),
  ];

  Future<Either<Failure, List<NotificationEntity>>> call(String masterId) async {
    return Right(_mockedNotifications);
  }
}
