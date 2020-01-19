class Calculate{
int para;
int miktar;
double _para=0.0;

  Calculate(this.para, this.miktar);

  String calculatePara(){
   _para= (para + miktar) as double;
  }
}