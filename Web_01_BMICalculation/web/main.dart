import 'dart:html';

void main() {

  NumberInputElement weight_input=querySelector("#weight");
  NumberInputElement height_input=querySelector("#height");
  SubmitButtonInputElement submit=querySelector("#submit");
  double bmiResult;
  submit.onClick.listen((MouseEvent e){
    var weight=int.parse(weight_input.value);
    var height=int.parse(height_input.value);
    bmiResult=BodyMassIndex(weight,height);
    querySelector("#output").text=bmiResult.toString();
    querySelector("#BMI_Category").text=BMICategory(bmiResult);
  });
  //we use this type also
  /*submit.onClick.listen((_){
    var weight=int.parse(weight_input.value);
    var height=int.parse(height_input.value);
    bmiResult=BodyMassIndex(weight,height);
    querySelector("#output").text=bmiResult.toString();
    querySelector("#BMI_Category").text=BMICategory(bmiResult);
  });*/

}
double BodyMassIndex(num weight,num height){
  var bmi=weight*10000/(height*height);
  return (bmi*10).round()/10;
}
String BMICategory(num bmi){
  SpanElement bmiCategory =querySelector("#BMI_Category");
  if(bmi<15){
    bmiCategory.style.color="#00BFFF";
    return "Very severely underweight";
  }else if(bmi>=15 && bmi<16){
    bmiCategory.style.color="#1E90FF";
    return "Severely underweight";
  }else if(bmi>=16 && bmi<18){
    bmiCategory.style.color="#0000FF";
    return "Underweight";
  }else if(bmi>=18 && bmi<25){
    bmiCategory.style.color="#00FF00";
    return "Normal (healthy weight)";
  }else if(bmi>=25 && bmi<30){
    bmiCategory.style.color="#FF7F50";
    return "Overweight";
  }else if(bmi>=30 && bmi<35){
    bmiCategory.style.color="#FF6347";
    return "Moderately obese";
  }else if(bmi>=35 && bmi<40){
    bmiCategory.style.color="#FF4500";
    return "Severely obese";
  }else{
    bmiCategory.style.color="#FF0000";
    return "Very severely obese";
  }
}