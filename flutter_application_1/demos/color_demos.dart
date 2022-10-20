import 'package:flutter/material.dart';

//Bir ekran olacak
//Bu ekran 3 button ve bunlara basınca renk değişimi olucak
//Seçili olan button selected icon olacak

class ColorDemos extends StatefulWidget {
  const ColorDemos({Key? key}) : super(key: key);

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor = Colors.transparent;

  void changeBackgroundColor(Color color) {
    //Ekranın tetiklenmesini istediğim için setState
    setState() {
      _backgroundColor = color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _colorOnTap,
            /*
            if (value == 0) {
            } else if (value == 1) {
            } else {}
            */

            //daha iyi bir yöntem
            
        
          items: const [
            BottomNavigationBarItem(
                icon: _ColorContainer(color: Colors.red), label: 'Red'),
            BottomNavigationBarItem(
                icon: _ColorContainer(color: Colors.yellow), label: 'Yellow'),
            BottomNavigationBarItem(
                icon: _ColorContainer(color: Colors.blue), label: 'Blue'),
          ]),
    );
  }
  void _colorOnTap(int value){
   if (value == _MyColors.red.index) {
              changeBackgroundColor(Colors.red);

            } else if (value == _MyColors.yellow.index) {
              changeBackgroundColor(Colors.yellow);
            } else if (value == _MyColors.blue.index){
              changeBackgroundColor(Colors.blue);
            }

}

}

//Colorları numaraları karışmasın diye sıralattı
enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10);
  }
}
