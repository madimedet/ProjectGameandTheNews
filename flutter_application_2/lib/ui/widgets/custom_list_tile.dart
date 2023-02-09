
import 'package:flutter/material.dart';

import 'package:flutter_application_2/data/model/character.dart';

class CustumListTile extends StatelessWidget {
  
  const CustumListTile({super.key, required this.result});

  final Results result;
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Colors.grey,
          height: MediaQuery.of(context).size.height / 7,
          child: result.image != null? Image.network(result.image!,fit: BoxFit.fill,): SizedBox(),
          ),
        );
  }
}
