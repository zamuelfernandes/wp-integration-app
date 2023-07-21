// To parse this JSON data, do
//
//     final authorModel = authorModelFromJson(jsonString);

import 'dart:convert';

AuthorModel authorModelFromJson(String str) =>
    AuthorModel.fromJson(json.decode(str));

String authorModelToJson(AuthorModel data) => json.encode(data.toJson());

class AuthorModel {
  int? id;
  String? name;
  String? url;
  String? description;
  String? link;
  String? slug;
  Map<String, String>? avatarUrls;
  Meta? meta;
  bool? isSuperAdmin;
  WoocommerceMeta? woocommerceMeta;
  Links? links;

  AuthorModel({
    this.id,
    this.name,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.meta,
    this.isSuperAdmin,
    this.woocommerceMeta,
    this.links,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        slug: json["slug"],
        avatarUrls: Map.from(json["avatar_urls"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        isSuperAdmin: json["is_super_admin"],
        woocommerceMeta: json["woocommerce_meta"] == null
            ? null
            : WoocommerceMeta.fromJson(json["woocommerce_meta"]),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "description": description,
        "link": link,
        "slug": slug,
        "avatar_urls": Map.from(avatarUrls!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "meta": meta?.toJson(),
        "is_super_admin": isSuperAdmin,
        "woocommerce_meta": woocommerceMeta?.toJson(),
        "_links": links?.toJson(),
      };
}

class Links {
  List<Collection>? self;
  List<Collection>? collection;

  Links({
    this.self,
    this.collection,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? []
            : List<Collection>.from(
                json["self"]!.map((x) => Collection.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<Collection>.from(
                json["collection"]!.map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
      };
}

class Collection {
  String? href;

  Collection({
    this.href,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Meta {
  bool? webStoriesTrackingOptin;
  bool? webStoriesMediaOptimization;
  WebStoriesOnboarding? webStoriesOnboarding;

  Meta({
    this.webStoriesTrackingOptin,
    this.webStoriesMediaOptimization,
    this.webStoriesOnboarding,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        webStoriesTrackingOptin: json["web_stories_tracking_optin"],
        webStoriesMediaOptimization: json["web_stories_media_optimization"],
        webStoriesOnboarding: json["web_stories_onboarding"] == null
            ? null
            : WebStoriesOnboarding.fromJson(json["web_stories_onboarding"]),
      );

  Map<String, dynamic> toJson() => {
        "web_stories_tracking_optin": webStoriesTrackingOptin,
        "web_stories_media_optimization": webStoriesMediaOptimization,
        "web_stories_onboarding": webStoriesOnboarding?.toJson(),
      };
}

class WebStoriesOnboarding {
  bool? addBackgroundMedia;
  bool? addLinks;
  bool? cropElementsWithShapes;
  bool? cropSelectedElements;
  bool? embedWebStories;
  bool? enableSwipe;
  bool? previewStory;
  bool? safeZone;

  WebStoriesOnboarding({
    this.addBackgroundMedia,
    this.addLinks,
    this.cropElementsWithShapes,
    this.cropSelectedElements,
    this.embedWebStories,
    this.enableSwipe,
    this.previewStory,
    this.safeZone,
  });

  factory WebStoriesOnboarding.fromJson(Map<String, dynamic> json) =>
      WebStoriesOnboarding(
        addBackgroundMedia: json["addBackgroundMedia"],
        addLinks: json["addLinks"],
        cropElementsWithShapes: json["cropElementsWithShapes"],
        cropSelectedElements: json["cropSelectedElements"],
        embedWebStories: json["embedWebStories"],
        enableSwipe: json["enableSwipe"],
        previewStory: json["previewStory"],
        safeZone: json["safeZone"],
      );

  Map<String, dynamic> toJson() => {
        "addBackgroundMedia": addBackgroundMedia,
        "addLinks": addLinks,
        "cropElementsWithShapes": cropElementsWithShapes,
        "cropSelectedElements": cropSelectedElements,
        "embedWebStories": embedWebStories,
        "enableSwipe": enableSwipe,
        "previewStory": previewStory,
        "safeZone": safeZone,
      };
}

class WoocommerceMeta {
  String? variableProductTourShown;
  String? activityPanelInboxLastRead;
  String? activityPanelReviewsLastRead;
  String? categoriesReportColumns;
  String? couponsReportColumns;
  String? customersReportColumns;
  String? ordersReportColumns;
  String? productsReportColumns;
  String? revenueReportColumns;
  String? taxesReportColumns;
  String? variationsReportColumns;
  String? dashboardSections;
  String? dashboardChartType;
  String? dashboardChartInterval;
  String? dashboardLeaderboardRows;
  String? homepageLayout;
  String? homepageStats;
  String? taskListTrackedStartedTasks;
  String? helpPanelHighlightShown;
  String? androidAppBannerDismissed;

  WoocommerceMeta({
    this.variableProductTourShown,
    this.activityPanelInboxLastRead,
    this.activityPanelReviewsLastRead,
    this.categoriesReportColumns,
    this.couponsReportColumns,
    this.customersReportColumns,
    this.ordersReportColumns,
    this.productsReportColumns,
    this.revenueReportColumns,
    this.taxesReportColumns,
    this.variationsReportColumns,
    this.dashboardSections,
    this.dashboardChartType,
    this.dashboardChartInterval,
    this.dashboardLeaderboardRows,
    this.homepageLayout,
    this.homepageStats,
    this.taskListTrackedStartedTasks,
    this.helpPanelHighlightShown,
    this.androidAppBannerDismissed,
  });

  factory WoocommerceMeta.fromJson(Map<String, dynamic> json) =>
      WoocommerceMeta(
        variableProductTourShown: json["variable_product_tour_shown"],
        activityPanelInboxLastRead: json["activity_panel_inbox_last_read"],
        activityPanelReviewsLastRead: json["activity_panel_reviews_last_read"],
        categoriesReportColumns: json["categories_report_columns"],
        couponsReportColumns: json["coupons_report_columns"],
        customersReportColumns: json["customers_report_columns"],
        ordersReportColumns: json["orders_report_columns"],
        productsReportColumns: json["products_report_columns"],
        revenueReportColumns: json["revenue_report_columns"],
        taxesReportColumns: json["taxes_report_columns"],
        variationsReportColumns: json["variations_report_columns"],
        dashboardSections: json["dashboard_sections"],
        dashboardChartType: json["dashboard_chart_type"],
        dashboardChartInterval: json["dashboard_chart_interval"],
        dashboardLeaderboardRows: json["dashboard_leaderboard_rows"],
        homepageLayout: json["homepage_layout"],
        homepageStats: json["homepage_stats"],
        taskListTrackedStartedTasks: json["task_list_tracked_started_tasks"],
        helpPanelHighlightShown: json["help_panel_highlight_shown"],
        androidAppBannerDismissed: json["android_app_banner_dismissed"],
      );

  Map<String, dynamic> toJson() => {
        "variable_product_tour_shown": variableProductTourShown,
        "activity_panel_inbox_last_read": activityPanelInboxLastRead,
        "activity_panel_reviews_last_read": activityPanelReviewsLastRead,
        "categories_report_columns": categoriesReportColumns,
        "coupons_report_columns": couponsReportColumns,
        "customers_report_columns": customersReportColumns,
        "orders_report_columns": ordersReportColumns,
        "products_report_columns": productsReportColumns,
        "revenue_report_columns": revenueReportColumns,
        "taxes_report_columns": taxesReportColumns,
        "variations_report_columns": variationsReportColumns,
        "dashboard_sections": dashboardSections,
        "dashboard_chart_type": dashboardChartType,
        "dashboard_chart_interval": dashboardChartInterval,
        "dashboard_leaderboard_rows": dashboardLeaderboardRows,
        "homepage_layout": homepageLayout,
        "homepage_stats": homepageStats,
        "task_list_tracked_started_tasks": taskListTrackedStartedTasks,
        "help_panel_highlight_shown": helpPanelHighlightShown,
        "android_app_banner_dismissed": androidAppBannerDismissed,
      };
}
