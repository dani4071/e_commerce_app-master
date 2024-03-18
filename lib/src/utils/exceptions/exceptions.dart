
class danException implements Exception {
  final String message;


  const danException([this.message = "An error has occurred."]);


  factory danException.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const danException('Email already in-use my gee');
      case 'invalid-email':
        return const danException('Email is not valid or badly formatted my gee');
      default:
        return const danException();
    }
  }
}