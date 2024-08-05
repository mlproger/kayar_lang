import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kayr_lang/main.dart';

import '../screens/EntityScreens.dart';

class EntityWidget extends StatefulWidget {
  final String nameEntity;
  final String img;
  final int index;
  final String asetname;
  final bool isNums;
  const EntityWidget({super.key, required this.nameEntity, required this.index, required this.img, required this.asetname, required this.isNums});

  @override
  State<EntityWidget> createState() => _EntityWidgetState();
}

class _EntityWidgetState extends State<EntityWidget> {


  @override
  Widget build(BuildContext context) {
    final SIZE1 = (MediaQuery.of(context).size.width / 2.3);
    final SIZE2 = (MediaQuery.of(context).size.height / 3.5);
    return GestureDetector(
      child: Column(
        children: [
          Container(
            width: SIZE1,
            height: SIZE2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(widget.img), fit: BoxFit.fill)),
          ),
          SizedBox(height: 10,)
        ],
      ),
      onTap: ()async {
        if(widget.isNums){
          final player = AudioPlayer();
          await player.play(AssetSource('sound/nums/${widget.index}.mp3'));
        }
        else{
          Navigator.pushNamed(context, '/currentEntity', arguments: [widget.nameEntity, widget.index, widget.asetname]);  
        }
      },
    );
  }
}