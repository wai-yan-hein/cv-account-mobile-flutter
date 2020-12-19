
class Customer{
  final String traderName;
  final double drAmt;
  final double crAmt;
  Customer({this.traderName, this.drAmt, this.crAmt});
  factory Customer.fromJson(Map<String,dynamic> parse){
    return Customer(
      traderName: parse["traderName"],
      drAmt: parse["drAmt"],
      crAmt: parse["crAmt"]
    );
  }
  Map<String,dynamic> toJson(Customer customer){
    return <String,dynamic>{
      "traderName" : customer.traderName,
      "drAmt" : customer.drAmt,
      "crAmt" : customer.crAmt
    };
  }
}