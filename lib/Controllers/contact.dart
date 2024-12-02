class Contact {
  int? id;
  String? name;
  // String? notes;
  // int? price;
  // String? cat;
  // , this.notes,this.price, this.cat
  Contact({this.id, this.name});

  Contact.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['name'];
    // this.notes = obj['notes'];
    // this.price = obj['price'];
    // this.cat = obj['cat'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name
      // 'notes': notes,
      // 'price': price,
      // 'cat':cat,
    };

    return map;
  }
}
