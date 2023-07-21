// // To parse this JSON data, do
// //
// //     final post = postFromJson(jsonString);

// import 'dart:convert';

// Post postFromJson(String str) => Post.fromJson(json.decode(str));

// String postToJson(Post data) => json.encode(data.toJson());

// class Post {
//   int id;
//   DateTime date;
//   DateTime dateGmt;
//   Guid guid;
//   DateTime modified;
//   DateTime modifiedGmt;
//   String slug;
//   String status;
//   String type;
//   String link;
//   Guid title;
//   Content content;
//   Content excerpt;
//   int author;
//   int featuredMedia;
//   String commentStatus;
//   String pingStatus;
//   bool sticky;
//   String template;
//   String format;
//   Meta meta;
//   List<int> categories;
//   List<int> tags;
//   List<dynamic> acf;
//   String modifiedBy;
//   bool ampEnabled;
//   Links links;

//   Post({
//     required this.id,
//     required this.date,
//     required this.dateGmt,
//     required this.guid,
//     required this.modified,
//     required this.modifiedGmt,
//     required this.slug,
//     required this.status,
//     required this.type,
//     required this.link,
//     required this.title,
//     required this.content,
//     required this.excerpt,
//     required this.author,
//     required this.featuredMedia,
//     required this.commentStatus,
//     required this.pingStatus,
//     required this.sticky,
//     required this.template,
//     required this.format,
//     required this.meta,
//     required this.categories,
//     required this.tags,
//     required this.acf,
//     required this.modifiedBy,
//     required this.ampEnabled,
//     required this.links,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         id: json["id"],
//         date: DateTime.parse(json["date"]),
//         dateGmt: DateTime.parse(json["date_gmt"]),
//         guid: Guid.fromJson(json["guid"]),
//         modified: DateTime.parse(json["modified"]),
//         modifiedGmt: DateTime.parse(json["modified_gmt"]),
//         slug: json["slug"],
//         status: json["status"],
//         type: json["type"],
//         link: json["link"],
//         title: Guid.fromJson(json["title"]),
//         content: Content.fromJson(json["content"]),
//         excerpt: Content.fromJson(json["excerpt"]),
//         author: json["author"],
//         featuredMedia: json["featured_media"],
//         commentStatus: json["comment_status"],
//         pingStatus: json["ping_status"],
//         sticky: json["sticky"],
//         template: json["template"],
//         format: json["format"],
//         meta: Meta.fromJson(json["meta"]),
//         categories: List<int>.from(json["categories"].map((x) => x)),
//         tags: List<int>.from(json["tags"].map((x) => x)),
//         acf: List<dynamic>.from(json["acf"].map((x) => x)),
//         modifiedBy: json["modified_by"],
//         ampEnabled: json["amp_enabled"],
//         links: Links.fromJson(json["_links"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "date": date.toIso8601String(),
//         "date_gmt": dateGmt.toIso8601String(),
//         "guid": guid.toJson(),
//         "modified": modified.toIso8601String(),
//         "modified_gmt": modifiedGmt.toIso8601String(),
//         "slug": slug,
//         "status": status,
//         "type": type,
//         "link": link,
//         "title": title.toJson(),
//         "content": content.toJson(),
//         "excerpt": excerpt.toJson(),
//         "author": author,
//         "featured_media": featuredMedia,
//         "comment_status": commentStatus,
//         "ping_status": pingStatus,
//         "sticky": sticky,
//         "template": template,
//         "format": format,
//         "meta": meta.toJson(),
//         "categories": List<dynamic>.from(categories.map((x) => x)),
//         "tags": List<dynamic>.from(tags.map((x) => x)),
//         "acf": List<dynamic>.from(acf.map((x) => x)),
//         "modified_by": modifiedBy,
//         "amp_enabled": ampEnabled,
//         "_links": links.toJson(),
//       };
// }

// class Content {
//   String rendered;
//   bool protected;

//   Content({
//     required this.rendered,
//     required this.protected,
//   });

//   factory Content.fromJson(Map<String, dynamic> json) => Content(
//         rendered: json["rendered"],
//         protected: json["protected"],
//       );

//   Map<String, dynamic> toJson() => {
//         "rendered": rendered,
//         "protected": protected,
//       };
// }

// class Guid {
//   String rendered;

//   Guid({
//     required this.rendered,
//   });

//   factory Guid.fromJson(Map<String, dynamic> json) => Guid(
//         rendered: json["rendered"],
//       );

