class Post {
  String? name;
  String? image;
  int? price;
  String? address;
  String? id;

  Post({this.name, this.image, this.price, this.address, this.id});

  Post.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    address = json['address'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['address'] = this.address;
    data['id'] = this.id;
    return data;
  }
}
