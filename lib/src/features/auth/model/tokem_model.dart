class TokenModel {
  String? access_token;
  String? refresh_token;
  String? scope;
  String? token_type;
  int? expires_in;
  int? code;
  String? message;
  String? detailedMessage;

  TokenModel(
      {this.access_token,
      this.refresh_token,
      this.scope,
      this.token_type,
      this.expires_in,
      this.code,
      this.message,
      this.detailedMessage});

  TokenModel.fromJson(Map<String, dynamic> json) {
    access_token = json['access_token'];
    refresh_token = json['refresh_token'];
    scope = json['scope'];
    token_type = json['token_type'];
    expires_in = json['expires_in'];
    code = json['code'];
    message = json['message'];
    detailedMessage = json['detailedMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = access_token;
    data['refresh_token'] = refresh_token;
    data['scope'] = scope;
    data['token_type'] = token_type;
    data['expires_in'] = expires_in;
    data['code'] = code;
    data['message'] = message;
    data['detailedMessage'] = detailedMessage;
    return data;
  }
}
