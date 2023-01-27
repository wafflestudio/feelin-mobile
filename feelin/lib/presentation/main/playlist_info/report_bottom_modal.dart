import 'package:flutter/material.dart';

import '../../style/colors.dart';

class ReportBottomModal extends StatefulWidget{
  const ReportBottomModal({Key? key,}) : super(key: key);

  @override
  State<ReportBottomModal> createState() => _ReportBottomModalState();
}
class _ReportBottomModalState extends State<ReportBottomModal> {
  int currPage = 1;
  String reportType = 'NONE';

  Widget button(String text, String type){
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextButton(onPressed: (){
        setState((){
          reportType = type;
          currPage = 2;
        });

      }, child: Align(alignment: Alignment.centerLeft, child: Text(text, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 16),))),
    );
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14),
        child: Builder(
            builder: (context) {
              if(currPage == 1) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Report Post',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FeelinColorFamily.gray900),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(30, 26),
                            alignment: Alignment.centerRight,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 16, color: FeelinColorFamily.redPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'Are you sure you want to delete the post?',
                        style: TextStyle(fontSize: 14, ),
                      ),
                    ),
                    button('Pretending to be someone else', 'PRETENDER'),
                    button('Spam', 'SPAM'),
                    button('Dislike', 'DISLIKE'),
                    button('Suicidal', 'SUICIDAL'),
                    button('Violent', 'VIOLENT'),
                    button('Illegal', 'ILLEGAL'),
                    button('Sexual', 'SEXUAL'),
                    button('False Information', 'FALSE_INFO'),
                    button('Hate speech or symbols', 'HATE'),
                    button('Bullying or harassment', 'BULLYING'),
                    button('Scam', 'SCAM'),
                    button('Intellectual property violation', 'INTELLECTUAL_PROPERTY_VIOLATION'),
                    button('Other', 'NONE'),
                  ],
                );
              }else{
                return Column(
                  children: [

                  ],
                );
              }
            }
        ),
      ),
    );
  }
}