import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/profile/profile_bloc.dart';

import '../../style/colors.dart';

class ReportBottomModalDescription extends StatefulWidget{
  final String reportType;
  const ReportBottomModalDescription({Key? key, required this.reportType}) : super(key: key);

  @override
  State<ReportBottomModalDescription> createState() => _ReportBottomModalDescriptionState();
}
class _ReportBottomModalDescriptionState extends State<ReportBottomModalDescription> {

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14),
        child: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14 + MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Report User',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: TextField(
                            controller: textEditingController,
                            maxLength: 200,
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: (){
                            context.read<ProfileBloc>().add(ProfileEvent.reportRequest(widget.reportType, textEditingController.text.isEmpty ? ' ' : textEditingController.text));
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Report',
                            style: TextStyle(fontSize: 16, color: FeelinColorFamily.errorDark),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}