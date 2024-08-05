import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kayr_lang/components/mainScreensContainers.dart';

class MainMenuWidget extends StatefulWidget {
  MainMenuWidget({super.key});

  @override
  State<MainMenuWidget> createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  static const String imagesPath = "assets/img/logo.png";


  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главное меню'), centerTitle: true, 
        backgroundColor: Color.fromRGBO(177, 81, 36, 1) ,),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(177, 81, 36, 1) ,
        child:  
          SingleChildScrollView(
            child: Column(children: [
              Image(image: AssetImage('assets/img/logo.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('''
Поздравляем! Перед Вами приложение по этническим карточкам на корякском языке! Вы прошли все этапы, а теперь давайте начнём познавать и изучать язык и культуру коренных народов Камчатки.
              
Перед Вами 5 разделов со зверями, насекомыми, птицами, рыбами и морскими животными, счётом  и ягодами. В каждом разделе есть аудио с правильным произношением наименования от носителя языка Валентины Романовны Дедык.
              
Следующее — это видеоисполнение движений персонажа, где артисты детского национального ансамбля «К’аююпиль» - «Оленёнок» - и приглашенные гости исполняют так, как это видим мы, коренные жители. Специально сделали акцент на детях, поэтому у Вас точно получится изобразить. Тог’ок – вперед!
              
*Обратите внимание, что в разделе «рыбы и морские животные» исполнение движения рыбы есть только в подразделе «нерка», так как  рыбы двигаются одинаково. 
              
* Примечание: видео работает только при подключении к интернету. 
              
Играть можно разными способами с карточками: развивать речь, устраивать театрализацию, разрабатывать  кроссворд, изучать природу Камчатки и т.д. 
              
Пусть погружение в культуру коренных народов Камчатки пройдет увлекательно, интересно и результативно! 
              
Отмечайте нас в историях в инстаграме (запрещённая сеть в РФ) с отметкой @karinakamchatka
              
С Уважением, Максим, Карина и Кристина!
              ''', style: TextStyle(color: Color.fromARGB(255, 212, 196, 196)),),
              )
              ]),
          ),
      ),
      backgroundColor: Color.fromRGBO(177, 81, 36, 1) ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: MainScreenContainersWidgets(
                    imageSrc: "assets/img/seals.jpg", 
                    name: 'Звери',),
                    onTap: () {
                      Navigator.pushNamed(context, '/entityList', arguments: 1);}
                ),  
                GestureDetector(
                  child: MainScreenContainersWidgets(
                    imageSrc: "assets/img/2.jpg", 
                    name: 'Насекомые',),
                    onTap: () {
                      Navigator.pushNamed(context, '/entityList', arguments: 2);}
                ),
              ],
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: MainScreenContainersWidgets(
                    imageSrc: "assets/img/birds.jpg", 
                    name: 'Птицы\n',),
                    onTap: () {
                      Navigator.pushNamed(context, '/entityList', arguments: 3);}
                ),
                GestureDetector(
                  child: MainScreenContainersWidgets(
                    imageSrc: "assets/img/animals.jpg", 
                    name: 'Рыбы и \nморские животные',),
                    onTap: () {
                      Navigator.pushNamed(context, '/entityList', arguments: 4);}
                ),
              ],
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: MainScreenContainersWidgets(
                    imageSrc: "assets/img/nums.jpg", 
                    name: 'Счет и ягоды',),
                    onTap: () {
                      Navigator.pushNamed(context, '/entityList', arguments: 5);}
                ),
              ],
            )




            // SizedBox(height: 15,),
            // GestureDetector(
            //   child: MainScreenContainersWidgets(imageSrc: "assets/img/animals.jpg", name: 'Звери',),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/entityList', arguments: 1);
            //   }
            // ),
            // SizedBox(height: 15,),
            // GestureDetector(
            //   child: MainScreenContainersWidgets(imageSrc: "assets/img/2.jpg", name: 'Насекомые',),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/entityList', arguments: 2);
            //   },
            // ),
            // SizedBox(height: 15,),
            // GestureDetector(
            //   child: Container(child: MainScreenContainersWidgets(imageSrc: "assets/img/birds.jpg", name: 'Птицы',), ),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/entityList', arguments: 3);
            //   },
            // ),
            // SizedBox(height: 15,),
            // GestureDetector(
            //   child: MainScreenContainersWidgets(imageSrc: "assets/img/seals.jpg", name: 'Морсские животные\nи рыбы',),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/entityList', arguments: 4);
            //   },
            // ),
            // SizedBox(height: 15,),
            // GestureDetector(
            //   child: MainScreenContainersWidgets(imageSrc: "assets/img/nums.jpg", name: 'Ягоды и счет',),
            //   onTap: () {
            //       Navigator.pushNamed(context, '/entityList', arguments: 5);
            //   },
            // ),
            // SizedBox(height: 15,)
        ],
              ),
      ),
    );
  }
}