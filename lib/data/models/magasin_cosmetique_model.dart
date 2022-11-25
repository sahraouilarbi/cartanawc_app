import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MagasinCosmetiqueModel {
  int? id;
  String? date;
  String? dateGmt;
  MagasinCosmetiqueModelGUID? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  MagasinCosmetiqueModelTitle? title;
  String? template;
  MagasinCosmetiqueModelMeta? meta;
  MagasinCosmetiqueModelACF? acf;

  MagasinCosmetiqueModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.template,
    this.meta,
    this.acf,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'date_gmt': dateGmt,
      'guid': guid,
      'modified': modified,
      'modified_gmt': modifiedGmt,
      'slug': slug,
      'status': status,
      'type': type,
      'link': link,
      'title': title,
      'template': template,
      'meta': meta,
      'acf': acf,
    };
  }

  factory MagasinCosmetiqueModel.fromMap(Map<String, dynamic> map) {
    return MagasinCosmetiqueModel(
      id: map['id'] != null ? map['id'] as int : null,
      date: map['date'] != null ? map['date'] as String : null,
      dateGmt: map['date_gmt'] != null ? map['date_gmt'] as String : null,
      guid: map['guid'] != null
          ? MagasinCosmetiqueModelGUID.fromMap(
              map['guid'] as Map<String, dynamic>,
            )
          : null,
      modified: map['modified'] != null ? map['modified'] as String : null,
      modifiedGmt:
          map['modified_gmt'] != null ? map['modified_gmt'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
      title: map['title'] != null
          ? MagasinCosmetiqueModelTitle.fromMap(
              map['title'] as Map<String, dynamic>,
            )
          : null,
      template: map['template'] != null ? map['template'] as String : null,
      meta: map['meta'] != null
          ? MagasinCosmetiqueModelMeta.fromMap(
              map['meta'] as Map<String, dynamic>,
            )
          : null,
      acf: map['acf'] != null
          ? MagasinCosmetiqueModelACF.fromMap(
              map['acf'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MagasinCosmetiqueModel.fromJson(String source) =>
      MagasinCosmetiqueModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

class MagasinCosmetiqueModelGUID {
  String? rendered;
  MagasinCosmetiqueModelGUID({
    this.rendered,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rendered': rendered,
    };
  }

  factory MagasinCosmetiqueModelGUID.fromMap(Map<String, dynamic> map) {
    return MagasinCosmetiqueModelGUID(
      rendered: map['rendered'] != null ? map['rendered'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MagasinCosmetiqueModelGUID.fromJson(String source) =>
      MagasinCosmetiqueModelGUID.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

class MagasinCosmetiqueModelTitle {
  String? rendered;
  MagasinCosmetiqueModelTitle({
    this.rendered,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rendered': rendered,
    };
  }

  factory MagasinCosmetiqueModelTitle.fromMap(Map<String, dynamic> map) {
    return MagasinCosmetiqueModelTitle(
      rendered: map['rendered'] != null ? map['rendered'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MagasinCosmetiqueModelTitle.fromJson(String source) =>
      MagasinCosmetiqueModelTitle.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

class MagasinCosmetiqueModelMeta {
  bool? inlineFeaturedImage;
  MagasinCosmetiqueModelMeta({
    this.inlineFeaturedImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inline_featured_image': inlineFeaturedImage,
    };
  }

  factory MagasinCosmetiqueModelMeta.fromMap(Map<String, dynamic> map) {
    return MagasinCosmetiqueModelMeta(
      inlineFeaturedImage: map['inline_featured_image'] != null
          ? map['inline_featured_image'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MagasinCosmetiqueModelMeta.fromJson(String source) =>
      MagasinCosmetiqueModelMeta.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

class MagasinCosmetiqueModelACF {
  String? latitude;
  String? longitude;
  MagasinCosmetiqueModelACF({
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory MagasinCosmetiqueModelACF.fromMap(Map<String, dynamic> map) {
    return MagasinCosmetiqueModelACF(
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MagasinCosmetiqueModelACF.fromJson(String source) =>
      MagasinCosmetiqueModelACF.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
