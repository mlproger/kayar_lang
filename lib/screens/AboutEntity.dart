import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kayr_lang/main.dart';
import 'package:kayr_lang/screens/videoScreen.dart';
import 'package:kayr_lang/server/api.dart';


class AboutEntityWidget extends StatefulWidget {
  const AboutEntityWidget({super.key});

  @override
  State<AboutEntityWidget> createState() => _AboutEntityWidgetState();
}

class _AboutEntityWidgetState extends State<AboutEntityWidget> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration pozition = Duration.zero;
  bool isActive = false;
  int check = 0;
  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
     });

     player.onDurationChanged.listen((event) { 
      setState(() {
        duration = event;
      });
     });

     player.onPositionChanged.listen((event) { 
      setState(() {
        pozition = event;
      });
     });
  }

  @override
  void dispose() {
    player.stop();
    //player.dispose();
    super.dispose();
  }

  getHref(int ind, index) async {
    var hrefs = links[ind][index-1];
  }


  @override
  Widget build(BuildContext context) {

    String format(Duration duration){
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));
      return [
        minutes,
        seconds
      ].join(":");
  }

    final args = ModalRoute.of(context)?.settings.arguments as List;
    final name = args[0];
    final index = args[1];
    final asetName = args[2];
    int i = 0;
    String new_name = "";
    while(name[name.length - i - 1] != ' '){
      new_name += name[name.length - i - 1];
      i += 1;
    }
    int ind = 0;
    var mas = [];
    var mas2 = [];
    if(asetName == "animals"){
      ind = 1;
      mas = animals;
      mas2 = animals2;
    }
    else if(asetName == "insects"){
      ind = 2;
      mas = insects;
      mas2 = insects2;
    }
    else if(asetName == "birds"){
      ind = 3;
      mas = birds;
      mas2 = birds2;
    }
    else if(asetName == "fishes"){
      ind = 4;
      mas = fishes;
      mas2 = fishes2;
    }
    else{
      ind = 5;
    }

    if(ind != 5){
      return Scaffold(
      backgroundColor: Color.fromRGBO(177, 81, 36, 1) ,
      appBar: AppBar(
        title: Text(name, style: TextStyle(fontSize: 15),),
        backgroundColor: Color.fromRGBO(177, 81, 36, 1) ,
        leading: IconButton(onPressed: (){
          //Navigator.pushReplacementNamed(context, '/entityList', arguments: ind);
          Navigator.pop(context);
        }, 
        icon: const Icon(Icons.arrow_back),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image:DecorationImage(
                          image: AssetImage('assets/img/audio.jpg'), 
                          fit: BoxFit.fill)),
                    ),
                    Text(new_name.split('').reversed.join()[0].toUpperCase() + new_name.split('').reversed.join().substring(1).toLowerCase() + '\n', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                  ],
                ),
              onTap: ()async{
                await player.play(AssetSource('sound/${asetName}/${index}.mp3'));
                  isActive = true;
                  check = 1;
              },
              ),
              GestureDetector(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image:DecorationImage(
                          image: AssetImage('assets/img/audio.jpg'), 
                          fit: BoxFit.fill)),
                    ),
                    Text(mas[index-1], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)
                  ],
                ),
                onTap: ()async{
                  await player.play(AssetSource('sound/${asetName}/${index}_1.mp3'));
                  isActive = true;
                  check = 1;
                },
              ),
          ],),
          video_links[ind-1][index-1].length != 0 ? 
          Column(
            // children: [
            //   Container(
            //     width: 150,
            //     height: 150,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       image:DecorationImage(
            //         image: AssetImage('assets/img/video.jpg'), 
            //         fit: BoxFit.fill)),
            //   ),
            //   Text(mas2[index-1], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700))
            // ],
            children: [
              video_links[ind-1][index-1].length == 2 ? 
              Column(children: [
                GestureDetector(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage('assets/img/video.jpg'), fit: BoxFit.fill)
                    ),
                  ),
                  onTap: (){
                    player.stop();
                    //player.dispose();
                    Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) => VideoScreen(asetName: asetName, index: index, nameEntity: name, new_ind: 0,),),);
                  },
                ),
                Text(mas2[index-1], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                GestureDetector(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage('assets/img/video.jpg'), fit: BoxFit.fill)
                    ),
                  ),
                  onTap: (){
                    player.stop();
                    //player.dispose();
                    Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) => VideoScreen(asetName: asetName, index: index, nameEntity: name, new_ind: 1,),),);
                  },
                ),
                Text(mas2[index-1], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700))
              ],) : 
              Column(children: [
                GestureDetector(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage('assets/img/video.jpg'), fit: BoxFit.fill)
                    ),
                  ),
                  onTap: (){
                    player.stop();
                    //player.dispose();
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => VideoScreen(asetName: asetName, index: index, nameEntity: name, new_ind: 0,),),);
                  },
                ),
                Text(mas2[index-1], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700))
              ],)
              ],
          ) : SizedBox(),

          isActive ? Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 30,),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                isActive = false;
                                player.stop();
                              });
                            }, child: Icon(Icons.disabled_by_default_rounded)),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 50, 
                          child: Dialog(
                            child: Column(
                              children: [
                                Slider(
                                  min: 0,
                                  max: duration.inSeconds.toDouble(),
                                  value: pozition.inSeconds.toDouble(),
                                  onChanged: (value) async{
                                    final pos = Duration(seconds: value.toInt());
                                    await player.seek(pos);
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(format(pozition)),
                                    Text(format(duration - pozition))
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 25,
                                  child: IconButton(icon: 
                                  Icon(isPlaying ? Icons.pause : Icons.play_arrow), onPressed: ()async{
                                    if (isPlaying){
                                      await player.pause();
                                    }
                                    else{
                                      check == 0 ?
                                      await player.play(AssetSource('sound/${asetName}/${index}.mp3')) :
                                      await player.play(AssetSource('sound/${asetName}/${index}_1.mp3'));
                                    }
                                  },),
                                ),
                                SizedBox(height: 10,)
                              ],
                            ),
                          ),
                          ),
                      ],
                    )
          : Container()
        ],
      )
    );
    }
    if(check == 0){
      player.play(AssetSource('sound/${asetName}/${index}.mp3'));
      setState(() {
        check=1;
      });
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(name, style: TextStyle(fontSize: 15),),
        backgroundColor: Color.fromRGBO(177, 81, 36, 1) ,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon: const Icon(Icons.arrow_back),),
      ),
      backgroundColor:Color.fromRGBO(177, 81, 36, 1),
      body: Center(
        child: GestureDetector(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4)),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image:DecorationImage(
                          image: AssetImage('assets/img/audio.jpg'), 
                          fit: BoxFit.fill)),
                    ),
                    Text(new_name.split('').reversed.join(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)
                  ],
                ),
                onTap: ()async{
                  await player.play(AssetSource('sound/${asetName}/${index}.mp3'));
                  isActive = true;
                  check = 1;
                },
              ),
      ),
    );
    
  }
}

