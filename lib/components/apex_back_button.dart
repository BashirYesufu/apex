import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class ApexBackButton extends StatelessWidget {
  const ApexBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(20.0, 0.0),
      child: Material(
        color: ApexColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: ApexColors.grey,
              width: 2.0,
            )
        ),
        child: MaterialButton(
          onPressed: (){
            Navigator.pop(context);
          },
          minWidth: 50.0,
          height: 50.0,
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}