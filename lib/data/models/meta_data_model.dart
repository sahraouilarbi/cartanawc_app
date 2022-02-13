class MetaDataModel {
  MetaDataModel({
    this.id,
    this.key,
    this.value,
  });
  int id;
  String key;
  String value;
  MetaDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    key = json['key'] as String;
    value = json['value'] as String;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
