import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seva_app/utilities/constants.dart';
import 'package:seva_app/utilities/dummy_satsangi.dart';
import 'package:seva_app/models/satsangi.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class NewPayment extends StatefulWidget {
  static const String id = 'payment_screen';

  @override
  _NewPaymentState createState() => _NewPaymentState();
}

class _NewPaymentState extends State<NewPayment> {
  final _yogdanModeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  GlobalKey<AutoCompleteTextFieldState<Satsangi>> key = new GlobalKey();
  AutoCompleteTextField searchTextField;

  void _submitData() {
    print(_yogdanModeController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                paymnetSizeBoxSpace,
                Center(
                  child: Text(
                    "Seva Name",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                paymnetSizeBoxSpace,
                searchTextField = AutoCompleteTextField<Satsangi>(
                    //TODO: try making it a new class or method
                    decoration: kTextFieldDecorationWithIcon.copyWith(
                      hintText: "Search Satsangi by name or phone number.",
                      prefixIcon: Icon(Icons.search),
                    ),
                    itemSubmitted: (item) {
                      setState(() {
                        //searchTextField.textField.controller.text = '';
                        _nameController.text = item.Name;
                        _phoneController.text = item.phoneNumber;
                      });
                    },
                    clearOnSubmit: true,
                    key: key,
                    suggestions: DUMMY_SATSANGI,
                    itemBuilder: (context, item) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.Name,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              item.phoneNumber,
                            )
                          ],
                        ),
                      );
                    },
                    itemSorter: (a, b) {
                      return a.Name.compareTo(b.Name);
                    },
                    itemFilter: (item, query) {
                      return item.Name.toLowerCase()
                              .contains(query.toLowerCase())
                          ? true
                          : item.phoneNumber.contains(query.toLowerCase());
                    }),
                paymnetSizeBoxSpace,
                TextFormField(
                  controller: _nameController,
                  readOnly: true,
                  decoration: kTextFieldDecorationWithIcon.copyWith(
                    filled: true,
                    icon: const Icon(Icons.person),
                  ),
                ),
                paymnetSizeBoxSpace,
                TextFormField(
                  controller: _phoneController,
                  readOnly: true,
                  decoration: kTextFieldDecorationWithIcon.copyWith(
                    filled: true,
                    icon: const Icon(Icons.phone),
                  ),
                ),
                paymnetSizeBoxSpace,
                TextFormField(
                  readOnly: false,
                  keyboardType: TextInputType.number,
                  decoration: kTextFieldDecorationWithIcon.copyWith(
                      filled: true,
                      labelText: 'Sankalp',
                      helperText: "Enter Sankalp Amount",
                      suffixText: 'Rs.'),
                ),
                paymnetSizeBoxSpace,
                TextFormField(
                  readOnly: true,
                  controller: _yogdanModeController,
                  decoration: kTextFieldDecorationWithIcon.copyWith(
                      filled: true,
                      labelText: 'Yogdan Mode',
                      hintText: "Select Yogdan Mode",
                      suffixIcon: PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          _yogdanModeController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return yogdanMode
                              .map<PopupMenuItem<String>>((String value) {
                            return PopupMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList();
                        },
                      )),
                ),
                paymnetSizeBoxSpace,
                TextFormField(
                  readOnly: false,
                  keyboardType: TextInputType.number,
                  decoration: kTextFieldDecorationWithIcon.copyWith(
                      filled: false,
                      labelText: 'Yogdan',
                      hintText: "Enter Yogdan Amount",
                      suffixText: 'Rs.'),
                ),
                paymnetSizeBoxSpace,
                TextFormField(
                  readOnly: false,
                  keyboardType: TextInputType.multiline,
                  decoration: kTextFieldDecorationWithIcon.copyWith(
                      filled: false,
                      labelText: 'Payment Details',
                      hintText:
                          'Enter Transaction Id or any other payment details.',
                      helperText: "Enter Payment Details"),
                  maxLines: 3,
                  //TODO: Need to check how to exit from text box in this case.
                ),
                paymnetSizeBoxSpace,
                RaisedButton(
                  child: Text('Accept'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: _submitData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
