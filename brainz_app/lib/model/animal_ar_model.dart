class AnimalARModel {
  final String name;
  final String modelPath;
  final String imagePath;
  final String description;
  final bool isAvailable;

  const AnimalARModel({
    required this.name,
    required this.modelPath,
    required this.imagePath,
    this.description = '',
    this.isAvailable = false,
  });

  // List of available animals for AR
  static List<AnimalARModel> getAnimals() {
    return [
      AnimalARModel(
        name: "Tiger",
        modelPath: "assets/models/tiger.glb",
        imagePath: "assets/tigerimg.png",
        description:
            "The tiger is the largest living cat species and a member of the genus Panthera.",
        isAvailable: true,
      ),
      AnimalARModel(
        name: "Lion",
        modelPath: "assets/models/lion.glb",
        imagePath: "assets/lion.png",
        description:
            "The lion is a large cat of the genus Panthera native to Africa and India.",
        isAvailable: true,
      ),
      AnimalARModel(
        name: "Eagle",
        modelPath: "assets/models/eagle.glb",
        imagePath: "assets/eagle.png",
        description: "Eagles are birds of prey with exceptional vision.",
        isAvailable: true,
      ),
      AnimalARModel(
        name: "Leopard",
        modelPath: "assets/models/leopard.glb",
        imagePath: "assets/leopard.png",
        description: "Leopards are known for their agility and strength.",
        isAvailable: true,
      ),
      AnimalARModel(
        name: "Wolf",
        modelPath: "assets/models/wolve.glb",
        imagePath: "assets/wolve.png",
        description: "Wolves are social animals that live in packs.",
        isAvailable: true,
      ),
    ];
  }

  // Get an animal by name
  static AnimalARModel getAnimalByName(String name) {
    try {
      return getAnimals().firstWhere(
        (animal) => animal.name == name,
        orElse: () => AnimalARModel(
          name: name,
          modelPath: "",
          imagePath: "assets/placeholder.png",
          description: "No information available for $name",
        ),
      );
    } catch (e) {
      return AnimalARModel(
        name: name,
        modelPath: "",
        imagePath: "assets/placeholder.png",
        description: "No information available for $name",
      );
    }
  }
}
