import 'package:flutter/material.dart';
import 'cobo.dart';
import 'home_page.dart';
//TODO class StartAnimation digunakan untuk membuat animasi menjadi lingkaran kecil
class StarAnimation extends StatefulWidget {
  StarAnimation({Key key, this.buttonControler,this.user,this.pass})
      : shrinkButtonAnimation = new Tween(begin: 320.0, end: 70.0).animate(
          CurvedAnimation(parent: buttonControler, curve: Interval(0.0, 0.150)),
        ),
  //TODO zoomAnimation digunakan untuk zoom dari circle kecil kebesar
        zoomAnimation =
            new Tween(begin: 70.0, end: 900.0).animate(CurvedAnimation(
                parent: buttonControler,
                curve: Interval(
                  0.500,
                  0.999,
                  curve: Curves.bounceInOut,
                ))),
        super(key: key);

  final AnimationController buttonControler;
  final Animation shrinkButtonAnimation;
  final Animation zoomAnimation;

  final String user;
  final String pass;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child:
      zoomAnimation.value <=300 ?
      Container(
          alignment: FractionalOffset.center,
          width: shrinkButtonAnimation.value,
          height: 60.0,
          decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.all(const Radius.circular(30.0))),
          child: shrinkButtonAnimation.value > 75
              ? Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.3),
                )
              : CircularProgressIndicator(
                  strokeWidth: 1.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),)

          : user=='admin'?
      Container(
        //TODO jika userr bernilai admin maka akan menjalankan container

        width: zoomAnimation.value,
        height: zoomAnimation.value,
        decoration: BoxDecoration(
          color: Colors.blue[700],
          shape: zoomAnimation.value < 600
              ? BoxShape.circle
              : BoxShape.rectangle,
        ),
      )
      //TODO jika user tidak bernilai admin maka menjalankan container dibawah ini
          :Container(
        alignment: FractionalOffset.center,
        width: shrinkButtonAnimation.value,
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.all(const Radius.circular(30.0))),
        child: shrinkButtonAnimation.value > 75
            ? Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3),
        )
            : CircularProgressIndicator(
          strokeWidth: 1.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),)

    );
  }

  @override
  _StarAnimationState createState() => _StarAnimationState();
}

class _StarAnimationState extends State<StarAnimation> {

  @override
  Widget build(BuildContext context) {
    widget.buttonControler.addListener((){
      if (widget.user == 'admin'){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context)=> new MyApp1()
            //TODO navigator ini menggunakan routes yang akan berpinddah ke class MyApp1
          )
        );
      }
    });
    return AnimatedBuilder(
      animation: widget.buttonControler,
      builder: widget._buildAnimation,
    );
  }
}
