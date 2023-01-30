import 'package:flutter/material.dart';

import '../../style/colors.dart';

class ReportResultBottomModal extends StatefulWidget{

  final String username;
  final Function function;

  const ReportResultBottomModal({Key? key, required this.username, required this.function}) : super(key: key);

  @override
  State<ReportResultBottomModal> createState() => _ReportResultBottomModalState();
}
class _ReportResultBottomModalState extends State<ReportResultBottomModal> {


  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14),
        height: 220,
        child: Builder(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Thanks for letting us know.',
                        style: TextStyle(fontSize: 18,),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                        widget.function();
                      },
                      child: SizedBox(
                        child: Text(
                          'Block ${widget.username}',
                          style: TextStyle(fontSize: 16, color: FeelinColorFamily.errorDark),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}