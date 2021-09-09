import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkshortner/views/result.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;


class RandomImage extends StatelessWidget {
  final int random;
  RandomImage({this.random});

  @override
  Widget build(BuildContext context) {
    if(random == 0){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/1.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/1.png', width: 25.h, height: 25.h,));
    }if(random == 1){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/1.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/2.png', width: 25.h, height: 25.h,));
    }if(random == 2){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/2.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/3.png', width: 25.h, height: 25.h,));
    }if(random == 3){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/3.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/4.png', width: 25.h, height: 25.h,));
    }if(random == 4){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/4.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/5.png', width: 30.h, height: 30.h,));
    }if(random == 5){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/1.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/1.png', width: 25.h, height: 25.h,));
    }if(random == 6){
      return Lottie.asset('assets/home/7.json',);    }
  }
}
class RandomLoad extends StatelessWidget {
  final int random;
  RandomLoad({this.random});

  @override
  Widget build(BuildContext context) {
    if(random == 0){
      return Lottie.asset('assets/loading/1.json',
        repeat: true,
        reverse: false,
        animate: true,);
    }
    if(random == 1){
      return Lottie.asset('assets/loading/2.json',
        repeat: true,
        reverse: false,
        animate: true,);
    }
    if(random == 2){
      return Lottie.asset('assets/loading/3.json',
        repeat: true,
        reverse: false,
        animate: true,);
  }if(random == 3){
      return Lottie.asset('assets/loading/4l.json',
        repeat: true,
        reverse: false,
        animate: true,);
  }
 }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

int _random = 0;
bool _isLoading = false;
int _randomLoad = 0;
var info;

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var rng = new Random();
    setState(() {
      _random = rng.nextInt(7);
      print(_random);
    });
  }
  final TextEditingController controller = TextEditingController(text: 'https://');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  sendRequest() async{
    if(formKey.currentState.validate()){

      var rng = new Random();
      setState(() {
        _randomLoad = rng.nextInt(4);
        print(_randomLoad);
      });

      setState(() {
        _isLoading = true;
      });
      print('https://api.shrtco.de/v2/shorten?url=${controller.text}');
      var req = await http.get(Uri.parse('https://api.shrtco.de/v2/shorten?url=${controller.text}'));
      setState(() {
        info = json.decode(req.body);
        print(info);
        _isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => Result(info: info,)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepPurpleAccent,
        ),
      ),
      body: _isLoading ? SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RandomLoad(random: _randomLoad,),
            Center(child: CircularProgressIndicator(color: Colors.white,),),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Generating your link...',
                style: GoogleFonts.poppins(
                  color: Colors.white
                ),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ) : Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Let's shorten your links",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp
                  ),
                ),
              ),
            ),
            RandomImage(random: _random),
            Container(
              height: MediaQuery.of(context).size.width/1.65,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Paste link here',
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurpleAccent),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextFormField(
                        style: GoogleFonts.poppins(),
                        controller: controller,
                        validator: (value) {
                          return Uri.parse(value).isAbsolute ? null : 'Please enter a valid url or add https:// at start';
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'https://...',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                          )
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => sendRequest(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepPurpleAccent[200],
                            Colors.deepPurpleAccent[400],
                            Colors.deepPurpleAccent[700]
                          ]
                        )
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Short Link',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Powered by ',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),GestureDetector(
                  onTap: () => launch('https://shrtco.de/docs/'),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'shrtco.de',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => launch('https://rishiahuja.github.io/my-portfolio'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        'Developed by ',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        'Rishi',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
