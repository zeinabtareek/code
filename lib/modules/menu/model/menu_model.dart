class MenuModel {
  String? serviceFee;
  List<Category>? category;
  List<Items>? items;
  List<Addons>? addons;
  List<Areas>? areas;
  List<Branches>? branches;
  List<Classifications>? classifications;

  MenuModel(
      {this.serviceFee,
        this.category,
        this.items,
        this.addons,
        this.areas,
        this.branches,
        this.classifications});

  MenuModel.fromJson(Map<String, dynamic> json) {
    serviceFee = json['service_fee'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    if (json['addons'] != null) {
      addons = <Addons>[];
      json['addons'].forEach((v) {
        addons!.add(new Addons.fromJson(v));
      });
    }
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(new Branches.fromJson(v));
      });
    }
    if (json['classifications'] != null) {
      classifications = <Classifications>[];
      json['classifications'].forEach((v) {
        classifications!.add(new Classifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_fee'] = this.serviceFee;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.addons != null) {
      data['addons'] = this.addons!.map((v) => v.toJson()).toList();
    }
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    if (this.branches != null) {
      data['branches'] = this.branches!.map((v) => v.toJson()).toList();
    }
    if (this.classifications != null) {
      data['classifications'] =
          this.classifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? photo;

  Category({this.id, this.title, this.photo});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['photo'] = this.photo;
    return data;
  }
}

class Items {
  int? id;
  String? title;
  String? price;
  int? category;
  List<Ingrediants>? ingrediants;
  String? photo;
  String? readyByDefault;
  String? createdAt;
  String? updatedAt;
  int? active;
  int? hasQuantity;

  Items(
      {this.id,
        this.title,
        this.price,
        this.category,
        this.ingrediants,
        this.photo,
        this.readyByDefault,
        this.createdAt,
        this.updatedAt,
        this.active,
        this.hasQuantity});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    if (json['ingrediants'] != null) {
      ingrediants = <Ingrediants>[];
      json['ingrediants'].forEach((v) {
        ingrediants!.add(new Ingrediants.fromJson(v));
      });
    }
    photo = json['photo'];
    readyByDefault = json['ready_by_default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
    hasQuantity = json['has_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['category'] = this.category;
    if (this.ingrediants != null) {
      data['ingrediants'] = this.ingrediants!.map((v) => v.toJson()).toList();
    }
    data['photo'] = this.photo;
    data['ready_by_default'] = this.readyByDefault;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active'] = this.active;
    data['has_quantity'] = this.hasQuantity;
    return data;
  }
}

class Ingrediants {
  String? id;
  String? quantity;

  Ingrediants({this.id, this.quantity});

  Ingrediants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    return data;
  }
}

class Addons {
  int? id;
  String? title;
  Null? group;

  Addons({this.id, this.title, this.group});

  Addons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['group'] = this.group;
    return data;
  }
}

class Areas {
  int? id;
  String? areaName;
  int? cost;
  int? branch;
  String? createdAt;
  String? updatedAt;

  Areas(
      {this.id,
        this.areaName,
        this.cost,
        this.branch,
        this.createdAt,
        this.updatedAt});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaName = json['area_name'];
    cost = json['cost'];
    branch = json['branch'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['area_name'] = this.areaName;
    data['cost'] = this.cost;
    data['branch'] = this.branch;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Branches {
  int? id;
  String? title;
  String? address;
  int? hasSeats;
  int? reservationCapacity;
  String? arabicTitle;

  Branches(
      {this.id,
        this.title,
        this.address,
        this.hasSeats,
        this.reservationCapacity,
        this.arabicTitle});

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    hasSeats = json['has_seats'];
    reservationCapacity = json['reservationCapacity'];
    arabicTitle = json['arabic_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['address'] = this.address;
    data['has_seats'] = this.hasSeats;
    data['reservationCapacity'] = this.reservationCapacity;
    data['arabic_title'] = this.arabicTitle;
    return data;
  }
}

class Classifications {
  int? id;
  String? title;

  Classifications({this.id, this.title});

  Classifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
