

class OrderHistoryModel {
  List<Orders>? orders;

  OrderHistoryModel({this.orders});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? total;
  String? type;
  String? status;
  String? createdAt;

  Orders({this.id, this.total, this.type, this.status, this.createdAt});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['type'] = this.type;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
