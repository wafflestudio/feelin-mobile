
import 'package:flutter/material.dart';

class PlaylistInfoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
        leading: IconButton(
          onPressed: (){}, //TODO: implement to go back
          color: Colors.grey,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        child: listView(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy_outlined),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: ''
          ),
        ],
      ),
    );

  }

  var titleList = [
    'Wannabe',
    'Dalla Dalla',
    'Icy',
    'Not shy',
    'Wannabe',
    'Dalla Dalla',
    'Icy',
    'Not shy',
    'Wannabe',
    'Dalla Dalla',
    'Icy',
    'Not shy',
  ];

  var imageList = [
    'https://image.bugsm.co.kr/album/images/original/203110/20311029.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/202290/20229007.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/202683/20268357.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/203438/20343816.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/203110/20311029.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/202290/20229007.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/202683/20268357.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/203438/20343816.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/203110/20311029.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/202290/20229007.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/202683/20268357.jpg?version=undefined',
    'https://image.bugsm.co.kr/album/images/original/203438/20343816.jpg?version=undefined',
  ];

  var artistList = [
    'ITZY',
    'ITZY',
    'ITZY',
    'ITZY',
    'ITZY',
    'ITZY',
    'ITZY',
    'ITZY',
    'ITZY',
    'ITZY',
    'ITZY',
    'ITZY',
  ];

  var username = '김와플';
  var playlistName = '있지 타이틀곡 모음';
  var playTime = '43';
  var coverImage = 'https://image.bugsm.co.kr/album/images/original/202290/20229007.jpg?version=undefined';
  var profileImage = 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG';
  var content = 'ITZY의 타이틀곡 모음입니다. \nITZY의 타이틀곡 모음입니다.';

  Widget listView(){

    final ScrollController scrollController = ScrollController();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              child: _playlistCover(),
            ),
            Container(
              width: double.infinity,
              height: 1.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 1.0),
                      colors: <Color>[
                        Color(0xff00C19C),
                        Color(0xff7077D5),
                      ],
                      stops: <double>[0.0,1.0],
                      tileMode: TileMode.clamp
                  )
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Scrollbar(
                  controller: scrollController,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: titleList.length,
                      itemBuilder: (context, index){
                      return Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Image(
                              image: NetworkImage(imageList[index]),
                            width: 45,
                            height: 45,),
                            _itemText(index),
                          ],
                        ),
                      );
                      }),
                ),
              ),
            ),

          ],
        );
      }
    );
  }

  Widget _itemText(int index){
    return Container(
      width: 100,
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleList[index],
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
          ),
          Text(artistList[index],
          style: const TextStyle(fontSize: 12, color: Color(0xff7077D5)),),
        ],
      ),
    );
  }

  Widget _playlistCover(){
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                    image: NetworkImage(coverImage),
                width: 130,
                height: 130,),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image: NetworkImage(profileImage),
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(username),
                        ],
                      ),
                      Text(
                          playlistName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.music_note,
                          color: Color(0xff00C19C),),
                          Text('${titleList.length}곡',
                          style: const TextStyle(
                            color: Color(0xff00C19C),
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                          ),),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.access_time,
                          color:  Color(0xff00C19C),),
                          Text('$playTime분',
                          style: const TextStyle(
                            color: Color(0xff00C19C),
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                          ),)
                        ],
                      ),
                      Container(
                        height: 20,
                        child: ElevatedButton.icon(
                            onPressed: (){},
                            label: const Text('공유하기'),
                            icon: const Icon(Icons.ios_share,
                            size: 18,),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              foregroundColor: MaterialStateProperty.all(Colors.grey),
                              elevation: MaterialStateProperty.all(0.0)
                            ),),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(content,
              style: const TextStyle(
                fontSize: 13
              ),)),
          _storeButton(),
        ],
      ),
    );
  }

  Widget _storeButton() {
    return Container(
        width: double.infinity,
        height: 30,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                colors: <Color>[
                  Color(0xff00C19C),
                  Color(0xff7077D5),
                ],
                stops: <double>[0.0,1.0],
                tileMode: TileMode.clamp
            )
        ),
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.all(2),
          child: OutlinedButton(
              onPressed: () {}//TODO: implement to store playlist.
              ,
              child: const Text("내 계정에 플레이리스트 저장",),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(const ContinuousRectangleBorder()),
                  foregroundColor: MaterialStateProperty.resolveWith((states){
                    if(states.contains(MaterialState.pressed)){
                      return Colors.white;
                    }
                    return Colors.white;
                  }),
                  textStyle: MaterialStateProperty.resolveWith((states){
                    if(states.contains(MaterialState.pressed)){
                      return const TextStyle(
                          color: Colors.white,
                          fontSize: 13.5);
                    }
                    return const TextStyle(
                        color: Colors.white,
                        fontSize: 13.5);
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states){
                    if(states.contains(MaterialState.pressed)){
                      return Colors.transparent;
                    }
                    return Colors.transparent;
                  }))
          ),
        ));
  }
}