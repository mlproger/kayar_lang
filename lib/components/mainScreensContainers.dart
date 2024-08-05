import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainScreenContainersWidgets extends StatefulWidget {
  final String imageSrc;
  final String name;
  MainScreenContainersWidgets({ Key? key, required this.imageSrc, required this.name}) : super(key: key);

  @override
  State<MainScreenContainersWidgets> createState() => _MainScreenContainersWidgetsState();
}

class _MainScreenContainersWidgetsState extends State<MainScreenContainersWidgets> {

    @override
    Widget build(BuildContext context){
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image:
                    DecorationImage(image: AssetImage(widget.imageSrc), fit: BoxFit.fill)),
            width: MediaQuery.of(context).size.width / 2 - 20,
            height: MediaQuery.of(context).size.height / 5,
          ),
          Text(widget.name, style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center,)
        ],
      );
    }
}