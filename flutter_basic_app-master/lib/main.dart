import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //cambiem el titol tant de la aplicacio com del home page
      title: 'Tier List Genshin Impact',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Tier List Genshin Impact',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Cambiem els personatges
  List<Dog> initialDoggos = []
    ..add(Dog(
        'Diluc',
        'Elemento: Pyro, Rareza: 5',
        'Diluc es el caballero más rico de Mondstadt, siempre elegante, el epítome de la perfección.',
        'https://i.pinimg.com/564x/c9/28/0a/c9280af24e1735fcb28eba7ac4fbefd3.jpg'))
    ..add(Dog(
        'Venti',
        'Elemento: Anemo, Rareza: 5',
        'Venti es un bardo misterioso al que le gusta recitar tanto viejos poemas como nuevas canciones de moda.',
        'https://img.gamerjournalist.com/spai/w_2688+q_lossy+ret_img+to_webp/https://cdn.gamerjournalist.com/primary/2020/10/Best-Venti-Build-in-Genshin-Impact.jpg'))
    ..add(Dog(
        'Razor',
        'Elemento: Electro, Rareza: 4',
        'Algunos dicen que Razor es un huérfano criado por lobos, otros dicen que es un espíritu de lobo encarnado en humano.',
        'https://xboxplay.games/imagenes/redimensionar2.php?imagen=https://www.gematsu.com/wp-content/uploads/2019/10/Genshin-Impact_2019_10-18-19_Top.jpg&an=722&al=400'))
    ..add(Dog(
        'Chongyun',
        'Elemento: Cryo, Rareza: 4',
        'Chongyun proviene de una familia de exorcistas; desde pequeño ya poseía habilidades sobrehumanas.',
        'https://mundogenshinimpact.com/wp-content/uploads/genshin-impact-detalla-chongyun-gematsu.jpg'))
    ..add(Dog('Bárbara', 'Elemento: Hydro, Rareza: 4', 'Barbara es la diaconisa de la iglesia Favonius y una estrella adorada por todos.', 'https://img.zonared.com/images/noticias/portada/63000/63896-h.jpg'));

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black26,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              //cambiem el fons del programa
              image: DecorationImage(
            image: new NetworkImage(
                "https://images5.alphacoders.com/109/1099191.jpg"),
            fit: BoxFit.cover,
          )),
          child: new Center(
            child: new DogList(initialDoggos),
          )),
    );
  }
}
