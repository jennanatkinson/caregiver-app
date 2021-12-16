class User {
  String username;
  String name;
  String userId;
  String? defaultCarePlanId;

  User(this.username, this.name, this.userId, this.defaultCarePlanId);
  User.withoutDefaultCarePlan(this.username, this.name, this.userId);
}