//   Map<String, dynamic> toJson() => {
//         "rendered": rendered,
//       };
// }

// class Links {
//   List<About> self;
//   List<About> collection;
//   List<About> about;
//   List<Author> author;
//   List<Author> replies;
//   List<VersionHistory> versionHistory;
//   List<PredecessorVersion> predecessorVersion;
//   List<Author> wpFeaturedmedia;
//   List<About> wpAttachment;
//   List<WpTerm> wpTerm;
//   List<Cury> curies;

//   Links({
//     required this.self,
//     required this.collection,
//     required this.about,
//     required this.author,
//     required this.replies,
//     required this.versionHistory,
//     required this.predecessorVersion,
//     required this.wpFeaturedmedia,
//     required this.wpAttachment,
//     required this.wpTerm,
//     required this.curies,
//   });

//   factory Links.fromJson(Map<String, dynamic> json) => Links(
//         self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
//         collection:
//             List<About>.from(json["collection"].map((x) => About.fromJson(x))),
//         about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
//         author:
//             List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
//         replies:
//             List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
//         versionHistory: List<VersionHistory>.from(
//             json["version-history"].map((x) => VersionHistory.fromJson(x))),
//         predecessorVersion: List<PredecessorVersion>.from(
//             json["predecessor-version"]
//                 .map((x) => PredecessorVersion.fromJson(x))),
//         wpFeaturedmedia: List<Author>.from(
//             json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
//         wpAttachment: List<About>.from(
//             json["wp:attachment"].map((x) => About.fromJson(x))),
//         wpTerm:
//             List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
//         curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "self": List<dynamic>.from(self.map((x) => x.toJson())),
//         "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
//         "about": List<dynamic>.from(about.map((x) => x.toJson())),
//         "author": List<dynamic>.from(author.map((x) => x.toJson())),
//         "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
//         "version-history":
//             List<dynamic>.from(versionHistory.map((x) => x.toJson())),
//         "predecessor-version":
//             List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
//         "wp:featuredmedia":
//             List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
//         "wp:attachment":
//             List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
//         "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
//         "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
//       };
// }

// class About {
//   String href;

//   About({
//     required this.href,
//   });

//   factory About.fromJson(Map<String, dynamic> json) => About(
//         href: json["href"],
//       );

//   Map<String, dynamic> toJson() => {
//         "href": href,
//       };
// }

// class Author {
//   bool embeddable;
//   String href;

//   Author({
//     required this.embeddable,
//     required this.href,
//   });

//   factory Author.fromJson(Map<String, dynamic> json) => Author(
//         embeddable: json["embeddable"],
//         href: json["href"],
//       );

//   Map<String, dynamic> toJson() => {
//         "embeddable": embeddable,
//         "href": href,
//       };
// }

// class Cury {
//   String name;
//   String href;
//   bool templated;

//   Cury({
//     required this.name,
//     required this.href,
//     required this.templated,
//   });

//   factory Cury.fromJson(Map<String, dynamic> json) => Cury(
//         name: json["name"],
//         href: json["href"],
//         templated: json["templated"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "href": href,
//         "templated": templated,
//       };
// }

// class PredecessorVersion {
//   int id;
//   String href;

//   PredecessorVersion({
//     required this.id,
//     required this.href,
//   });

//   factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
//       PredecessorVersion(
//         id: json["id"],
//         href: json["href"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "href": href,
//       };
// }

// class VersionHistory {
//   int count;
//   String href;

//   VersionHistory({
//     required this.count,
//     required this.href,
//   });

//   factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
//         count: json["count"],
//         href: json["href"],
//       );

//   Map<String, dynamic> toJson() => {
//         "count": count,
//         "href": href,
//       };
// }

// class WpTerm {
//   String taxonomy;
//   bool embeddable;
//   String href;

//   WpTerm({
//     required this.taxonomy,
//     required this.embeddable,
//     required this.href,
//   });

//   factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
//         taxonomy: json["taxonomy"],
//         embeddable: json["embeddable"],
//         href: json["href"],
//       );

//   Map<String, dynamic> toJson() => {
//         "taxonomy": taxonomy,
//         "embeddable": embeddable,
//         "href": href,
//       };
// }

// class Meta {
//   String etPbUseBuilder;
//   String etPbOldContent;
//   String etGbContentWidth;
//   String lmtDisableupdate;
//   String lmtDisable;

