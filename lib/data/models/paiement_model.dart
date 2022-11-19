// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaiementModel {
  int? id;
  String? date;
  String? dateGMT;
  PaiementModelGUID? guid;
  String? modified;
  String? modifiedGMT;
  String? slug;
  String? status;
  String? type;
  String? link;
  PaiementModelTitle? title;
  PaiementModelContent? content;
  String? commentStatus;
  String? pingStatus;
  String? template;
  PaiementModelMeta? meta;
  PaiementModelACF? acf;
  PaiementModel({
    this.id,
    this.date,
    this.dateGMT,
    this.guid,
    this.modified,
    this.modifiedGMT,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.commentStatus,
    this.pingStatus,
    this.template,
    this.meta,
    this.acf,
  });
  factory PaiementModel.fromJson(Map<String, dynamic> json) => PaiementModel(
        id: json['id'] != null ? json['id'] as int : null,
        date: json['date'] != null ? json['date'] as String : null,
        dateGMT: json['date_gmt'] != null ? json['date_gmt'] as String : null,
        guid: json['guid'] != null
            ? PaiementModelGUID.fromJson(json['guid'] as Map<String, dynamic>)
            : null,
        modified: json['modified'] != null ? json['modified'] as String : null,
        modifiedGMT: json['modified_gmt'] != null
            ? json['modified_gmt'] as String
            : null,
        slug: json['slug'] != null ? json['slug'] as String : null,
        status: json['status'] != null ? json['status'] as String : null,
        type: json['type'] != null ? json['type'] as String : null,
        link: json['link'] != null ? json['link'] as String : null,
        title: json['title'] != null
            ? PaiementModelTitle.fromJson(json['title'] as Map<String, dynamic>)
            : null,
        content: json['content'] != null
            ? PaiementModelContent.fromJson(
                json['content'] as Map<String, dynamic>)
            : null,
        commentStatus: json['comment_status'] != null
            ? json['comment_status'] as String
            : null,
        pingStatus:
            json['ping_status'] != null ? json['ping_status'] as String : null,
        template: json['template'] != null ? json['template'] as String : null,
        meta: json['meta'] != null
            ? PaiementModelMeta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        acf: json['acf'] != null
            ? PaiementModelACF.fromMap(json['acf'] as Map<String, dynamic>)
            : null,
      );
}

class PaiementModelGUID {
  String? rendered;
  PaiementModelGUID({
    this.rendered,
  });
  factory PaiementModelGUID.fromJson(Map<String, dynamic> json) =>
      PaiementModelGUID(
        rendered: json['rendered'] != null ? json['rendered'] as String : null,
      );
}

class PaiementModelTitle {
  String? rendered;
  PaiementModelTitle({
    this.rendered,
  });
  factory PaiementModelTitle.fromJson(Map<String, dynamic> json) =>
      PaiementModelTitle(
        rendered: json['rendered'] != null ? json['rendered'] as String : null,
      );
}

class PaiementModelContent {
  String? rendered;
  bool? protected;
  PaiementModelContent({
    this.rendered,
    this.protected,
  });
  factory PaiementModelContent.fromJson(Map<String, dynamic> json) =>
      PaiementModelContent(
        rendered: json['rendered'] != null ? json['rendered'] as String : null,
        protected: json['protected'] != null ? json['protected'] as bool : null,
      );
}

class PaiementModelMeta {
  bool? inlineFeaturedImage;
  PaiementModelMeta({
    this.inlineFeaturedImage,
  });
  factory PaiementModelMeta.fromJson(Map<String, dynamic> json) =>
      PaiementModelMeta(
        inlineFeaturedImage: json['inline_featured_image'] != null
            ? json['inline_featured_image'] as bool
            : null,
      );
}

class PaiementModelACF {
  String? montant;
  String? methodeDePaiement;
  PaiementModelACFClient? client;
  PaiementModelACF({
    this.montant,
    this.methodeDePaiement,
    this.client,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'montant': montant,
      'methodeDePaiement': methodeDePaiement,
    };
  }

  factory PaiementModelACF.fromMap(Map<String, dynamic> map) {
    return PaiementModelACF(
      montant: map['montant'] != null ? map['montant'] as String : null,
      methodeDePaiement: map['methode_de_paiement'] != null
          ? map['methode_de_paiement'] as String
          : null,
      client: map['client'] != null
          ? PaiementModelACFClient.fromMap(
              map['client'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaiementModelACF.fromJson(String source) =>
      PaiementModelACF.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PaiementModelACFClient {
  int? id;
  PaiementModelACFClient({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': id,
    };
  }

  factory PaiementModelACFClient.fromMap(Map<String, dynamic> map) {
    return PaiementModelACFClient(
      id: map['ID'] != null ? map['ID'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaiementModelACFClient.fromJson(String source) =>
      PaiementModelACFClient.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
