import 'package:flutter_test/flutter_test.dart';
import 'package:mogen/repositories/fixo_repository.dart';

void main() {
  final repository = FixoRepository();

  test('deve trazer uma lista de FixoModel', () async{
    final list = await repository.fetchFixos(1);
    print(list[0].nome);
    });
}