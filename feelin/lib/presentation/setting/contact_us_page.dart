import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget{
  const ContactUsPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new),),
        title: const Text('Contact Us',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('You can contact us via email.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                final url =  Uri(
                  scheme: 'mailto',
                  path: 'feelinshared@gmail.com',
                  query: 'subject=[Feelin\' ${packageInfo.version}]',
                );
                if (await canLaunchUrl(url)) {
                launchUrl(url,);
                }
              },
              child: const Text('feelinshared@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 40,),
            const Text('or Twitter',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: () async {
                final url = Uri.parse('https://twitter.com/feelin_music');
                if (await canLaunchUrl(url)) {
                  launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              child: const Text('@feelin_music',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}