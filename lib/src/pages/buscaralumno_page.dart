import 'package:flutter/material.dart';

class BuscarAlumnoPage extends StatelessWidget {
  const BuscarAlumnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buscar Alumno'),
          titleTextStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 81, 96, 143),
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
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      width: size.width*0.35,
      child: const TextField(
        
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'No. control',
        ),
      ),
      
    );

    return Container(
      height: 55,
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const SizedBox(width: 10,),
          const Text('Buscar:', style: TextStyle(fontSize: 15),),
          const SizedBox(width: 10,),
          buscador,
          const SizedBox(width: 10,),
          ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(199, 176, 112, 1)
          ), child: const Text('Buscar', style: TextStyle(fontSize: 9),),),
          const SizedBox(width: 10,),
          ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(199, 176, 112, 1)
          ), child: const Text('Registrar', style: TextStyle(fontSize: 9),),
          )
        ]
      ), 
        /*decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/panter.png'))
        ),*/
    );

  }
       
}