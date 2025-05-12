// ignore: depend_on_referenced_packages
import 'package:permission_handler/permission_handler.dart';
import 'animal_ar_model.dart';

/// A service class to handle AR functionality using ar_flutter_plugin
class ARService {
  // Singleton pattern
  static final ARService _instance = ARService._internal();

  factory ARService() => _instance;

  ARService._internal();

  // Track if model is placed in AR view
  bool isModelPlaced = false;
  String? currentModelPath;
  String? currentAnimalType;

  // Initialize AR session managers
  void initializeAR({
    required sessionManager,
    required objectManager,
    required anchorManager,
    required locationManager,
  }) {
    // AR functionality is disabled
  }

  // Function to place a model in the AR view
  Future<bool> placeModel(AnimalARModel animal) async {
    try {
      // Temporarily return false since AR functionality is disabled
      return false;
    } catch (e) {
      // ignore: avoid_print
      print('Error placing AR model: $e');
      return false;
    }
  }

  // Helper method to determine animal type from name
  String _determineAnimalType(String animalName) {
    animalName = animalName.toLowerCase();

    // Birds list
    List<String> birds = [
      'eagle',
      'hawk',
      'sparrow',
      'owl',
      'penguin',
      'parrot',
      'chicken'
    ];
    // Fish list
    List<String> fish = [
      'salmon',
      'tuna',
      'shark',
      'goldfish',
      'clownfish',
      'trout'
    ];
    // Check which list contains the animal name
    if (birds.any((bird) => animalName.contains(bird))) {
      return 'bird';
    } else if (fish.any((fishName) => animalName.contains(fishName))) {
      return 'fish';
    } else {
      return 'mammal'; // Default to mammal
    }
  }

  // Create customized AR node based on animal type
  // ignore: unused_element
  dynamic _createNodeForAnimalType(String animalType, String assetPath) {
    // Return null for now as AR functionality is disabled
    return null;
  }

  // Function to take a photo in AR view
  Future<bool> takePhoto() async {
    try {
      // Temporarily return false since AR functionality is disabled
      return false;
    } catch (e) {
      // ignore: avoid_print
      print('Error taking AR photo: $e');
      return false;
    }
  }

  // Function to reset AR view
  void resetARView() {
    // AR functionality is disabled
    isModelPlaced = false;
    currentModelPath = null;
  }

  // Function to get AR instructions for a specific animal
  String getARInstructions(String animalName) {
    String animalType = _determineAnimalType(animalName);

    switch (animalType) {
      case 'bird':
        return "AR functionality temporarily disabled. Bird: $animalName";
      case 'fish':
        return "AR functionality temporarily disabled. Fish: $animalName";
      case 'mammal':
      default:
        return "AR functionality temporarily disabled. Mammal: $animalName";
    }
  }

  // Function to request required permissions
  // ignore: unused_element
  Future<void> _requestPermissions() async {
    // Updated permissions request method
    await Permission.camera.request();
    await Permission.storage.request();
    // For newer Android versions, you may need to use:
    // await Permission.photos.request(); // For media access
  }

  // Function to dispose AR resources
  void dispose() {
    resetARView();
  }

  triggerAnimalBehavior() {
    // AR functionality is disabled
  }
}
