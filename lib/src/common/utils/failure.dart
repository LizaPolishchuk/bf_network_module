class Failure {
  final int? code;
  final String? codeStr;
  final String message;

  Failure({this.code, this.message = "", this.codeStr});

  @override
  String toString() {
    return message;
  }
}
