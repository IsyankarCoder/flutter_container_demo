import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled=false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Container Layout Demo', 
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Container Layout')),
        body: _buildImageColumn(),
      )
    );
  }

  Widget _buildImageColumn(){
    return Container(
      decoration: const BoxDecoration(color: Colors.amber),
      child: Column(
        children: [
          Expanded(child: _buildImageRow(1)),
          Expanded(child: _buildImageRow(3))
        ],
      )
    );
  }

  Widget _buildImageRow(int imageIndex){
     return Row(children: [
       _buildDecoratedImage(imageIndex),
       _buildDecoratedImage(imageIndex+1)
     ]);
  }

  Widget _buildDecoratedImage(int imageIndex){
     return Expanded(      
      child: Container(
         decoration: BoxDecoration(
          border: Border.all(width: 10,color: Colors.black38),
          borderRadius: const BorderRadius.all(Radius.circular(8))
         ),
         margin: const EdgeInsets.all(4),
         child: Image.asset(
            "images/pic$imageIndex.jpg"
         ),
      ) 
     );
  }
}