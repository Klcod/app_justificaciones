import 'package:flutter/material.dart';

class BuscarAlumnoPage extends StatelessWidget {
  const BuscarAlumnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buscar Alumno'),
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 81, 96, 143),
        ),
      body: /*Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/panter.png'))
        ),*/
         buscador(context),

    );
  }
  
  Widget buscador(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final buscador = Container(
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      width: size.width*0.35,
      child: TextField(
        
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'No. control',
        ),
      ),
      
    );

    return Container(
      height: 55,
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Text('Buscar:', style: TextStyle(fontSize: 15),),
          SizedBox(width: 10,),
          buscador,
          SizedBox(width: 10,),
          ElevatedButton(onPressed: (){}, child: Text('Buscar', style: TextStyle(fontSize: 9),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(199, 176, 112, 1)
          ),),
          SizedBox(width: 10,),
          ElevatedButton(onPressed: (){}, child: Text('Registrar', style: TextStyle(fontSize: 9),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(199, 176, 112, 1)
          ),
          )
        ]
      ), 
        /*decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/panter.png'))
        ),*/
    );

  }
       
}