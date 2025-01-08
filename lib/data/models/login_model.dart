import 'dart:convert';

class LognInResponse {
  final String message;
  final bool authenticated;
  final Data data;

  LognInResponse({
    required this.message,
    required this.authenticated,
    required this.data,
  });

  factory LognInResponse.fromRawJson(String str) => LognInResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LognInResponse.fromJson(Map<String, dynamic> json) => LognInResponse(
    message: json["message"],
    authenticated: json["authenticated"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "authenticated": authenticated,
    "data": data.toJson(),
  };
}
class Data {
  final String studentId;
  final String studentName;
  final String studentGender; // Add gender field
  final int degreeId;
  final int majorId;
  final int planYear;
  final String acceptanceYear;
  final int acceptanceSemester;
  final String email;

  Data({
    required this.studentId,
    required this.studentName,
    required this.studentGender, // Add gender field
    required this.degreeId,
    required this.majorId,
    required this.planYear,
    required this.acceptanceYear,
    required this.acceptanceSemester,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    studentId: json["Student_ID"],
    studentName: json["Student_Name"],
    studentGender: json["Student_Gender"], // Parse gender
    degreeId: json["Degree_ID"],
    majorId: json["Major_ID"],
    planYear: json["Plan_Year"],
    acceptanceYear: json["Acceptance_Year"],
    acceptanceSemester: json["Acceptance_Semester"],
    email: json["Email"],
  );

  Map<String, dynamic> toJson() => {
    "Student_ID": studentId,
    "Student_Name": studentName,
    "Student_Gender": studentGender, // Include gender
    "Degree_ID": degreeId,
    "Major_ID": majorId,
    "Plan_Year": planYear,
    "Acceptance_Year": acceptanceYear,
    "Acceptance_Semester": acceptanceSemester,
    "Email": email,
  };
}
