enum AppLanguages {
  nb, // Norwegian
  en, // English
  sv, // Swedish
}

extension AppLanguageTitle on AppLanguages {
  String getTitle() {
    switch (this) {
      case AppLanguages.en:
        return "English";
      case AppLanguages.nb:
        return "Norsk Bokmål";
      case AppLanguages.sv:
        return "Svenska";
      default:
        return "English";
    }
  }
}
