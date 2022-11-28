import 'package:pet_adoption/models/pet_model.dart';
import 'package:pet_adoption/providers/pets_provider.dart';
import 'package:pet_adoption/widgets/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_adoption/models/pet_model.dart';
import 'package:pet_adoption/providers/pets_provider.dart';
import 'package:pet_adoption/widgets/pet_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Adoption"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Get All pets"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Add a new Pet"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height),
                  ),
                  physics: const NeverScrollableScrollPhysics(), // <- Here
                  itemCount: context.watch<PetsProvider>().pets.length,
                  itemBuilder: (context, index) =>
                      PetCard(pet: context.watch<PetsProvider>().pets[index])),
            ),
          ],
        ),
      ),
    );
  }
}
