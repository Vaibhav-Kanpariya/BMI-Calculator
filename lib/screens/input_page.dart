
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Icon_Content.dart';
import '../components/Reusable_Card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_iconbutton.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kactiveCardColour : kinactiveCardColor,
                  cardChild: iconContent(icon: FontAwesomeIcons.mars,lable: 'MALE',),
                ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female ? kactiveCardColour : kinactiveCardColor,
                cardChild: iconContent(icon: FontAwesomeIcons.venus,lable: 'FEMALE',),
              ),
              ),
            ],
          ),
          ),
          Expanded(child: ReusableCard(
            colour: kactiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('HEIGHT',
                  style: klableTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: klableTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8DE98),
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    thumbColor: Color(0xFFEB1555),
                  ),

                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('WEIGHT',
                  style: klableTextStyle,),
                  Text(
                    weight.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.minus,
                      onpressed: (){
                        setState(() {
                          weight--;
                        });
                      },
                      ),
                      SizedBox(width: 8.0,),
                      RoundIconButton(icon: FontAwesomeIcons.plus,
                        onpressed: (){
                        setState(() {
                          weight++;
                        });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ),
              ),
              Expanded(child: ReusableCard(
                colour: kactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE',
                    style: klableTextStyle,
                    ),
                    Text(age.toString(),
                    style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onpressed: (){
                          setState(() {
                            age--;
                          });
                        },
                        ),
                        SizedBox(width: 8.0,),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onpressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),

                  ],
                ),

              ),
              ),
            ],
          ),
          ),
          BottomButton(buttontitle: 'CALCULATE', ontap: (){

            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);



            Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ))
            );
          },),
        ],
      ),
    );
  }
}









