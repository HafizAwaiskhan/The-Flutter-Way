class TipCalculatorLogic {
  double billAmount = 0.0;
  double tipPercentage = 0.0;

  double calculateTipAmount() {
    return (billAmount * tipPercentage) / 100;
  }

  double calculateTotalAmount() {
    return billAmount + calculateTipAmount();
  }
}
