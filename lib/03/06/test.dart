main() {
  //LoopLayout(
  //shift: 0,
  //         center: LoopLayout(
  //           shift: 1,
  //           center: LoopLayout(
  //             shift: 2,
  //               center:LoopLayout(
  //                 shift: 3,
  //                 center: LoopLayout(shift: 4,),
  //               )
  //           ),
  //         ),
  //       )

  int loopCount = 15;
  String result = '';

  for (int i = 0; i < loopCount; i++) {
    if(loopCount-1==i){
      result += 'LoopLayout(shift: ${0*i})';

    }else{
      result += 'LoopLayout(shift: ${0*i},center:';

    }
  }
  result+= '),'*(loopCount-1);
  print(result);
}
