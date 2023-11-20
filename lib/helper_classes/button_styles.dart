import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle primaryButtonStyle(Color color) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      // Add other style properties here as needed
    );
  }

  static ButtonStyle secondaryButtonStyle(Color color) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      // Customize other style properties for secondary buttons
    );
  }
}
