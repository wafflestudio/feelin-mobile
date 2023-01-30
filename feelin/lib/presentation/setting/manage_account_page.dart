import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth/auth_bloc.dart';
import '../style/colors.dart';

class ManageAccountPage extends StatelessWidget{
  const ManageAccountPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new),),
        title: const Text('Manage Account',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text('Account'),
            button(string: 'Delete Account', function: (){
              showModalBottomSheet<void>(
                context: context,
                useRootNavigator: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delete Account',
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
                                style: TextStyle(fontSize: 16, color: FeelinColorFamily.gray600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              'If you delete the account, you cannot recover it again. Are you sure you want to delete it?',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14, ),
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: (){
                              context.read<AuthBloc>().add(const AuthEvent.deleteAccount());
                              Navigator.of(context).popUntil((route) => route.isFirst);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: FeelinColorFamily.gray50,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              width: 180,
                              height: 40,
                              child: Center(
                                child: Text(
                                  'Delete Account',
                                  style: TextStyle(fontSize: 16, color: FeelinColorFamily.redPrimary),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }, color: FeelinColorFamily.redPrimary),
          ],
        ),
      ),
    );
  }

  Widget text(String string){
    return Text(
      string,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black, letterSpacing: -0.41),
    );
  }

  Widget button({required String string, required Function function, Color? color,}){
    return TextButton(
      onPressed: ()=>function(),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            string,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.41,
              color: color ?? Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}