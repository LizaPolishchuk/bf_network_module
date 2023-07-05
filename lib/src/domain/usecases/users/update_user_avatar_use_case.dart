import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdateUserAvatarUseCase {
  final Repository repository;

  UpdateUserAvatarUseCase(this.repository);

  Future<Either<Failure, String>> call(File file) async {
    return await repository.updateUserAvatar(file);
  }
}
