import 'package:app/data/response/status.dart';

class ApiReponse<T> {
  Status? status;
  T? data;
  String? massage;

  ApiReponse(this.status, this.data, this.massage);

  ApiReponse.loading() : status = Status.loading;
  ApiReponse.completed() : status = Status.completed;
  ApiReponse.error() : status = Status.error;

  @override
  String toString() {
    return "Status :$status\n Massage :$massage \n Data : $data";
  }
}
