import 'package:coffee_corner/core/cache/cache_helper.dart';
import 'package:coffee_corner/core/global_controller/change_language_cubit/change_language_state.dart';
import 'package:coffee_corner/core/helpers/get_it_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());
  static ChangeLanguageCubit get(context) => BlocProvider.of(context);
  Map<String, String> languages = {
    "English": "en",
    "Arabic": "ar",
  };

  void changeLanguageFromMenu(String lang) async {
    await getIt<CacheHelper>().setCurrentLanguage(language: lang);
    await getIt<CacheHelper>()
        .setCurrentLanguageCode(languageCode: languages[lang]!);
    emit(ChangeLanguageDone());
  }
}
