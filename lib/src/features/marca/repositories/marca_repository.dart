import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/shared/api_client/api_client.dart';
import 'package:flutter_school/src/shared/either.dart';

class MarcaRepository {
  final tabela = 'marca';
  final ApiClient client;

  MarcaRepository(this.client);

  Future<Either<Exception, List<Marca>>> listMarcas() async {
    try {
      final result = await client.getData(tabela, '');
      return Success(result.map((e) => Marca.fromJson(e)).toList());
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
