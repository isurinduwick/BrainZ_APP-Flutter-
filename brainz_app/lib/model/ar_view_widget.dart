import 'package:flutter/material.dart';
import 'animal_ar_model.dart';
import 'ar_service.dart';

class ARViewWidget extends StatefulWidget {
  final AnimalARModel animal;
  final bool showFlightControls;
  final bool showSwimControls;
  final bool showMovementControls;

  const ARViewWidget({
    super.key,
    required this.animal,
    this.showFlightControls = false,
    this.showSwimControls = false,
    this.showMovementControls = false,
  });

  @override
  State<ARViewWidget> createState() => _ARViewWidgetState();
}

class _ARViewWidgetState extends State<ARViewWidget>
    with WidgetsBindingObserver {
  final ARService _arService = ARService();
  bool _isLoading = true;
  // ignore: unused_field, prefer_final_fields
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _arService.resetARView();
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _arService.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _arService.resetARView();
    }
    super.didChangeAppLifecycleState(state);
  }

  // ignore: unused_element
  void _onARViewCreated(
    sessionManager,
    objectManager,
    anchorManager,
    locationManager,
  ) {
    // Placeholder function - AR functionality temporarily disabled
  }

  // ignore: unused_element
  Future<void> _onPlaneOrPointTapped(hitTestResults) async {
    // Placeholder function - AR functionality temporarily disabled
  }

  // ignore: unused_element
  void _onNodeTapped(nodes) {
    // Placeholder function - AR functionality temporarily disabled
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.animal.name} AR'),
        backgroundColor: const Color(0xFF3A4A5C),
      ),
      body: Stack(
        children: [
          _isLoading
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.view_in_ar,
                            size: 80, color: Colors.grey[600]),
                        const SizedBox(height: 20),
                        const Text(
                          "AR functionality temporarily disabled",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(widget.animal.name,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _arService.getARInstructions(widget.animal.name),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_arService.isModelPlaced) _buildAnimalControls(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.place),
                        label:
                            Text(_arService.isModelPlaced ? "Reset" : "Scan"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3A4A5C),
                        ),
                        onPressed: null, // Disabled since AR is disabled
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.camera),
                        label: const Text("Capture"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3A4A5C),
                        ),
                        onPressed: null, // Disabled since AR is disabled
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalControls() {
    if (widget.showFlightControls) {
      return _buildAnimationButton(
        "Make Bird Fly",
        Icons.flight,
        Colors.lightBlueAccent,
      );
    } else if (widget.showSwimControls) {
      return _buildAnimationButton(
        "Make Fish Swim",
        Icons.waves,
        Colors.blueAccent,
      );
    } else if (widget.showMovementControls) {
      return _buildAnimationButton(
        "Make Animal Move",
        Icons.directions_walk,
        Colors.brown,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildAnimationButton(String text, IconData icon, Color color) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey,
      ),
      onPressed: null, // Disabled since AR is disabled
    );
  }
}
