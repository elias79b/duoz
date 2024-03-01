import 'package:douz_game/Box.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var turn = 0 ;
  var winner = '';
  var boxes = List<Box>.filled(9,Box(isempty: true),growable: false);

  void changeTurn(){
    if(turn ==0){
      turn = 1;
    }else{
      turn=0;
    }
  }

  Widget BoxComponent(int index){
    return InkWell(
      onTap: (){
        if(boxes[index].isempty== true){
          var bx = Box(owner: turn,isempty: false);
          boxes[index] = bx;
          changeTurn();
          setState(() {

          });
          CheckVictor();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2,),
        alignment: Alignment.center,
        color: Colors.cyan,
        child: XO(boxes[index].owner),
      ),
    );
  }

  void CheckVictor(){
    ///افقی
    if(boxes[0].owner== boxes[1].owner && boxes[0].owner == boxes[2].owner && boxes[0].isempty == false){
      setState(() {
        winner= "Winner : Player ${boxes[0].owner}";
      });
    }
   else if(boxes[3].owner== boxes[4].owner && boxes[3].owner == boxes[5].owner && boxes[3].isempty == false){
      setState(() {
        winner= "Winner : Player ${boxes[3].owner}";
      });}
    else if(boxes[6].owner== boxes[7].owner && boxes[7].owner == boxes[8].owner && boxes[6].isempty == false){
        setState(() {
          winner= "Winner : Player ${boxes[6].owner}";
        });
      }
      ///
      ///
    else  if(boxes[0].owner== boxes[3].owner && boxes[0].owner == boxes[6].owner && boxes[0].isempty == false){
        setState(() {
          winner= "Winner : Player ${boxes[0].owner}";
        });
      }
    else if(boxes[1].owner== boxes[4].owner && boxes[1].owner == boxes[7].owner && boxes[1].isempty == false){
        setState(() {
          winner= "Winner : Player ${boxes[1].owner}";
        });
      }
    else if(boxes[2].owner== boxes[5].owner && boxes[2].owner == boxes[8].owner && boxes[2].isempty == false){
        setState(() {
          winner= "Winner : Player ${boxes[2].owner}";
        });
      }
    //   ///
    //   ///
    else  if(boxes[0].owner== boxes[4].owner && boxes[0].owner == boxes[8].owner && boxes[0].isempty == false){
        setState(() {
          winner= "Winner : Player ${boxes[0].owner}";
        });
      }
    else  if(boxes[2].owner== boxes[4].owner && boxes[2].owner == boxes[6].owner && boxes[2].isempty == false){
        setState(() {
          winner= "Winner : Player ${boxes[2].owner}";
        });
      }

    }



  Widget XO(var player){
    if(player == 1){
      return const Text('O',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,
      color: Colors.purple),);
    }else if(player == 0){
      return const Text('X',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,
          color: Colors.yellow),);
    }else{
      return const Text('');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.cyan.shade300,
        title: Text(' دوز',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,


      ),
      body: SafeArea(child:
      Container(
        color: Colors.white10,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),

              child: GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 3/3,
                maxCrossAxisExtent: 150,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5
              ),
                itemCount: 9,
              itemBuilder: (context,index){
                return BoxComponent(index);
              },
              )
            ),
            Text(winner,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      )
      ),
    );
  }
}

