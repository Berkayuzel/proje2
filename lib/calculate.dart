class Calculate{
  int miktar;
  int ilkmiktar;
  int curmiktar;
  Calculate(this.miktar,this.ilkmiktar,this.curmiktar);
  Map<String, dynamic> toMap(){
    var map =<String, dynamic>{
      'miktar' : miktar,
      'ilk miktar': ilkmiktar,
      'curmiktar' : curmiktar,
    };
    return map;
  }
  Calculate.fromMap(Map<String,dynamic> map){
    var _curmiktar = ilkmiktar+miktar;
  }
}
