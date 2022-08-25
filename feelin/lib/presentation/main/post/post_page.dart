
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget{
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}
class _PostPageState extends State<PostPage>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: const Text("second page."),
      ),
    );
  }
}