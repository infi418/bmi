import 'package:share_plus/share_plus.dart';
import 'package:bmi/Components/RoundIcon_Button.dart';
import 'package:bmi/Screens/input_page.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/Reusable_Bg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:screenshot/screenshot.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

  var SharePlus;

  ResultPage(
      {required this.textColor,
      required this.resultText,
      required this.bmi,
      required this.advise});

  _launchURLApp() async {
    Uri url = Uri.parse('https://en.wikipedia.org/wiki/Body_mass_index');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) => Screenshot(
        controller: _screenshotController,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Text('BMI CALCULATOR',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                )),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Screenshot(
              //   controller: _screenshotController,
              Expanded(
                flex: 5,
                child: ReusableBg(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmi,
                        style: kBMITextStyle,
                      ),
                      Text(
                        'Normal BMI range:',
                        style: klabelTextStyle,
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: kBodyTextStyle,
                      ),
                      Text(
                        advise,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: _launchURLApp,
                            constraints: BoxConstraints.tightFor(
                              width: 200.0,
                              height: 56.0,
                            ),
                            fillColor: Colors.blue,
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              'Find Details',
                              style: kBodyTextStyle,
                            ),
                          ),
                          SizedBox(width: 15.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(10)),
                            child: const Icon(
                              Icons.share,
                              size: 30,
                            ),
                            onPressed: () =>
                                SharePlus.share('$resultText\n$bmi\n$advise'),
                          ),
                          SizedBox(width: 15.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(10)),
                            child: const Icon(
                              Icons.restore,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InputPage()));
                            },
                          )
                        ],
                      ),

                      // Container(
                      //   width: 10.0,
                      //   height: 60.0,
                      //   child: ElevatedButton(
                      //       child: Text('RE-CALCULATE'),
                      //       style: ButtonStyle(
                      //           shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(10.0)))),
                      //       onPressed: () {
                      //         Navigator.push(context,
                      //             MaterialPageRoute(builder: (context) => InputPage()));
                      //       }),
                      //)
                    ],
                  ),
                ),
              ),
            ],
          ),
          //   void takescreenshot() async {
          //   final image = await screenshotController.capture();
          //   Share.share(image?.path);
          // }
        ),
        // void takescreenshot() async {
        //   final image = await _screenshotController.capture();
        //   var imageFile;
        //   Share.shareFiles([imageFile.path]);
        // }
      );
  void _takescreenshot() async {
    final image = await _screenshotController.capture();
    var imageFile;
    Share.shareFiles([imageFile.path]);
  }
}
