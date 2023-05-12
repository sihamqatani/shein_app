import 'dart:convert';

Cateogry cateogryFromMap(String str) => Cateogry.fromMap(json.decode(str));

String cateogryToMap(Cateogry data) => json.encode(data.toMap());

class Cateogry {
  List<CateogryItem>? data;
  final bool success;
  int? status;

  Cateogry({
    required this.data,
    required this.success,
    required this.status,
  });

  factory Cateogry.fromMap(Map<String, dynamic> json) => Cateogry(
        data: List<CateogryItem>.from(
            json["data"].map((x) => CateogryItem.fromMap(x))),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "success": success,
        "status": status,
      };
}

class CateogryItem {
  int id;
  String name;
  String banner;
  String icon;
  int numberOfChildren;
  Links links;

  CateogryItem({
    required this.id,
    required this.name,
    required this.banner,
    required this.icon,
    required this.numberOfChildren,
    required this.links,
  });

  factory CateogryItem.fromMap(Map<String, dynamic> json) => CateogryItem(
        id: json["id"],
        name: json["name"],
        banner: json["banner"],
        icon: json["icon"],
        numberOfChildren: json["number_of_children"],
        links: Links.fromMap(json["links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "banner": banner,
        "icon": icon,
        "number_of_children": numberOfChildren,
        "links": links.toMap(),
      };
}

class Links {
  String products;
  String subCategories;

  Links({
    required this.products,
    required this.subCategories,
  });

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        products: json["products"],
        subCategories: json["sub_categories"],
      );

  Map<String, dynamic> toMap() => {
        "products": products,
        "sub_categories": subCategories,
      };
}
