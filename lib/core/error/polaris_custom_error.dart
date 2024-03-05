class PolarisCustomError extends Error {
  final String? code;
  final String? message;

  PolarisCustomError({this.code, this.message});

  @override
  String toString() => 'HtpCustomError(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PolarisCustomError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
