import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core_account/model/vr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  bool isSearching = false;
  List filteredCustomer = [];
  List customers = [];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('cv-account')
        .snapshots(includeMetadataChanges: true);
    Stream documentStream = FirebaseFirestore.instance
        .collection('cv-account')
        .doc('cus-balance')
        .snapshots();

    return Scaffold(
        appBar: AppBar(
          title: !isSearching
              ? Text('Customer / Supplier Balance')
              : TextField(
            onChanged: (value) {
              _filterCountries(value);
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "Search Name Here",
                hintStyle: TextStyle(color: Colors.white)),
          ),
          actions: <Widget>[
            isSearching
                ? IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  this.isSearching = false;
                  filteredCustomer = customers;
                });
              },
            )
                : IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  this.isSearching = true;
                });
              },
            )
          ],
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: documentStream,
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> document) {
            if (document.hasError) {
              return Text("Check Your Internet Connection.");
            }
            if (document.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (document.hasData) {
              log("Received...");
            }
            if(!isSearching){
              customers = filteredCustomer = document.data.data().values.toList();
            }
            return ListView.builder(
                itemCount:filteredCustomer.isNotEmpty? filteredCustomer.length : 0,
                itemBuilder: (BuildContext context, int index) =>
                    buildCustomerCard(filteredCustomer[index]["traderName"],
                        filteredCustomer[index]["crAmt"] + filteredCustomer[index]["drAmt"]));
          },
        ));

  }
  void _filterCountries(value) {
    setState(() {
      filteredCustomer = customers
          .where((country) =>
          country['traderName'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
  Widget buildCustomerCard(String name, double balance) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(
                  children: [
                    Text(
                      name,
                      style:  GoogleFonts.padauk(
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                      ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                child: Row(
                  children: [
                    Text('Last updated - '),
                    Text(DateTime.now().toString()),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      "MMK - ${balance.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 30),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_right),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}


