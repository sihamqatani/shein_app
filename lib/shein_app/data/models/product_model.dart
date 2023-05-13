// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'dart:convert';

ProductModel productModelFromMap(String str) =>
    ProductModel.fromMap(json.decode(str));

String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
  List<ProductItem>? data;
  ProductModelLinks? links;
  Meta? meta;
  bool? success;
  int? status;

  ProductModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        data: json["data"] == null
            ? []
            : List<ProductItem>.from(
                json["data"]!.map((x) => ProductItem.fromMap(x))),
        links: json["links"] == null
            ? null
            : ProductModelLinks.fromMap(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "links": links?.toMap(),
        "meta": meta?.toMap(),
        "success": success,
        "status": status,
      };
}

class ProductItem {
  int? id;
  String? name;
  String? thumbnailImage;
  bool? hasDiscount;
  String? discountType;
  String? discount;
  String? strokedPrice;
  String? mainPrice;
  int? rating;
  int? sales;
  int? currentStock;
  bool? inStock;
  DatumLinks? links;

  ProductItem({
    this.id,
    this.name,
    this.thumbnailImage,
    this.hasDiscount,
    this.discountType,
    this.discount,
    this.strokedPrice,
    this.mainPrice,
    this.rating,
    this.sales,
    this.currentStock,
    this.inStock,
    this.links,
  });

  factory ProductItem.fromMap(Map<String, dynamic> json) => ProductItem(
        id: json["id"],
        name: json["name"],
        thumbnailImage: json["thumbnail_image"],
        hasDiscount: json["has_discount"],
        discountType: json["discount_type"],
        discount: json["discount"],
        strokedPrice: json["stroked_price"],
        mainPrice: json["main_price"],
        rating: json["rating"],
        sales: json["sales"],
        currentStock: json["current_stock"],
        inStock: json["in_stock"],
        links: json["links"] == null ? null : DatumLinks.fromMap(json["links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "thumbnail_image": thumbnailImage,
        "has_discount": hasDiscount,
        "discount_type": discountType,
        "discount": discount,
        "stroked_price": strokedPrice,
        "main_price": mainPrice,
        "rating": rating,
        "sales": sales,
        "current_stock": currentStock,
        "in_stock": inStock,
        "links": links?.toMap(),
      };
}

class DatumLinks {
  String? details;

  DatumLinks({
    this.details,
  });

  factory DatumLinks.fromMap(Map<String, dynamic> json) => DatumLinks(
        details: json["details"],
      );

  Map<String, dynamic> toMap() => {
        "details": details,
      };
}

class ProductModelLinks {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  ProductModelLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory ProductModelLinks.fromMap(Map<String, dynamic> json) =>
      ProductModelLinks(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toMap() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toMap())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
