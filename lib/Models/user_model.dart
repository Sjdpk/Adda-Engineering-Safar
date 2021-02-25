class UserModel {
  String email;
  String uid;
  String username;
  String university;
  String program;
  String semester;
  DateTime timestamp;

  UserModel({
    this.email,
    this.uid,
    this.username,
    this.university = 'Pokhara University',
    this.program,
    this.semester,
    this.timestamp,
  });

  Map toMap(UserModel user) {
    var data = Map<String, dynamic>();

    data["uid"] = user.uid;
    data["username"] = user.username;
    data["email"] = user.email;
    data['university'] = user.university;
    data['program'] = user.program;
    data['semester'] = user.semester;
    data["timestamp"] = user.timestamp;

    return data;
  }

  UserModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData["uid"];
    this.username = mapData["username"];
    this.email = mapData["email"];
    this.university = mapData["university"];
    this.program = mapData["program"];
    this.semester = mapData["semester"];
  }
}
