import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  final Function addNewTransaction;


  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime  _selectedDate;

  void _submitData(){

    final enteredTitle = _titleController.text;
    final  enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null){
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime.now()).then((pickedDate) {
         if(pickedDate == null){
           return;
         }
         setState(() {
           _selectedDate = pickedDate;
         });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText:  "Title"),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Row(
                children: [
                  Text( _selectedDate == null ? 'No Date Chosen!' : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  FlatButton(
                    onPressed: _presentDatePicker ,
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold),),)
                ],
              ),
              FlatButton(
                child: Text("Add Transaction"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: _submitData
              )
            ],
          ),
        ),
      ),
    );
  }
}
