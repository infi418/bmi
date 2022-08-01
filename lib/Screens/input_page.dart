import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/Icon_Content.dart';
import '../Components/Reusable_Bg.dart';
import '../constants.dart';
import 'Results_Page.dart';
import 'package:wheel_slider/wheel_slider.dart';
import '../calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

//ENUMERATION : The action of establishing number of something , implicit way
enum Gender {
  male,
  female,
  trans,
}

class _InputPageState extends State<InputPage> {
  //by default male will be selected

  late Gender selectedGender = Gender.male;
  // int height = 180;
  ValueNotifier<int> height = ValueNotifier(180);
  int weight = 10;
  int age = 20;

  final int _nTotalCount = 200;
  final int _nInitValue = 10;
  int _nCurrentValue = 10;

  final int _nTC = 200;
  final int _nIV = 10;
  int _nCV = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: selectedGender == Gender.male
                                  ? kactiveCardColor
                                  : kinactiveCardColor,
                              width: 5),
                          color: kinactiveCardColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                offset: const Offset(-5, 0),
                                spreadRadius: 2,
                                blurRadius: 10.0),
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                offset: const Offset(0, 5),
                                spreadRadius: 2,
                                blurRadius: 10),
                          ],
                        ),
                        child: IconContent(
                          myicon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.trans;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: selectedGender == Gender.trans
                                  ? kactiveCardColor
                                  : kinactiveCardColor,
                              width: 5),
                          color: kinactiveCardColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.1),
                              offset: const Offset(-5, 0),
                              spreadRadius: 2,
                              blurRadius: 10.0,
                            ),
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                offset: const Offset(0, 5),
                                spreadRadius: 2,
                                blurRadius: 10),
                          ],
                        ),
                        child: IconContent(
                          myicon: FontAwesomeIcons.marsAndVenus,
                          text: 'TRANS',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: selectedGender == Gender.female
                                  ? kactiveCardColor
                                  : kinactiveCardColor,
                              width: 5),
                          color: kinactiveCardColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                offset: const Offset(-5, 0),
                                spreadRadius: 2,
                                blurRadius: 10.0),
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                offset: const Offset(0, 5),
                                spreadRadius: 2,
                                blurRadius: 10),
                          ],
                        ),
                        child: IconContent(
                          myicon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableBg(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: height,
                          builder: (BuildContext context, dynamic value,
                              Widget? child) {
                            return Text(
                              value.toString(),
                              style: kDigitTextStyle,
                            );
                          },
                        ),
                        const Text(
                          'cm',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                    ValueListenableBuilder(
                      valueListenable: height,
                      builder:
                          (BuildContext context, int value, Widget? child) {
                        return SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.grey,
                            inactiveTrackColor: ksliderInactiveColor,
                            thumbColor: const Color(0xFFEB1555),
                            overlayColor: const Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 35.0),
                          ),
                          child: Slider(
                            value: value.toDouble(),
                            min: 120,
                            max: 300,
                            onChanged: (double newValue) {
                              height.value = newValue.round();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableBg(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: klabelTextStyle,
                          ),
                          WheelSlider.number(
                            perspective: 0.01,
                            totalCount: _nTotalCount,
                            initValue: _nInitValue,
                            unSelectedNumberStyle: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black54,
                            ),
                            currentIndex: _nCurrentValue,
                            selectedNumberStyle: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            onValueChanged: (val) {
                              setState(() {
                                _nCurrentValue = weight = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableBg(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: klabelTextStyle,
                          ),
                          WheelSlider.number(
                            perspective: 0.01,
                            totalCount: _nTC,
                            initValue: _nIV,
                            unSelectedNumberStyle: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black54,
                            ),
                            currentIndex: _nCV,
                            selectedNumberStyle: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            onValueChanged: (v) {
                              setState(() {
                                _nCV = age = v;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60.0,
                width: 10.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
                  onPressed: () {
                    Calculate calc =
                        Calculate(height: height.value, weight: weight);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmi: calc.result(),
                          resultText: calc.getText(),
                          advise: calc.getAdvise(),
                          textColor: calc.getTextColor(),
                        ),
                      ),
                    );
                  },
                  child: const Text('CALCULATE'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
