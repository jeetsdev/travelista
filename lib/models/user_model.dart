class User {
  String userID;
  String userName;
  String userRole;
  String userAvatar;
  DateTime userDOB;

  User({
    required this.userID,
    required this.userName,
    required this.userRole,
    required this.userAvatar,
    required this.userDOB,
  });

  updateProfile(String name, String role, DateTime dob) {
    userName = name;
    userRole = role;
    userDOB = dob;
    return this;
  }
}

var user = User(
  userID: "user1",
  userName: "Edward Larry",
  userRole: "Senior Designer",
  userAvatar:
      "https://res.cloudinary.com/dz7duml2h/image/upload/v1655813192/images_xhru8q.jpg",
  userDOB: DateTime.parse("1989-02-27"),
);
