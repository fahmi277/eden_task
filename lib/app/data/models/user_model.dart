class User {
  String name;
  String dayofBirth;
  double heigth;
  String gender;

  User(
      {this.name = '',
      this.dayofBirth = '',
      this.gender = '',
      this.heigth = 0});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        dayofBirth = json['day_of_birth'],
        heigth = json['heigth'],
        gender = json['gender'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'day_of_birth': dayofBirth,
        'heigth': heigth,
        'gender': gender,
      };
}
