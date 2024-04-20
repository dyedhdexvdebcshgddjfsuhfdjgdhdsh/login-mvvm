import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child:Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
         Image.asset('assets/svg/images/success.gif',height:300,width:300,fit:BoxFit.cover,) ,
        const Gap(20),
        Text(
          'Login Successfully',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }
}
