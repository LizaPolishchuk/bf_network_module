import 'package:flutter/material.dart';

import '../../../../bf_network_module.dart';
import '../../repositories/repository.dart';

class SwitchLanguageUseCase {
  final Repository repository;

  SwitchLanguageUseCase(this.repository);

  Future<Either<Failure, void>> call(String locale) async {
    return await repository.setCurrentLanguage(locale);
  }
}
