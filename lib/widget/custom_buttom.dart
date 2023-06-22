
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,this.color,required this.onClick,this.textStyle,this.title,this.isLoading
  });

  final String? title;
  final bool? isLoading;
  final TextStyle? textStyle;
  final Color? color ;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color??Colors.amber)),
        onPressed: isLoading==true?null: onClick,
        child:        
        isLoading==true?const Padding(
          padding: EdgeInsets.all(8.0),
          child: CupertinoActivityIndicator(),
        ):
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(title??"Load Data",style:textStyle?? const TextStyle(fontSize: 18,color: Colors.cyan),),
         ),
      ),
    );
  }
}
