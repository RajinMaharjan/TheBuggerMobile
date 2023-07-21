import 'package:flutter/material.dart';

class KeySkillProvider extends ChangeNotifier {
  List<String> skills = [];
  List<String> matchingSkills = [];

  void searchSkills(String searchText, List<String> keySkills) {
    matchingSkills = keySkills
        .where(
            (skill) => skill.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void addSkill(String skill) {
    if (skill.isNotEmpty) {
      skills.add(skill);
      notifyListeners();
    }
  }

  void removeSkill(String skill) {
    skills.remove(skill);
    notifyListeners();
  }
}
