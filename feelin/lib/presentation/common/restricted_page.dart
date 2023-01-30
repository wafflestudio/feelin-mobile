import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

class RestrictedPage extends StatelessWidget{

  const RestrictedPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new),),
        title: const Text(' ',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('You have blocked this user \nor have been blocked by this user.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: FeelinColorFamily.gray600
          ),
        ),
      ),
    );
  }
}