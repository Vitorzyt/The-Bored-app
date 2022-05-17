import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_of_activities.dart';

List<DropdownMenuItem<String>> getDropdownItens() {
  List<DropdownMenuItem<String>> dropdownItens = [];

  for (int i = 0; i < typeOfActivitiesList.length; i++) {
    String typeListItem = typeOfActivitiesList[i];
    var newItem = DropdownMenuItem(
        child: Text(
          '$typeListItem',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
        value: typeListItem);
    dropdownItens.add(newItem);
  }

  return dropdownItens;
}

List<DropdownMenuItem<String>> getDropdownItensnumber() {
  List<DropdownMenuItem<String>> dropdownItens = [];

  for (int i = 0; i < numberOfParticipantsList.length; i++) {
    String typeListItem = numberOfParticipantsList[i];
    var newItem = DropdownMenuItem(
        child: Text(
          '$typeListItem',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
        value: typeListItem);
    dropdownItens.add(newItem);
  }

  return dropdownItens;
}
