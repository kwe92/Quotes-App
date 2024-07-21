import 'package:http/http.dart' as http;
import 'package:mvvm_example_app/shared/services/http_client_service.dart';
import 'package:mvvm_example_app/shared/services/quotes_service.dart';
import 'package:mvvm_example_app/shared/services/toast_service.dart';

HttpClientService get httpClientService => HttpClientService(http.Client());

QuotesService get quotesService => QuotesService(httpClientService.client);

ToastService get toastService => ToastService();
