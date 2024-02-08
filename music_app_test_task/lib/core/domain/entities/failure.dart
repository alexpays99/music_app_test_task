class Failure {
  final String name;
  final String? description;

  const Failure({required this.name, this.description});

  factory Failure.fromObject(Object e) =>
      Failure(name: e.runtimeType.toString(), description: e.toString());
}
