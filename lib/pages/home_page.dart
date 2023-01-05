import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  ValueNotifier<bool> isSelected = ValueNotifier(false);
  late AnimationController _animacao;

  @override
  void initState() {
    _animacao = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    super.initState();
  }

  toggle() {
    isSelected.value = !isSelected.value;
    // isSelected.value ? _animacao.forward() : _animacao.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icones Animados'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: isSelected,
          builder: (BuildContext context, bool selected, _) => IconButton(
            iconSize: 128,
            onPressed: toggle,
            icon: AnimatedSwitcher(
              child: selected
                  ? const Icon(Icons.edit, key: ValueKey('iconA'))
                  : const Icon(Icons.close, key: ValueKey('iconB')),
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
