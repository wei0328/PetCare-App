class UserResponse {
  final User? payload;
  final int? totalCount;
  final int? dataCount;
  final int? totalPages;
  final int? responseCode;
  final List<String>? errors;
  final bool? hasErrors;
  final int? code;
  final int? result;
  final String? description;

  UserResponse({
    this.payload,
    this.totalCount,
    this.dataCount,
    this.totalPages,
    this.responseCode,
    this.errors,
    this.hasErrors,
    this.code,
    this.result,
    this.description,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      payload: json['payload'] != null ? User.fromJson(json['payload']) : null,
      totalCount: json['totalCount'],
      dataCount: json['dataCount'],
      totalPages: json['totalPages'],
      responseCode: json['responseCode'],
      errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
      hasErrors: json['hasErrors'],
      code: json['code'],
      result: json['result'],
      description: json['description'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'payload': payload!.toJson(),
      'totalCount': totalCount,
      'dataCount': dataCount,
      'totalPages': totalPages,
      'responseCode': responseCode,
      'errors': errors,
      'hasErrors': hasErrors,
      'code': code,
      'result': result,
      'description': description,
    };
  }
}

class User {
  final String? email;
  final String? lastName;
  final String? firstName;
  final String? phoneNumber;

  User({
    this.email,
    this.lastName,
    this.firstName,
    this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      phoneNumber: json['phoneNumber'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'lastName': lastName,
      'firstName': firstName,
      'phoneNumber': phoneNumber,
    };
  }
}
