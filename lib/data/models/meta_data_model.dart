class MetaDataModel {
  int? id;
  String? key;
  String? value;

  MetaDataModel({
    this.id,
    this.key,
    this.value,
  });

  factory MetaDataModel.fromJson(Map<String, dynamic> json) => MetaDataModel(
        id: json['id'] != null ? json['id'] as int : null,
        key: json['key'] != null ? json['key'] as String : null,
        value: json['value'] != null ? json['value'] as String : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['key'] = key;
    _data['value'] = value;
    return _data;
  }

  @override
  String toString() {
    return """
    MetaData:
      id: $id
      key: $key
      value: $value
    """;
  }
}
