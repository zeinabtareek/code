class UserModel {
  String? token;
  int? expiresIn;
  String? name;
  String? email;
  String? type;
  Null? phone;
  List<String>? permissions;
  int? branchId;
  int? hasSeatNumbers;
  String? branch;
  int? shiftID;
  String? shiftNumber;
  Twilio? twilio;
  String? loyaltyToken;

  UserModel(
      {this.token,
        this.name,
        this.email,
        this.expiresIn,
        this.type,
        this.phone,
        this.permissions,
        this.branchId,
        this.hasSeatNumbers,
        this.branch,
        this.shiftID,
        this.shiftNumber,
        this.twilio,
        this.loyaltyToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresIn = json['expires_in'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
    phone = json['phone'];
    permissions = json['permissions'].cast<String>();
    branchId = json['branch_id'];
    hasSeatNumbers = json['hasSeatNumbers'];
    branch = json['branch'];
    shiftID = json['shiftID'];
    shiftNumber = json['shiftNumber'];
    twilio =
    json['twilio'] != null ? new Twilio.fromJson(json['twilio']) : null;
    loyaltyToken = json['loyalty_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expires_in'] = this.expiresIn;
    data['name'] = this.name;
    data['email'] = this.email;
    data['type'] = this.type;
    data['phone'] = this.phone;
    data['permissions'] = this.permissions;
    data['branch_id'] = this.branchId;
    data['hasSeatNumbers'] = this.hasSeatNumbers;
    data['branch'] = this.branch;
    data['shiftID'] = this.shiftID;
    data['shiftNumber'] = this.shiftNumber;
    if (this.twilio != null) {
      data['twilio'] = this.twilio!.toJson();
    }
    data['loyalty_token'] = this.loyaltyToken;
    return data;
  }
}

class Twilio {
  String? twilioToken;
  String? twilioSid;

  Twilio({this.twilioToken, this.twilioSid});

  Twilio.fromJson(Map<String, dynamic> json) {
    twilioToken = json['twilio_token'];
    twilioSid = json['twilio_sid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['twilio_token'] = this.twilioToken;
    data['twilio_sid'] = this.twilioSid;
    return data;
  }
}
