import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_cat/features/login/domain/helper/validator_helper.dart';

const invalidPassword1 = '{[]{}}[((a))]';
const invalidPassword2 = '{}[()]{)';
const validPassword = '{[]{}}[(())]{}';

void main() {
  test(
    'invalid pattern',
    () {
      const input = invalidPassword1;

      final result = evaluateParenthesis(input);

      expect(result, false);
    },
  );
}
