import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/block/blocked_user_bloc.dart';

import '../../domain/profile/profile.dart';
import '../style/colors.dart';

class BlockUserItem extends StatefulWidget{

  final int index;
  final Profile profile;

  const BlockUserItem({Key? key, required this.index, required this.profile,}) : super(key: key);

  @override
  State<BlockUserItem> createState() => _BlockUserItemState();
}

class _BlockUserItemState extends State<BlockUserItem> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: widget.profile.profileImage == null ? const AssetImage('assets/images/user_default.png') as ImageProvider : CachedNetworkImageProvider(widget.profile.profileImage!),
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-192,
              child: AutoSizeText(widget.profile.username,
                minFontSize: 11,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width:  110,
              height: 30,
              child: ElevatedButton(
                  onPressed: (){
                    showBlockModal(context);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      )),
                      backgroundColor: MaterialStateProperty.all(FeelinColorFamily.gray400)
                  ),
                  child: const Center(
                    child: Text(
                      'Unblock',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void showBlockModal(context2){
    showModalBottomSheet<void>(
      context: context2,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context2) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Unblock User',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FeelinColorFamily.gray900),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(30, 26),
                      alignment: Alignment.centerRight,
                    ),
                    onPressed: () => Navigator.of(context2).pop(),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: FeelinColorFamily.redPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'Are you sure you want to unblock this user?',
                    style: TextStyle(fontSize: 14, ),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: (){
                    context.read<BlockedUserBloc>().add(BlockedUserEvent.unblockRequest(widget.index));
                    Navigator.pop(context2);
                  },
                  child: Text(
                    'Unblock',
                    style: TextStyle(fontSize: 16, color: FeelinColorFamily.errorDark),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}