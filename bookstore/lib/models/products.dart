import 'dart:convert';

class BookModel {
  static List<Item>? items;
  //Item(id:"Book 1", name:"Book 1 Name", desc:"Book1 Description", price : 125, color:"#000000", image:""
  // );
  // ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

  Item copywith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(id ?? this.id, name ?? this.name, desc ?? this.desc,
        price ?? this.price, color ?? this.color, image ?? this.image);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'],
      map['name'],
      map['desc'],
      map['price'],
      map['color'],
      map['image'],
    );
  }
  String tojson() => json.encode(toMap());
  factory Item.fromjson(String Source) => Item.fromMap(json.decode(Source));
  @override
  String toString() {
    return 'Item(id:$id,name:$name,desc:$desc,price:$price,color:$color,image:$image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
