
import 'package:flutter/material.dart';
import 'package:gameleven/app/data/utiles/app_colors.dart';

class SizePicker extends StatelessWidget {
  const SizePicker({
    Key? key,
    required this.sizes,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);
  final List<String> sizes;
  final int selectedIndex;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Size',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onChanged(index),
                child: Container(

                  width: 80.0,

                  margin: const EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      width: 2.0,
                      color:
                      selectedIndex == index ? CtmColors.appColor : Colors.grey,
                    ),
                    // color: Colors.red,
                  ),
                  child:
                  Center(child: Text(sizes[index])),
                /*  Column(children: [

               *//*     selectedIndex == index
                        ? Icon(
                      Icons.done,
                      color: CtmColors.appColor,
                    )
                        : SizedBox(),*//*
                    Text(sizes[index]),

                  ],),*/





                ),
              );
            },
          ),
        ),
      ],
    );
  }
}