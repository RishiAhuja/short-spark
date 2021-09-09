import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkshortner/views/home.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
class Result extends StatefulWidget {
  final info;
  Result({@required this.info});
  @override
  _ResultState createState() => _ResultState();
}
bool _isOK = true;
class _ResultState extends State<Result> {
  @override
  void initState() {
    if(widget.info['ok'] == false){
      setState(() {
        _isOK = false;
      });
    }
    // TODO: implement initState
    super.initState();
  }
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.deepPurpleAccent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepPurpleAccent,
        ),
      ),
      body: _isOK ? Container(
        child: ListView(
          children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/extra/success.json',
                  width: 100,
                  height: 100,
                  repeat: false,
                  animate: true
                ),
                Text(
                  'Decreased ${widget.info['result']['original_link'].toString().length - widget.info['result']['short_link'].toString().length} characters',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.sp
                  ),
                )
              ],
            ),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        'Link 1',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                              '${widget.info['result']['short_link']}',
                            style: GoogleFonts.poppins(
                              fontSize: 17.sp,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async{
                                  await Clipboard.setData(ClipboardData(text: widget.info['result']['short_link'].toString()));
                                  key.currentState.showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: [
                                            Lottie.asset(
                                                'assets/extra/copied.json',
                                              animate: true,
                                              repeat: false,
                                              width: 40,
                                              height: 40
                                            ),
                                            const SizedBox(width: 20,),
                                            Text(
                                              'Copied to clipboard',
                                              style: GoogleFonts.poppins(

                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  );
                                },
                                  child: const Icon(Icons.copy, color: Colors.black, size: 30,)
                              ),
                              const SizedBox(width: 14),
                              GestureDetector(
                                onTap: () => launch(widget.info['result']['full_short_link'].toString()),
                                  child: const Icon(Icons.open_in_browser, color: Colors.black,  size: 30,)
                              ),
                              const SizedBox(width: 14),
                              GestureDetector(
                                onTap: () => Share.share('${widget.info['result']['full_short_link']}'),
                                  child: const Icon(Icons.share, color: Colors.black,  size: 30,)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        'Link 2',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                              '${widget.info['result']['short_link2']}',
                            style: GoogleFonts.poppins(
                              fontSize: 17.sp,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async{
                                  await Clipboard.setData(ClipboardData(text: widget.info['result']['short_link2'].toString()));
                                  key.currentState.showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: [
                                            Lottie.asset(
                                                'assets/extra/copied.json',
                                              animate: true,
                                              repeat: false,
                                              width: 40,
                                              height: 40
                                            ),
                                            const SizedBox(width: 20,),
                                            Text(
                                              'Copied to clipboard',
                                              style: GoogleFonts.poppins(

                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  );
                                },
                                  child: const Icon(Icons.copy, color: Colors.black, size: 30,)
                              ),
                              const SizedBox(width: 14),
                              GestureDetector(
                                onTap: () => launch(widget.info['result']['full_short_link2'].toString()),
                                  child: const Icon(Icons.open_in_browser, color: Colors.black,  size: 30,)
                              ),
                              const SizedBox(width: 14),
                              GestureDetector(
                                onTap: () => Share.share('${widget.info['result']['full_short_link2']}'),
                                  child: const Icon(Icons.share, color: Colors.black,  size: 30,)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        'Link 3',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                              '${widget.info['result']['short_link3']}',
                            style: GoogleFonts.poppins(
                              fontSize: 17.sp,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async{
                                  await Clipboard.setData(ClipboardData(text: widget.info['result']['short_link3'].toString()));
                                  key.currentState.showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: [
                                            Lottie.asset(
                                                'assets/extra/copied.json',
                                              animate: true,
                                              repeat: false,
                                              width: 40,
                                              height: 40
                                            ),
                                            const SizedBox(width: 20,),
                                            Text(
                                              'Copied to clipboard',
                                              style: GoogleFonts.poppins(

                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  );
                                },
                                  child: const Icon(Icons.copy, color: Colors.black, size: 30,)
                              ),
                              const SizedBox(width: 14),
                              GestureDetector(
                                onTap: () => launch(widget.info['result']['full_short_link3'].toString()),
                                  child: const Icon(Icons.open_in_browser, color: Colors.black,  size: 30,)
                              ),
                              const SizedBox(width: 14),
                              GestureDetector(
                                onTap: () => Share.share('${widget.info['result']['full_short_link3']}'),
                                  child: const Icon(Icons.share, color: Colors.black,  size: 30,)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ) : Container(
        child: ListView(
          children: [
            Lottie.asset(
              'assets/extra/error.json',
              repeat: true,
              animate: true
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: Text(
                'Oops! An error occured! Please try again.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: Text(
                '${widget.info['error']}',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  color: Colors.red[200]
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple[600],
                      Colors.deepPurple[700],
                      Colors.deepPurple[800],
                    ]
                  )
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Go to Home screen',
                    style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
