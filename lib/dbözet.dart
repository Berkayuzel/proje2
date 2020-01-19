class Ozet{
  int id;
  int miktar;
  String neden;
  Ozet(this.miktar,this.neden,this.id);

  Map<String, dynamic>toMap(){
    var map =<String, dynamic>{
      'id' : id,
      'miktar': miktar,
      'neden' : neden,
    };
    return map;
  }
  Ozet.fromMap(Map<String, dynamic>map){
    id = map['id'];
    miktar = map['miktar'];
    neden = map['neden'];

  }
}
