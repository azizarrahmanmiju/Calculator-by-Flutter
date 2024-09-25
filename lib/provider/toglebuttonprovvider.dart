import 'package:calcullator/data/buttontext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleButtonProvider extends StateNotifier<String> {
  ToggleButtonProvider() : super("");

  String firstOperand = "";
  String operator = "";
  String secondOperand = "";

 
  

  // Method to handle button clicks and manage the calculation process
  void toggleButtonClick(String value) {

  /////
  bool isoporate (value){
    return [btn.plus,btn.minus,btn.multiply,btn.devide].contains(value);
  }
////==================

    if(btn.clr.contains(value)){
        firstOperand = "";
        secondOperand = "";
        operator = "";
    }else if(btn.delete.contains(value)){
       delete(value);
    }else if(isoporate(value)){
      if(operator.isNotEmpty || operator.contains(value)){
        calcullatedata();
        operator =value;
        state = firstOperand + operator + secondOperand;

      }else{
        operator = value;
      }
    }else if(btn.per.contains(value)){
         ///
    }else if(btn.equal.contains(value)){
      calcullatedata();   
    }else{
       valuecontrol(value);
    }


 state = firstOperand + operator + secondOperand;

 
    


    }
   

  ///delete functionality
    void delete(value) {
  if (secondOperand.isNotEmpty) {
    secondOperand = secondOperand.substring(0, secondOperand.length - 1);  // Update secondOperand
  } else if (operator.isNotEmpty) {
    operator = "";  // Clear the operator if it exists
  } else if (firstOperand.isNotEmpty) {
    firstOperand = firstOperand.substring(0, firstOperand.length - 1);  // Update firstOperand
  }
  
  // Update the state after deletion
  _updateDisplay();
}
//delet 

    // value controler
    
    void valuecontrol (value){
       if(operator.isEmpty){
      firstOperand += value;
       }else{
        secondOperand +=value;
       }


    }///valuecontrol

    void calcullatedata(){

     double? num1 = double.tryParse(firstOperand); 
     double? num2 = double.tryParse(secondOperand);
     double result=0;

      switch(operator){
        case btn.plus: result = num1! + num2!;
        break;
        case btn.minus: result = num1! - num2!;
        break;
        case btn.multiply: result = num1! * num2!;
        break;
        case btn.devide: result = num1! / num2!;
        break;
       
      }
      firstOperand = result.toString();
      secondOperand = "";
      operator= "";
      _updateDisplay();
      
    }

    void _updateDisplay() {
    if (operator.isEmpty) {
      state = firstOperand;
    } else {
      state = "$firstOperand $operator $secondOperand";
    }
  }

    

    




 
    
 ///from chat gpt


    /*
    if (btn.btnvalues.contains(value)) {
      // If value is a number or decimal
      if (isNumeric(value) || value == btn.dot) {
        if (operator.isEmpty) {
          // Building first operand
          firstOperand += value;
        } else {
          // Building second operand
          secondOperand += value;
        }
        _updateDisplay();
      }

      // Handle operator clicks (+, -, *, /)
      else if (isOperator(value)) {
        if (firstOperand.isNotEmpty && secondOperand.isEmpty) {
          operator = value;
        } else if (firstOperand.isNotEmpty && secondOperand.isNotEmpty) {
          // If operator and two operands are already present, calculate intermediate result
          calculate();
          operator = value;
        }
        _updateDisplay();
      }

      // Handle equal button click
      else if (value == btn.equal && firstOperand.isNotEmpty && secondOperand.isNotEmpty) {
        calculate();
      }

      // Handle clear (Cl)
      else if (value == btn.clr) {
        clear();
      }

      // Handle delete (D)
      else if (value == btn.delete) {
        delete();
      }
    }
  }

  // Method to check if the value is numeric
  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }

  // Method to check if the value is an operator
  bool isOperator(String value) {
    return [btn.plus, btn.minus, btn.multiply, btn.devide].contains(value);
  }

  // Method to perform the calculation based on the operator
  void calculate() {
    double num1 = double.tryParse(firstOperand) ?? 0;
    double num2 = double.tryParse(secondOperand) ?? 0;
    double result = 0;

    switch (operator) {
      case btn.plus:
        result = num1 + num2;
        break;
      case btn.minus:
        result = num1 - num2;
        break;
      case btn.multiply:
        result = num1 * num2;
        break;
      case btn.devide:
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          state = "Error";
          return;
        }
        break;
    }

    firstOperand = result.toString();
    secondOperand = "";
    operator = "";
    _updateDisplay();
  }

  // Method to update the display with the current input or result
  void _updateDisplay() {
    if (operator.isEmpty) {
      state = firstOperand;
    } else {
      state = "$firstOperand $operator $secondOperand";
    }
  }

  // Method to clear the calculator
  void clear() {
    firstOperand = "";
    secondOperand = "";
    operator = "";
    state = "0";
  }

  // Method to delete the last input
  void delete() {
    if (secondOperand.isNotEmpty) {
      secondOperand = secondOperand.substring(0, secondOperand.length - 1);
    } else if (operator.isNotEmpty) {
      operator = "";
    } else if (firstOperand.isNotEmpty) {
      firstOperand = firstOperand.substring(0, firstOperand.length - 1);
    }
    _updateDisplay();
  }
  */
  }

  


// Create a provider for the ToggleButtonProvider
final toggleButtonProvider = StateNotifierProvider<ToggleButtonProvider, String>(
  (ref) => ToggleButtonProvider(),
);
