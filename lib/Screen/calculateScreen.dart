

import 'package:calcullator/provider/toglebuttonprovvider.dart';
import 'package:flutter/material.dart';

import 'package:calcullator/data/buttontext.dart';
import 'package:calcullator/utility/calbutton.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Calculatescreen extends ConsumerStatefulWidget{
   const Calculatescreen({super.key
   });


   @override
  ConsumerState<Calculatescreen> createState() => _calculatescreen();
}



class _calculatescreen extends ConsumerState<Calculatescreen>{
  @override
  Widget build(BuildContext context) {

    final displaysized = MediaQuery.sizeOf(context);

  

    final result = ref.watch(toggleButtonProvider);

    
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
              child: Container(
                height: displaysized.height /3 ,
                width: double.infinity,
                color:Theme.of(context).colorScheme.surface,
                alignment:Alignment.bottomRight,
                child:  SingleChildScrollView(
                  child: Text( result.isEmpty ? "0" : result,
                  style:const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                ),
                
              ),
            ),
             Expanded(child: 
            
             Wrap(
              children: btn.btnvalues.map(
                (value) => Calbutton(value: value)
                ).toList()       
              
            )
            )
          ],
        
      ),
    );
  }
}