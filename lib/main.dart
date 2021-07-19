import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: calciapp(),
    ));

class calciapp extends StatefulWidget {
  const calciapp({Key? key}) : super(key: key);

  @override
  _calciappState createState() => _calciappState();
}

class _calciappState extends State<calciapp> {
  int tipper = 0;
  int persons = 1;
  double billamt = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.orange[100],
        child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10.5),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.brown[900],
                  borderRadius: BorderRadius.horizontal(),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "TOTAL PER PERSON",
                        style: TextStyle(
                          color: Colors.orange[50],
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                          "\$ ${calculateTotalPerPerson(tipper, billamt, persons)}",
                          style: TextStyle(
                              color: Colors.orange[50],
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0))
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.brown,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.horizontal()),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.brown),
                      decoration: InputDecoration(
                          prefixText: " Bill Amount",
                          prefixIcon: Icon(Icons.attach_money)),
                      onChanged: (String value) {
                        try {
                          billamt = double.parse(value);
                        } catch (exception) {
                          billamt = 0.0;
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: Colors.orange[100],
                          ),
                          child: Center(
                            child: Text("BillSplitter",
                                style: TextStyle(
                                    color: Colors.brown[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              persons--;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 50,
                            margin: EdgeInsets.all(02.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.0),
                                color: Colors.orange[100]),
                            child: Center(
                              child: Text("-",
                                  style: TextStyle(
                                      color: Colors.brown[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0)),
                            ),
                          ),
                        ),
                        Text(
                          "$persons",
                          style: TextStyle(
                              color: Colors.brown[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                persons++;
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 50,
                              margin: EdgeInsets.all(02.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.0),
                                  color: Colors.orange[100]),
                              child: Center(
                                child: Text("+",
                                    style: TextStyle(
                                        color: Colors.brown[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0)),
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Tip",
                            style: TextStyle(
                                color: Colors.brown[90],
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "\$ ${calculateTotalTip(billamt, persons, tipper)}"),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "$tipper%",
                          style: TextStyle(
                              color: Colors.brown[90],
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Slider(
                            min: 0,
                            max: 100,
                            activeColor: Colors.orange,
                            inactiveColor: Colors.brown[90],
                            divisions: 10,
                            value: tipper.toDouble(),
                            onChanged: (double newvalue) {
                              setState(() {
                                tipper = newvalue.round();
                              });
                            })
                      ],
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }

  calculateTotalPerPerson(int totalTip, double billAmount, int splitBy) {
    var totalPerPerson = (totalTip + billAmount) / splitBy;
    return totalPerPerson = (totalTip + billAmount);
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totaltip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totaltip = (billAmount * tipPercentage) / 100;
    }
    return totaltip;
  }
}
