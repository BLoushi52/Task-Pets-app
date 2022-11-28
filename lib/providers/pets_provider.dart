import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet_model.dart';
import 'package:pet_adoption/services/pets_services.dart';

class PetsProvider extends ChangeNotifier {
  List<Pet> pets = [];

  PetsProvider() {
    loadPets();
  }

  Future<void> loadPets() async {
    pets.clear();

    var response = await Client.dio.get("/pets");
    var petJsonList = response.data as List;

    pets = petJsonList.map((petJson) => Pet.fromMap(petJson)).toList();

    notifyListeners();
  }
}
