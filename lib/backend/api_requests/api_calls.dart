import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AuthCreateCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? password2 = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}",
  "password_confirmation": "${password2}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'auth create',
      apiUrl:
          'https://4e55-2804-7f0-b9c0-3103-b471-b243-652a-69ae.sa.ngrok.io/api/auth/create',
      callType: ApiCallType.POST,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Cache-Control': 'no-cache',
        'Accept': '*/*',
        'Connection': 'keep-alive',
        'User-Agent': 'app/cuidamos',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.data.token''',
      );
}

class AuthLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'auth login',
      apiUrl:
          'https://4e55-2804-7f0-b9c0-3103-b471-b243-652a-69ae.sa.ngrok.io/api/auth/login',
      callType: ApiCallType.POST,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Cache-Control': 'no-cache',
        'Accept': '*/*',
        'Connection': 'keep-alive',
        'User-Agent': 'app/cuidamos',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}
