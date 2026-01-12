class DataCheck{
  bool ageAbove(DateTime barthDate){
    DateTime now =DateTime.now();
    int age = now.year - barthDate.year;
    if(age >= 18 ){
     return true;
    }else{
     return false;
    }
  }
}