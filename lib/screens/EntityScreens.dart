import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/Entity.dart';

  final lst = [
    ["КАЙӇЫН - МЕДВЕДЬ", "ЙИЛЬГ’ЭЙИЛЬ – ЕВРАЖКА", "ӃЭПЭЙ – РОСОМАХА", "НОТАКОТЬКА – РЫСЬ",
    "КЫТГЫМ – СОБОЛЬ", "ПИПИӃЫЛЬӇЫН – МЫШЬ", "В’ЭПӃА – ЛОСЬ", "ЯЁЛ – ЛИСА", "Г’ЭГЫЛӇЫН - ВОЛК", 
    "МИЛЮТ – ЗАЯЦ","КЫТЭП – ГОРНЫЙ БАРАН", "ЙИӃУК – ПЕСЕЦ", "Г’ЫТГ’ЫН – СОБАКА","ӃОЯӇА – ОЛЕНЬ"],
    ["Г’АЛЯМЫЧ – МУХА", "ӃЭПАЛГОЛГ’ЫН - БАБОЧКА", "ЁӃЭ – ОСА, ОВОД", "МЪЕН – КОМАР", "ПАННЯПЛЯК - МОШКА", "ТЫЛГЫЁӃЭ - ПЧЕЛА"],
    ["ЮВАЮВ’ - ГАГАРА", "В’ЭЛЛЫ – ВОРОНА", "ӃЭЧАӇЭ - ЛЕБЕДЬ", "ТИЛМЫТИЛ – ОРЁЛ","ӃЭККУК – КУКУШКА", "КРЕЧЕТ - КРЕЧЕТ", "ЕВ’ЪЕВ’ – КУРОПАТКА", "В’ЭКЫТГЫН – СОРОКА", "ЯӃЪЯӃ- ЧАЙКА", "ТЫНОПГАЛЛЭ – СОВА", "ГАЛЛЭ – УТКА", "ЯТАМӃЭЧАӇЭ – ЖУРАВЛЬ", "КИНГ’ЫТ – ГЛУХАРЬ"],
    ["В’ИЮВ’ИЙ- НЕРКА", "В’ИТЫВ’ИТ – ГОЛЕЦ", "В’ЭӃЫН – НАВАГА", "КАГАЧ – КОРЮШКА", "КЫЧАВ’ - ХАРИУС", "ЙЫКАННЫН – КИЖУЧ", "ЭВ’ЭЧ – ЧАВЫЧА", "ӃЭТАӃЭТ – КЕТА", "АЛЬПЭАЛЬ – КАМБАЛА", "УЛУУЛ – СИВУЧ", "ПАЛТУС - ПАЛТУС", "КАЛИЛГ’ЫЛ – НЕРПА", "КОСАТКА - КОСАТКА", "ЮӇИ – КИТ", "ВЭГЫТКЭӇ – КРАБ", "ТУЙКЭТУЙ – ЩУКА", "КАЛАЛ - ГОРБУША"],
    ["ЫННЭН – ОДИН", "ПЫГ’ОН – ГРИБ", "ӇЫЧЧЕӃ – ДВА", "ПУЯЙЫТТЫЙЫТ - КНЯЖЕНИКА", "ӇЫЁӃ– ТРИ", "В’АПАӃ – МУХОМОР", "ӇЫЯӃ – ЧЕТЫРЕ", "В’УНЭВ’УН – ШИШКА", "МЫЛЛЫӇЭН – ПЯТЬ", "ЙЫТТЫЙЫТ – МОРОШКА", "ЫННАНМЫЛЛЫӇЭН – ШЕСТЬ", "ЫЛЭЧГ’ЫН – ЖИМОЛОСТЬ", "ӇЫЯӃМЫЛЛЫӇЭН – СЕМЬ", "ЯЧУВЫНГ’ЫН – ШИКША", "ӇЫЁӃМЫЛЛЫН’ЭН – ВОСЕМЬ", "ЛИӇЫЛ – ГОЛУБИКА", "ӃОНГ’АЙЫЧЫӇКЭН – ДЕВЯТЬ",
     "ГЫЙЫНГ’ЫН – БРУСНИКА", "МЫНГЫТКЭН – ДЕСЯТЬ", "МЫЧГ’АЛ – РЯБИНА"],

  ];

class EntityListWidget extends StatefulWidget {
  const EntityListWidget({super.key});

  @override
  State<EntityListWidget> createState() => _EntityListWidgetState();
}

class _EntityListWidgetState extends State<EntityListWidget> {

  
    
  

  @override
  Widget build(BuildContext context) {
    final INDEX = ModalRoute.of(context)?.settings.arguments as int;
    final int lengths = (lst[INDEX-1].length / 2).toInt();
    late String entityName;
    late String appBarNames;
    if(INDEX == 1){
      entityName = "animals";
      appBarNames = "Звери";
    }
    else if(INDEX == 2){
      entityName = "insects";
      appBarNames = "Насекомые";
    }
    else if(INDEX == 3){
      entityName = "birds";
      appBarNames = "Птицы";
    }
    else if(INDEX == 4){
      entityName = "fishes";
      appBarNames = "Морсские животные\nи рыбы";
    }
    else if(INDEX == 5){
      entityName = "nums";
      appBarNames = 'Счёт и ягоды';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarNames,textAlign: TextAlign.center,),
        backgroundColor: Color.fromRGBO(177, 81, 36, 1) ,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon: const Icon(Icons.arrow_back),),
      ),
      backgroundColor:  Color.fromRGBO(177, 81, 36, 1) ,
      body: ListView.builder(
        itemBuilder: (context, index){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: index == lengths && lst[INDEX-1].length % 2 == 1
            ? 
            [
              EntityWidget(nameEntity: lst[INDEX-1][(index+1)*2-2], img: 'assets/img/$entityName/${(index+1)*2-1}.jpg', index: (index+1)*2-1, asetname: entityName, isNums: INDEX-1==4,),
            ] 
            : 
            [
              EntityWidget(nameEntity: lst[INDEX-1][(index+1)*2-2], img: 'assets/img/$entityName/${(index+1)*2-1}.jpg', index:(index+1)*2-1, asetname: entityName,isNums: INDEX-1==4),
              EntityWidget(nameEntity: lst[INDEX-1][(index+1)*2-1], img: 'assets/img/$entityName/${(index+1)*2}.jpg', index: (index+1)*2, asetname: entityName,isNums: INDEX-1==4),
            ],
          );
        }, 
        itemCount: lst[INDEX-1].length % 2 == 0 ? lengths : lengths+1,),
    );
  }
}