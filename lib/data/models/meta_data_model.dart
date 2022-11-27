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

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
      };

  @override
  String toString() => "MetaData(id: $id, key: $key, value: $value,";
}
