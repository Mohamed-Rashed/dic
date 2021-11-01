import 'package:get/get.dart';
import 'package:maksid_dictionaty/languages/ar.dart';
import 'package:maksid_dictionaty/languages/en.dart';
import 'package:maksid_dictionaty/languages/tr.dart';


class Translation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':en,
    'ar': ar,
    'tr':tr,

  };

}