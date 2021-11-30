import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MyApp());
  });
}

class Background extends ParallaxComponent {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    parallax = await gameRef.loadParallax([
      ParallaxImageData('bgr_spring1.png'),
      ParallaxImageData('bgr_spring2.png'),
      ParallaxImageData('bgr_spring3.png'),
      ParallaxImageData('bgr_spring4.png'),
      ParallaxImageData('bgr_spring5.png')
    ],
        baseVelocity: Vector2(10, 0),
        velocityMultiplierDelta: Vector2(1.4, 1.0));
  }
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(Background());
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final myGame = MyGame();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: GameWidget(
      game: myGame,
    ));
  }
}
