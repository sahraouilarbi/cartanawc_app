// ignore_for_file: public_member_api_docs, sort_constructors_first
class MagasinCosmetiqueEntity {
  int id;
  String date;
  String dateGmt;
  MagasinCosmetiqueEntityGUID guid;
  String modified;
  String modifiedGmt;
  String slug;
  String status;
  String type;
  String link;
  MagasinCosmetiqueEntityTitle title;
  String template;
  MagasinCosmetiqueEntityMeta meta;
  MagasinCosmetiqueEntityACF acf;

  MagasinCosmetiqueEntity({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.guid,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.template,
    required this.meta,
    required this.acf,
  });

  @override
  String toString() {
    return 'MagasinCosmetiqueEntity(id: $id, date: $date, dateGmt: $dateGmt, modified: $modified, modifiedGmt: $modifiedGmt, slug: $slug, status: $status, type: $type, link: $link, title: $title, template: $template, meta: $meta, acf: $acf,)';
  }

  @override
  bool operator ==(covariant MagasinCosmetiqueEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.dateGmt == dateGmt &&
        other.modified == modified &&
        other.modifiedGmt == modifiedGmt &&
        other.slug == slug &&
        other.status == status &&
        other.type == type &&
        other.link == link &&
        other.title == title &&
        other.template == template &&
        other.meta == meta &&
        other.acf == acf;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        dateGmt.hashCode ^
        modified.hashCode ^
        modifiedGmt.hashCode ^
        slug.hashCode ^
        status.hashCode ^
        type.hashCode ^
        link.hashCode ^
        title.hashCode ^
        template.hashCode ^
        meta.hashCode ^
        acf.hashCode;
  }
}

class MagasinCosmetiqueEntityGUID {
  String rendered;
  MagasinCosmetiqueEntityGUID({
    required this.rendered,
  });

  @override
  bool operator ==(covariant MagasinCosmetiqueEntityGUID other) {
    if (identical(this, other)) return true;

    return other.rendered == rendered;
  }

  @override
  int get hashCode => rendered.hashCode;

  @override
  String toString() => 'MagasinCosmetiqueEntityGUID(rendered: $rendered)';
}

class MagasinCosmetiqueEntityTitle {
  String rendered;
  MagasinCosmetiqueEntityTitle({
    required this.rendered,
  });

  @override
  bool operator ==(covariant MagasinCosmetiqueEntityTitle other) {
    if (identical(this, other)) return true;

    return other.rendered == rendered;
  }

  @override
  int get hashCode => rendered.hashCode;

  @override
  String toString() => 'MagasinCosmetiqueEntityTitle(rendered: $rendered)';
}

class MagasinCosmetiqueEntityMeta {
  bool inlineFeaturedImage;
  MagasinCosmetiqueEntityMeta({
    required this.inlineFeaturedImage,
  });

  @override
  bool operator ==(covariant MagasinCosmetiqueEntityMeta other) {
    if (identical(this, other)) return true;

    return other.inlineFeaturedImage == inlineFeaturedImage;
  }

  @override
  int get hashCode => inlineFeaturedImage.hashCode;

  @override
  String toString() =>
      'MagasinCosmetiqueEntityMeta(inlineFeaturedImage: $inlineFeaturedImage)';
}

class MagasinCosmetiqueEntityACF {
  String latitude;
  String longitude;
  MagasinCosmetiqueEntityACF({
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(covariant MagasinCosmetiqueEntityACF other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() =>
      'MagasinCosmetiqueEntityACF(latitude: $latitude, longitude: $longitude)';
}
