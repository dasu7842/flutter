import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main()
{
  runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,));
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text("Support Application"),backgroundColor:Colors.blue ,
        actions:
        [
          IconButton(onPressed: ()
          {

            _makecall("7201878872");
          }, icon:Icon(Icons.call)),
          IconButton(onPressed: ()
          {
            _sendingSMS();
          }, icon:Icon(Icons.sms)),

        ],
      ),
    );
  }

  void _makecall(String number)async
  {
    var url = Uri.parse("tel:$number");
    if (await canLaunchUrl(url))
    {
      await launchUrl(url);
    }
    else
    {
      throw 'Could not launch $url';
    }

  }

  void _sendingSMS() async
  {
    var url = Uri.parse("sms:7201878872");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else
    {
      throw 'Could not launch $url';
    }
  }

  String? encodeQueryParameters(Map<String, String> params)
  {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}

