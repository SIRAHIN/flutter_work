import 'package:flutter/material.dart';
import 'package:tictactoe/enum/boxState.dart';

class BoxStateIcon extends StatelessWidget {
  
  final boxStateIcon;
  
  const BoxStateIcon({
    super.key, 
    required this.boxStateIcon
    
  });

  @override
  Widget build(BuildContext context) {
    return boxStateIcon==boxState.circle
                  ? const Icon(Icons.circle_outlined,size: 100,)
                  : boxStateIcon==boxState.cross 
                  ? const Icon(Icons.close,size: 100,)
                  : const Icon(null);
                
  }
}