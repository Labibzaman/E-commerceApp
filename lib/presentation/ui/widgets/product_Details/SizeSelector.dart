import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utility/appcolors.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.Sizes, required this.Onchanged});

  final List Sizes;
  final Function Onchanged;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {

  late String _selectedSize;
  @override
  void initState() {
    super.initState();

    _selectedSize = widget.Sizes.first;
    widget.Onchanged(_selectedSize);

  }


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: widget.Sizes.map((c) => InkWell(
        onTap: (){
          _selectedSize=c;
          if(mounted){
            setState(() {

            });
          }
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color:  _selectedSize ==c ?AppColors.primaryColor:Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey)

          ),
          child: Text(
            c,
            style: TextStyle(
              color: _selectedSize == c
                  ? Colors.white
                  : Colors.black54,
            ),
          ),
        ),
      )).toList(),
    );
  }
}
