import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': {
        'Hello': 'Hello',
        'world': 'world',
        'how are you to day?': 'how are you to day?'
      },
      'kh': {
        'Hello': 'សូរស្ដី',
        'world': 'ពិភពលោក',
        'how are you to day?': 'តើអ្នកសុខសប្បាយជាទេ?'
      }
    };
  }
}
