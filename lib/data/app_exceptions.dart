class AppExceptions implements Exception {
  final _massage;
  final _prefix;
  AppExceptions(this._massage, this._prefix);

  String toString() {
    return "$_massage,$_prefix";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? massage])
      : super(massage, "Error During Communication");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? massage]) : super(massage, "Invalid Request");
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? massage])
      : super(massage, "Unauthorised Request");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? massage]) : super(massage, "Invalid Input");
}
