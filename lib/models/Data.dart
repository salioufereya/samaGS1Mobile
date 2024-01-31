
class Data {
  User? user;
  String? token;

  Data({this.user, this.token});
  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = user!.toJson();
    data['token'] = token;
    return data;
  }
}

class Ecole {
  int? id;
  String? libelle;
  String? datecreation;
  String? adresse;
  String? typeecole;
  String? logo;
  String? numerobureau;
  String? numeroautorisation;
  String? email;
  String? numeropersonnel;

  Ecole({this.id, this.libelle, this.datecreation, this.adresse, this.typeecole, this.logo, this.numerobureau, this.numeroautorisation, this.email, this.numeropersonnel});

  Ecole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    datecreation = json['date_creation'];
    adresse = json['adresse'];
    typeecole = json['type_ecole'];
    logo = json['logo'];
    numerobureau = json['numero_bureau'];
    numeroautorisation = json['numero_autorisation'];
    email = json['email'];
    numeropersonnel = json['numero_personnel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['libelle'] = libelle;
    data['date_creation'] = datecreation;
    data['adresse'] = adresse;
    data['type_ecole'] = typeecole;
    data['logo'] = logo;
    data['numero_bureau'] = numerobureau;
    data['numero_autorisation'] = numeroautorisation;
    data['email'] = email;
    data['numero_personnel'] = numeropersonnel;
    return data;
  }
}

class Root {
  int? code;
  String? message;
  Data? data;

  Root({this.code, this.message, this.data});

  Root.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
  //  data['data'] = data!.toJson();
    return data;
  }
}

class User {
  int? id;
  String? civilite;
  String? nom;
  String? prenom;
  String? email;
  String? telephone;
  String? photo;
  String? adresse;
  String? role;
  Ecole? ecole;
  int? ecoleid;

  User({this.id, this.civilite, this.nom, this.prenom, this.email, this.telephone, this.photo, this.adresse, this.role, this.ecole, this.ecoleid});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    civilite = json['civilite'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    telephone = json['telephone'];
    photo = json['photo'];
    adresse = json['adresse'];
    role = json['role'];
    ecole = json['ecole'] != null ? Ecole?.fromJson(json['ecole']) : null;
    ecoleid = json['ecole_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['civilite'] = civilite;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['email'] = email;
    data['telephone'] = telephone;
    data['photo'] = photo;
    data['adresse'] = adresse;
    data['role'] = role;
    data['ecole'] = ecole!.toJson();
    data['ecole_id'] = ecoleid;
    return data;
  }
}
