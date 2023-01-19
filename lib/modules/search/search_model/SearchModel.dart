class SearchModel {
  BasicInfo? basicInfo;
  List<Address>? address;
  List<Phones>? phones;
  int? totalOrders;
  String? totalSales;

  SearchModel(
      {this.basicInfo,
        this.address,
        this.phones,
        this.totalOrders,
        this.totalSales});

  SearchModel.fromJson(Map<String, dynamic> json) {
    basicInfo = json['basicInfo'] != null
        ? new BasicInfo.fromJson(json['basicInfo'])
        : null;
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(new Address.fromJson(v));
      });
    }
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(new Phones.fromJson(v));
      });
    }
    totalOrders = json['totalOrders'];
    totalSales = json['totalSales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.basicInfo != null) {
      data['basicInfo'] = this.basicInfo!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.map((v) => v.toJson()).toList();
    }
    if (this.phones != null) {
      data['phones'] = this.phones!.map((v) => v.toJson()).toList();
    }
    data['totalOrders'] = this.totalOrders;
    data['totalSales'] = this.totalSales;
    return data;
  }
}

class BasicInfo {
  int? id;
  String? name;
  String? notes;
  String? internalNotes;
  String? createdAt;
  String? updatedAt;

  BasicInfo(
      {this.id,
        this.name,
        this.notes,
        this.internalNotes,
        this.createdAt,
        this.updatedAt});

  BasicInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    notes = json['notes'];
    internalNotes = json['internal_notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['notes'] = this.notes;
    data['internal_notes'] = this.internalNotes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Address {
  int? id;
  String? address;
  int? area;
  String? building;
  String? floor;
  String? apartment;
  int? cost;

  Address(
      {this.id,
        this.address,
        this.area,
        this.building,
        this.floor,
        this.apartment,
        this.cost});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    area = json['area'];
    building = json['building'];
    floor = json['floor'];
    apartment = json['apartment'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['area'] = this.area;
    data['building'] = this.building;
    data['floor'] = this.floor;
    data['apartment'] = this.apartment;
    data['cost'] = this.cost;
    return data;
  }
}

class Phones {
  int? id;
  String? phoneNumber;

  Phones({this.id, this.phoneNumber});

  Phones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
