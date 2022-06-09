import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UpdateUserAvatarUseCase {
  final Repository repository;

  UpdateUserAvatarUseCase(this.repository);

  Future<Either<Failure, String>> call(File file) async {
    return await repository.updateUserAvatar(file);
  }
}
