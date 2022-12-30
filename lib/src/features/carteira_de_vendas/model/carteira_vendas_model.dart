class CarteiraVendasModel {
  String? zV0NUMTRA;
  String? zV0FDD1;
  String? zV0FDD2;
  String? zV0MOD1;
  String? zV0MOD2;
  String? zV0BCODES;
  String? zV0SITCAR;
  String? zV0STATUS;
  String? zV0TPVEN;
  String? zV0LOJA;
  String? zV0NRPROC;
  String? zV0NPED1;
  String? zV0NPED2;
  String? zV0NOME;
  String? zV0DATMOV;
  int? zV0VALMOV;
  String? zV0CODCLI;
  String? zV0BANCO;
  String? zV0XPEDID;
  String? zV0FILIAL;
  String? zV0CODVEN;
  String? zV0NOMVEN;
  String? zV0OBS;
  String? zV0HIST;

  CarteiraVendasModel(
      {this.zV0NUMTRA,
      this.zV0FDD1,
      this.zV0FDD2,
      this.zV0MOD1,
      this.zV0MOD2,
      this.zV0BCODES,
      this.zV0SITCAR,
      this.zV0STATUS,
      this.zV0TPVEN,
      this.zV0LOJA,
      this.zV0NRPROC,
      this.zV0NPED1,
      this.zV0NPED2,
      this.zV0NOME,
      this.zV0DATMOV,
      this.zV0VALMOV,
      this.zV0CODCLI,
      this.zV0BANCO,
      this.zV0XPEDID,
      this.zV0FILIAL,
      this.zV0CODVEN,
      this.zV0NOMVEN,
      this.zV0OBS,
      this.zV0HIST});

  CarteiraVendasModel.fromJson(Map<String, dynamic> json) {
    zV0NUMTRA = json['ZV0_NUMTRA'];
    zV0FDD1 = json['ZV0_FDD1'];
    zV0FDD2 = json['ZV0_FDD2'];
    zV0MOD1 = json['ZV0_MOD1'];
    zV0MOD2 = json['ZV0_MOD2'];
    zV0BCODES = json['ZV0_BCODES'];
    zV0SITCAR = json['ZV0_SITCAR'];
    zV0STATUS = json['ZV0_STATUS'];
    zV0TPVEN = json['ZV0_TPVEN'];
    zV0LOJA = json['ZV0_LOJA'];
    zV0NRPROC = json['ZV0_NRPROC'];
    zV0NPED1 = json['ZV0_NPED1'];
    zV0NPED2 = json['ZV0_NPED2'];
    zV0NOME = json['ZV0_NOME'];
    zV0DATMOV = json['ZV0_DATMOV'];
    zV0VALMOV = json['ZV0_VALMOV'];
    zV0CODCLI = json['ZV0_CODCLI'];
    zV0BANCO = json['ZV0_BANCO'];
    zV0XPEDID = json['ZV0_XPEDID'];
    zV0FILIAL = json['ZV0_FILIAL'];
    zV0CODVEN = json['ZV0_CODVEN'];
    zV0NOMVEN = json['ZV0_NOMVEN'];
    zV0OBS = json['ZV0_OBS'];
    zV0HIST = json['ZV0_HIST'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ZV0_NUMTRA'] = zV0NUMTRA;
    data['ZV0_FDD1'] = zV0FDD1;
    data['ZV0_FDD2'] = zV0FDD2;
    data['ZV0_MOD1'] = zV0MOD1;
    data['ZV0_MOD2'] = zV0MOD2;
    data['ZV0_BCODES'] = zV0BCODES;
    data['ZV0_SITCAR'] = zV0SITCAR;
    data['ZV0_STATUS'] = zV0STATUS;
    data['ZV0_TPVEN'] = zV0TPVEN;
    data['ZV0_LOJA'] = zV0LOJA;
    data['ZV0_NRPROC'] = zV0NRPROC;
    data['ZV0_NPED1'] = zV0NPED1;
    data['ZV0_NPED2'] = zV0NPED2;
    data['ZV0_NOME'] = zV0NOME;
    data['ZV0_DATMOV'] = zV0DATMOV;
    data['ZV0_VALMOV'] = zV0VALMOV;
    data['ZV0_CODCLI'] = zV0CODCLI;
    data['ZV0_BANCO'] = zV0BANCO;
    data['ZV0_XPEDID'] = zV0XPEDID;
    data['ZV0_FILIAL'] = zV0FILIAL;
    data['ZV0_CODVEN'] = zV0CODVEN;
    data['ZV0_NOMVEN'] = zV0NOMVEN;
    data['ZV0_OBS'] = zV0OBS;
    data['ZV0_HIST'] = zV0HIST;
    return data;
  }
}
