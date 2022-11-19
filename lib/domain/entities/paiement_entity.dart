// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaiementEntity {
  int id;
  String date;
  String dateGMT;
  PaiementEntityGUID guid;
  String modified;
  String modifiedGMT;
  String slug;
  String status;
  String type;
  String link;
  PaiementEntityTitle title;
  PaiementEntityContent content;
  String commentStatus;
  String pingStatus;
  String template;
  PaiementEntityMeta meta;
  PaiementEntityACF acf;
  PaiementEntity({
    required this.id,
    required this.date,
    required this.dateGMT,
    required this.guid,
    required this.modified,
    required this.modifiedGMT,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.commentStatus,
    required this.pingStatus,
    required this.template,
    required this.meta,
    required this.acf,
  });

  @override
  bool operator ==(covariant PaiementEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.dateGMT == dateGMT &&
        other.modified == modified &&
        other.modifiedGMT == modifiedGMT &&
        other.slug == slug &&
        other.status == status &&
        other.type == type &&
        other.link == link &&
        other.commentStatus == commentStatus &&
        other.pingStatus == pingStatus &&
        other.template == template;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        dateGMT.hashCode ^
        modified.hashCode ^
        modifiedGMT.hashCode ^
        slug.hashCode ^
        status.hashCode ^
        type.hashCode ^
        link.hashCode ^
        commentStatus.hashCode ^
        pingStatus.hashCode ^
        template.hashCode;
  }

  @override
  String toString() {
    return 'PaiementEntity(id: $id, date: $date, dateGMT: $dateGMT, modified: $modified, modifiedGMT: $modifiedGMT, slug: $slug, status: $status, type: $type, link: $link, commentStatus: $commentStatus, pingStatus: $pingStatus, template: $template)';
  }
}

class PaiementEntityGUID {
  String rendered;
  PaiementEntityGUID({
    required this.rendered,
  });

  @override
  bool operator ==(covariant PaiementEntityGUID other) {
    if (identical(this, other)) return true;

    return other.rendered == rendered;
  }

  @override
  int get hashCode => rendered.hashCode;

  @override
  String toString() => 'PaiementEntityGUID(rendered: $rendered)';
}

class PaiementEntityTitle {
  String rendered;
  PaiementEntityTitle({
    required this.rendered,
  });

  @override
  bool operator ==(covariant PaiementEntityTitle other) {
    if (identical(this, other)) return true;

    return other.rendered == rendered;
  }

  @override
  int get hashCode => rendered.hashCode;

  @override
  String toString() => 'PaiementEntityTitle(rendered: $rendered)';
}

class PaiementEntityContent {
  String rendered;
  bool protected;
  PaiementEntityContent({
    required this.rendered,
    required this.protected,
  });

  @override
  bool operator ==(covariant PaiementEntityContent other) {
    if (identical(this, other)) return true;

    return other.rendered == rendered && other.protected == protected;
  }

  @override
  int get hashCode => rendered.hashCode ^ protected.hashCode;

  @override
  String toString() =>
      'PaiementEntityContent(rendered: $rendered, protected: $protected)';
}

class PaiementEntityMeta {
  bool inlineFeaturedImage;
  PaiementEntityMeta({
    required this.inlineFeaturedImage,
  });

  @override
  bool operator ==(covariant PaiementEntityMeta other) {
    if (identical(this, other)) return true;

    return other.inlineFeaturedImage == inlineFeaturedImage;
  }

  @override
  int get hashCode => inlineFeaturedImage.hashCode;

  @override
  String toString() =>
      'PaiementEntityMeta(inlineFeaturedImage: $inlineFeaturedImage)';
}

class PaiementEntityACF {
  String montant;
  String methodeDePaiement;
  PaiementEntityACFClient client;
  PaiementEntityACF({
    required this.montant,
    required this.methodeDePaiement,
    required this.client,
  });

  @override
  bool operator ==(covariant PaiementEntityACF other) {
    if (identical(this, other)) return true;

    return other.montant == montant &&
        other.methodeDePaiement == methodeDePaiement;
  }

  @override
  int get hashCode => montant.hashCode ^ methodeDePaiement.hashCode;

  @override
  String toString() =>
      'PaiementEntityACF(montant: $montant, methodeDePaiement: $methodeDePaiement)';
}

class PaiementEntityACFClient {
  int id;
  // String userFirstname;
  // String userLastname;
  // String nickname;
  // String userNicename;
  // String displayName;
  // String userEmail;
  // String userUrl;
  // String userRegistered;
  // String userDescription;
  // String userAvatar;
  PaiementEntityACFClient({
    required this.id,
    // required this.userFirstname,
    // required this.userLastname,
    // required this.nickname,
    // required this.userNicename,
    // required this.displayName,
    // required this.userEmail,
    // required this.userUrl,
    // required this.userRegistered,
    // required this.userDescription,
    // required this.userAvatar,
  });

  @override
  bool operator ==(covariant PaiementEntityACFClient other) {
    if (identical(this, other)) return true;

    return other.id == id;
    // other.userFirstname == userFirstname &&
    // other.userLastname == userLastname &&
    // other.nickname == nickname &&
    // other.userNicename == userNicename &&
    // other.displayName == displayName &&
    // other.userEmail == userEmail &&
    // other.userUrl == userUrl &&
    // other.userRegistered == userRegistered &&
    // other.userDescription == userDescription;
    // other.userAvatar == userAvatar;
  }

  @override
  int get hashCode {
    return id.hashCode;
    // userFirstname.hashCode ^
    // userLastname.hashCode ^
    // nickname.hashCode ^
    // userNicename.hashCode ^
    // displayName.hashCode ^
    // userEmail.hashCode ^
    // userUrl.hashCode ^
    // userRegistered.hashCode ^
    // userDescription.hashCode;
    // userAvatar.hashCode;
  }

  @override
  String toString() {
    return 'PaiementEntityACFClient(id: $id, )';
    //return 'PaiementEntityACFClient(id: $id, userFirstname: $userFirstname, userLastname: $userLastname, nickname: $nickname, userNicename: $userNicename, displayName: $displayName, userEmail: $userEmail, userUrl: $userUrl, userRegistered: $userRegistered, userDescription: $userDescription,)';
  }
}
