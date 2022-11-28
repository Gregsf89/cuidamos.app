import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_page
  {
    '97thvzke': {
      'pt': 'Entrar',
      'en': 'Sign in',
    },
    'm2c7h5ui': {
      'pt': '',
      'en': 'Email Address',
    },
    '7fzcv6vz': {
      'pt': 'seu email...',
      'en': 'your email...',
    },
    'bj8o9htv': {
      'pt': '',
      'en': 'Password',
    },
    'mnchc8dk': {
      'pt': 'sua senha...',
      'en': 'your password...',
    },
    '8dtyh9le': {
      'pt': 'Entrar',
      'en': 'Sign in',
    },
    'jen0x3wz': {
      'pt': 'Esquecei sua Senha?',
      'en': 'Forgot your password?',
    },
    'mr25vzeu': {
      'pt': 'Ou use sua rede social para entrar',
      'en': 'Or use your social media',
    },
    'zo9fvn2y': {
      'pt': 'Criar Conta',
      'en': 'Create Account',
    },
    'e9dk7kto': {
      'pt': '',
      'en': 'Email Address',
    },
    'rnh5x476': {
      'pt': 'seu email...',
      'en': 'your email...',
    },
    'jfiqo324': {
      'pt': '',
      'en': 'Password',
    },
    'oqg36qmw': {
      'pt': 'sua senha...',
      'en': 'your password...',
    },
    '5rgsvnut': {
      'pt': '',
      'en': 'Email Address',
    },
    '1sxly09c': {
      'pt': 'confirme sua senha...',
      'en': 'your email...',
    },
    'tvz8h3rj': {
      'pt': 'Criar Conta',
      'en': 'Sign Up',
    },
    't1tirgsw': {
      'pt': 'Crie uma conta com sua rede social',
      'en': 'Sign up with your social media',
    },
    'higsd8i6': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // home_dash
  {
    '0byyhew6': {
      'pt': 'Dashboard',
      'en': '',
    },
    'ks1rdal0': {
      'pt': 'Abaixo estão os dados da pessoa sob seu cuidado',
      'en': '',
    },
    'fe77j1qf': {
      'pt': 'Vanessa Silva',
      'en': '',
    },
    'fcb688cf': {
      'pt': 'Local: Vila Clementino',
      'en': '',
    },
    'dich3xoq': {
      'pt': '__',
      'en': '',
    },
  },
  // phone_screen
  {
    '4354xt1y': {
      'pt': 'Coloque seu telefone',
      'en': '',
    },
    'rphl9fxt': {
      'pt': 'Coloque seu número de telefone abaixo',
      'en': '',
    },
    '0vh6h7fm': {
      'pt': 'Coloque um número válido',
      'en': '',
    },
    '3h3ao8b3': {
      'pt': '+55',
      'en': '',
    },
    'i2vgnitw': {
      'pt': 'Enviar SMS',
      'en': '',
    },
    'povuwrpq': {
      'pt': 'Home',
      'en': '',
    },
  },
  // user_info
  {
    'bgi8zgrh': {
      'pt': 'Seu Nome',
      'en': '',
    },
    'dfxhc9z4': {
      'pt': 'Sua Cidade',
      'en': '',
    },
    'pw1wgb1a': {
      'pt': '',
      'en': '',
    },
    '10ktu2ul': {
      'pt': 'Acre',
      'en': '',
    },
    's1umio55': {
      'pt': 'Alagoas',
      'en': '',
    },
    'fc9q4ovi': {
      'pt': 'Amapá',
      'en': '',
    },
    'xpvlswtu': {
      'pt': 'Amazonas',
      'en': '',
    },
    'qptl8aj3': {
      'pt': 'Bahia',
      'en': '',
    },
    '052bn70l': {
      'pt': 'Ceara',
      'en': '',
    },
    '6o96w6kn': {
      'pt': 'Distrito Federal',
      'en': '',
    },
    '3sfywm98': {
      'pt': 'Espírito Santo',
      'en': '',
    },
    '7zvi36v8': {
      'pt': 'Goiás',
      'en': '',
    },
    'mdr2811u': {
      'pt': 'Maranhão',
      'en': '',
    },
    'pkiszkzd': {
      'pt': 'Mato Grosso',
      'en': '',
    },
    'nkhjhz1f': {
      'pt': 'Mato Grosso do Sul',
      'en': '',
    },
    'ryh5eru0': {
      'pt': 'Minas Gerais',
      'en': '',
    },
    '64qd6p5a': {
      'pt': 'Pará',
      'en': '',
    },
    'lf133sm0': {
      'pt': 'Paraíba',
      'en': '',
    },
    'bbspn0gz': {
      'pt': 'Paraná',
      'en': '',
    },
    '605zohy3': {
      'pt': 'Pernambuco',
      'en': '',
    },
    'xqusrdbk': {
      'pt': 'Piauí',
      'en': '',
    },
    'v5f2hk5n': {
      'pt': 'Rio de Janeiro',
      'en': '',
    },
    'j932s6el': {
      'pt': 'Rio Grande do Norte',
      'en': '',
    },
    'kwrv7rph': {
      'pt': 'Rio Grande do Sul',
      'en': '',
    },
    'gviuritk': {
      'pt': 'Rondônia',
      'en': '',
    },
    '7mup0ffi': {
      'pt': 'Roraima',
      'en': '',
    },
    'xdv1hrku': {
      'pt': 'Santa Catarina',
      'en': '',
    },
    'fg3xc7bj': {
      'pt': 'São Paulo',
      'en': '',
    },
    '28kpq190': {
      'pt': 'Sergipe',
      'en': '',
    },
    'f20ohju7': {
      'pt': 'Tocantins',
      'en': '',
    },
    'tb5iadh2': {
      'pt': 'Estado',
      'en': '',
    },
    'qxx2yhs7': {
      'pt': 'Selecione o Estado',
      'en': '',
    },
    '0h5bcsi1': {
      'pt': 'Seu Endereço',
      'en': '',
    },
    'ig4vb5la': {
      'pt': 'Seu CEP',
      'en': '',
    },
    'vkhjjb1r': {
      'pt': 'Sua data de nascimento',
      'en': '',
    },
    'bb9nskr2': {
      'pt': '',
      'en': '',
    },
    'j18u7wct': {
      'pt': 'Feminino',
      'en': '',
    },
    '6for2owr': {
      'pt': 'Masculino',
      'en': '',
    },
    'mli0dql6': {
      'pt': 'Outro',
      'en': '',
    },
    '7nn09lru': {
      'pt': 'Selecione seu gênero',
      'en': '',
    },
    'pnflm7ni': {
      'pt': 'Seu CPF',
      'en': '',
    },
    'jkvaj9nw': {
      'pt': 'Salvar',
      'en': '',
    },
    '4o3x1xco': {
      'pt': 'Complete seu Perfil',
      'en': '',
    },
  },
  // validate_phone
  {
    '061w7kec': {
      'pt': 'Confirme seu código',
      'en': '',
    },
    'ehw46kbk': {
      'pt': 'Coloque o código que você recebeu via SMS abaixo',
      'en': '',
    },
    'xplae4uq': {
      'pt': 'Confirmar & Continuar',
      'en': '',
    },
    'fiit2cjv': {
      'pt': 'Reenviar SMS',
      'en': '',
    },
    'xmboib3i': {
      'pt': 'Confiirme o código recebido abaixo',
      'en': '',
    },
    'ksqh9myp': {
      'pt': 'Home',
      'en': '',
    },
  },
  // email_confirmation
  {
    '4jry5pk0': {
      'pt': 'Seu email ainda não foi confirmado',
      'en': '',
    },
    '8eyh3n2m': {
      'pt':
          'Enviamos uma mensagem com um link  para o email inormado. Acesse o link para confirmar que o email pertence a você',
      'en': '',
    },
    '9a04qnsj': {
      'pt': 'Reenviar email',
      'en': '',
    },
    'dm4w3t1i': {
      'pt': 'Confirmar email',
      'en': '',
    },
    'gbkyfqzn': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '6ldx6l25': {
      'pt': '',
      'en': '',
    },
    'fcy125uc': {
      'pt': '',
      'en': '',
    },
    '618k8xb4': {
      'pt': 'precisamos dessa permissao',
      'en': '',
    },
    'vbw8oiub': {
      'pt': 'precisamos dessa permissa',
      'en': '',
    },
    'joqj90l3': {
      'pt': '',
      'en': '',
    },
    'mlwy39cm': {
      'pt': '',
      'en': '',
    },
    'b60fxc6b': {
      'pt': '',
      'en': '',
    },
    '2tinrd7f': {
      'pt': '',
      'en': '',
    },
    'unmq9cc6': {
      'pt': '',
      'en': '',
    },
    'bpyjavo1': {
      'pt': '',
      'en': '',
    },
    'byqigyqr': {
      'pt': '',
      'en': '',
    },
    'odki2le0': {
      'pt': '',
      'en': '',
    },
    'rgj77zay': {
      'pt': '',
      'en': '',
    },
    'dhxdr2j3': {
      'pt': '',
      'en': '',
    },
    'ot6fnmhn': {
      'pt': '',
      'en': '',
    },
    'g7mfk2t2': {
      'pt': '',
      'en': '',
    },
    '5p2ufw7q': {
      'pt': '',
      'en': '',
    },
    'er84fpv7': {
      'pt': '',
      'en': '',
    },
    'dw6d5uje': {
      'pt': '',
      'en': '',
    },
    'kabzu185': {
      'pt': '',
      'en': '',
    },
    'x9x2b764': {
      'pt': '',
      'en': '',
    },
    'bwjoi3p5': {
      'pt': '',
      'en': '',
    },
    'o7j7gdkx': {
      'pt': '',
      'en': '',
    },
    'nt4tw3hz': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
