/// Helper class to ensure that a class can be serialized.
abstract class Serializable {
  Map<String, dynamic> toJson();
}