class Actor {
  final int id;
  final String name;
  final String profilePat;
  final String? character;

  Actor(
      {required this.id,
      required this.name,
      required this.profilePat,
      this.character});
}
