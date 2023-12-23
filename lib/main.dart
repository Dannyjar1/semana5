import 'package:flutter/material.dart';
import 'package:semana5/clases/Persona.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

List<Persona> _personas =  [
    Persona("Danny", "Jaramillo", "0938472636"),
    Persona("Jose", "Jaramillo", "0938474738"),
    Persona("Sully", "Rojas", "0984873737"),
    Persona("Gabriela", "Ortega", "0948473732"),
    Persona("Salome", "Torres", "0948373747"),
   ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (context, index){
            return ListTile(
              onLongPress: () {
                //print(_personas[index].nombre!);
                this._borrarPersona(context, _personas[index]);
              },


              title: Text('${_personas[index].nombre!}  ${_personas[index].apellido!}'),
              subtitle: Text(_personas[index].telefono!),
              leading: CircleAvatar(
                child: Text(_personas[index].nombre!.substring(0,1)),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          })),
        
      
    );
  }

  _borrarPersona(context, persona){
    showDialog(
      context: context,
      builder: ( _ ) => AlertDialog(
        title: Text("Eliminar Contacto"),
        content: Text("Estas seguro que quieres eliminar a " + persona.nombre + '?' ),
        actions: [
          TextButton(
            onPressed: (){
            Navigator.pop(context);
          }, child:Text("Cancelar")),
          TextButton(onPressed: (){
            print(persona);
            Navigator.pop(context);

          }, child: Text("Borrar", style: TextStyle(color: Colors.red),),)

        ],
      )
    );


  }



}


