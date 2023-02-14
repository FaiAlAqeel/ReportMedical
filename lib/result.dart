import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String rename,
      region,
      city,
      email,
      phone,
      fraudin,
      fraudincident,
      date,
      providerName;

  Result({
    Key? key,
    required this.rename,
    required this.region,
    required this.city,
    required this.email,
    required this.phone,
    required this.fraudin,
    required this.date,
    required this.providerName,
    required this.fraudincident,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reslut'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reporter Name: $rename'),
            Text('Region: $region'),
            Text('City: $city'),
            Text('Phone: $phone'),
            Text('Email: $email'),
            Text('Fraud Incident Date: $date'),
            Text('Medical Provider Name: $providerName'),
            Text('Fraud Incident Responsible Name: $fraudin'),
            Text('Fraud Incident Details: $fraudincident'),
          ],
        ),
      ),
    );
  }
}
