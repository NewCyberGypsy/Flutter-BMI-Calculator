import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 70.0;
const activeCardColour = Color(0xFF1D1E33);
const inActiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;

  // 1 = male
  // 2 - female
  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inActiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inActiveCardColour;
      } else {
        maleCardColour = inActiveCardColour;
      }
    } else {
      if (femaleCardColour == inActiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inActiveCardColour;
      } else {
        femaleCardColour = inActiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Male card was pressed");
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Female card was pressed");
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: inActiveCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: inActiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: inActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