//   Meta({
//     required this.etPbUseBuilder,
//     required this.etPbOldContent,
//     required this.etGbContentWidth,
//     required this.lmtDisableupdate,
//     required this.lmtDisable,
//   });

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         etPbUseBuilder: json["_et_pb_use_builder"],
//         etPbOldContent: json["_et_pb_old_content"],
//         etGbContentWidth: json["_et_gb_content_width"],
//         lmtDisableupdate: json["_lmt_disableupdate"],
//         lmtDisable: json["_lmt_disable"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_et_pb_use_builder": etPbUseBuilder,
//         "_et_pb_old_content": etPbOldContent,
//         "_et_gb_content_width": etGbContentWidth,
//         "_lmt_disableupdate": lmtDisableupdate,
//         "_lmt_disable": lmtDisable,
//       };
// }

// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

//****************************************************************************//
//************************ - - - EMPÓRIO DOMUS - - - *************************//
//****************************************************************************//
import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  int id;
  DateTime date;
  DateTime dateGmt;
  Guid guid;
  DateTime modified;
  DateTime modifiedGmt;
  String slug;
  String status;
  String type;
  String link;
  Guid title;
  Content content;
  Content excerpt;
  int author;
  int featuredMedia;
  String commentStatus;
  String pingStatus;
  bool sticky;
  String template;
  String format;
  Meta meta;
  List<int> categories;
  List<int> tags;
  String jetpackFeaturedMediaUrl;
  Links links;

  Post({
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
    required this.content,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.commentStatus,
    required this.pingStatus,
    required this.sticky,
    required this.template,
    required this.format,
    required this.meta,
    required this.categories,
    required this.tags,
    required this.jetpackFeaturedMediaUrl,
    required this.links,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        sticky: json["sticky"],
        template: json["template"],
        format: json["format"],
        meta: Meta.fromJson(json["meta"]),
        categories: List<int>.from(json["categories"].map((x) => x)),
        tags: List<int>.from(json["tags"].map((x) => x)),
        jetpackFeaturedMediaUrl: json["jetpack_featured_media_url"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": meta.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "jetpack_featured_media_url": jetpackFeaturedMediaUrl,
        "_links": links.toJson(),
      };
}

class Content {
  String rendered;
  bool protected;

  Content({
    required this.rendered,
    required this.protected,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Guid {
  String rendered;

  Guid({
    required this.rendered,
  });

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  List<About> self;
  List<About> collection;
  List<About> about;
  List<Author> author;
  List<Author> replies;
  List<VersionHistory> versionHistory;
  List<Author> wpFeaturedmedia;
  List<About> wpAttachment;
  List<WpTerm> wpTerm;
  List<Cury> curies;

  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.author,
    required this.replies,
    required this.versionHistory,
    required this.wpFeaturedmedia,
    required this.wpAttachment,
    required this.wpTerm,
    required this.curies,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author:
            List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies:
            List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"].map((x) => VersionHistory.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(
            json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm:
            List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "wp:featuredmedia":
            List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment":
            List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
      };
}

class About {
  String href;

  About({
    required this.href,
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Author {
  bool embeddable;
  String href;

  Author({
    required this.embeddable,
    required this.href,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Cury {
  String name;
  String href;
  bool templated;

  Cury({
    required this.name,
    required this.href,
    required this.templated,
  });

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class VersionHistory {
  int count;
  String href;

  VersionHistory({
    required this.count,
    required this.href,
  });

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  String taxonomy;
  bool embeddable;
  String href;

  WpTerm({
    required this.taxonomy,
    required this.embeddable,
    required this.href,
  });

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
      };
}

class Meta {
  String etPbUseBuilder;
  String etPbOldContent;
  String etGbContentWidth;
  List<dynamic> joinchat;

  Meta({
    required this.etPbUseBuilder,
    required this.etPbOldContent,
    required this.etGbContentWidth,
    required this.joinchat,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        etPbUseBuilder: json["_et_pb_use_builder"],
        etPbOldContent: json["_et_pb_old_content"],
        etGbContentWidth: json["_et_gb_content_width"],
        joinchat: List<dynamic>.from(json["_joinchat"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_et_pb_use_builder": etPbUseBuilder,
        "_et_pb_old_content": etPbOldContent,
        "_et_gb_content_width": etGbContentWidth,
        "_joinchat": List<dynamic>.from(joinchat.map((x) => x)),
      };
}
