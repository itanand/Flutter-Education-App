import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  Razorpay _razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState(){
    super.initState();

    _razorpay = new Razorpay();  

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }
  @override
  void dispose(){
    super.dispose();
    _razorpay.clear();
  }
 void openCheckout(){
    var options = {
      "key" : "rzp_test_k14uRI2vbLEsZQ",
      "amount" : num.parse(textEditingController.text)*100,
      "name" : "Med-Educational",
      "description" : "Hello guys, this is Anand Mohan.",
      "prefill" : {
        "contact" : "7004238112",
        "email" : "anand1505mohan@gmail.com"
      },
      "external" : {
        "wallets" : ["paytm"]
      }
    };

    try{
      _razorpay.open(options);

    }catch(e){
      print(e.toString());
    }

  }

  void handlerPaymentSuccess(){
    print("Pament success");
    Toast.show("Payment success", context);
  }

  void handlerErrorFailure(){
    print("Pament error");
    Toast.show("Payment error", context);
  }

  void handlerExternalWallet(){
    print("External Wallet");
    Toast.show("External Wallet", context);
  }
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Gateway"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "amount to pay"
              ),
            ),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.blue,
              child: Text("Checkout Now", style: TextStyle(
                color: Colors.white
              ),
             ),
              onPressed: (){
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}