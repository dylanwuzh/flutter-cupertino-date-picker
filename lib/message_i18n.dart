class LocaleMessage {
  /// Get done button text
  static String getLocaleDone(String locale) {
    String lang = _getLocaleLang(locale);

    switch (lang) {
      case 'zh':
        return '确定';

      case 'pt-br':
        return 'Feito';

      default:
        // default is English
        return 'Done';
    }
  }

  /// Get cancel button text
  static String getLocaleCancel(String locale) {
    String lang = _getLocaleLang(locale);

    switch (lang) {
      case 'zh':
        return '取消';

      case 'pt-br':
        return 'Cancelar';

      default:
        // default is English
        return 'Cancel';
    }
  }

  /// Get unit of day
  static String getLocaleYearUnit(String locale) {
    String lang = _getLocaleLang(locale);

    switch (lang) {
      case 'zh':
        return '年';

      default:
        return '';
    }
  }

  /// Get unit of month
  static String getLocaleMonthUnit(String locale) {
    String lang = _getLocaleLang(locale);

    switch (lang) {
      case 'zh':
        return '月';

      default:
        return '';
    }
  }

  /// Get unit of day
  static String getLocaleDayUnit(String locale) {
    String lang = _getLocaleLang(locale);

    switch (lang) {
      case 'zh':
        return '日';

      default:
        return '';
    }
  }

  static String _getLocaleLang(String locale) {
    return locale == null ? '' : locale.split('_').first;
  }
}
