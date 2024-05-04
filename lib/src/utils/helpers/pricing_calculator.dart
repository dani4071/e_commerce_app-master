
class danPricingCalculator {

  /// -- calculate price based on tax and shipping
  static double calculateTotalPrice(double subTotal, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = subTotal + taxAmount + shippingCost;
    return totalPrice;
  }


  /// -- calculate shipping cost
  static String calculateShippingCost(double subTotal, String location) {
    double shippingCost = getShippingCost(location);
    // double taxAmount = subTotal * taxRate;
    return shippingCost.toStringAsFixed(2);
  }


  /// --calculate tax
  static String calculateTax(double subTotal, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // lookup the tax rate for the given location from a taax rate database or API
    // return the appropriate tax
    return 0.10; // example tax rate of 10%
  }

  static double getShippingCost(String location) {
    // lookup the shipping cost for the given location from a using a shipping rate API
    // return the appropriate tax
    return 5.00;
  }

  /// -- sum all cart values and return total amount

}