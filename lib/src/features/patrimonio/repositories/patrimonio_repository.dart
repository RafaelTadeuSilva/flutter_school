import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/shared/api_client/api_client.dart';
import 'package:flutter_school/src/shared/either.dart';

class PatrimonioRepository {
  final tabela = 'patrimonio';
  final ApiClient dataSource;

  PatrimonioRepository(this.dataSource);

  Future<Either<Exception, List<Patrimonio>>> listPatrimonios() async {
    try {
      final list = await dataSource.getData(tabela, "");
      return Success(list.map((e) => Patrimonio.fromJson(e)).toList());
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Future<Either<Exception, Patrimonio>> getPatrimonio(String id) async {
    try {
      final result = await dataSource.getOne(tabela, id);
      return Success(Patrimonio.fromJson(result));
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
