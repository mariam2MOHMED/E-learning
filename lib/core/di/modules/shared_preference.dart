import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferenceModule{
  @preResolve
 Future<SharedPreferences>
 provideSharedPreferenceMoudle()async{
    return await SharedPreferences.getInstance();
  }
}