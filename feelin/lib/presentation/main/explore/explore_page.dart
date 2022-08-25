import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget{
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}
class _ExplorePageState extends State<ExplorePage>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: const Center(
        child: Text("first page."),
      ),
    );
  }
}