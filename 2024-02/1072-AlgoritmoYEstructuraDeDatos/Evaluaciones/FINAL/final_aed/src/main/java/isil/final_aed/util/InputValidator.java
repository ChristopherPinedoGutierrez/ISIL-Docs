
package isil.final_aed.util;

import javax.swing.*;

public class InputValidator {

    public static String getStringInput(String message) {
        String input = JOptionPane.showInputDialog(message);
        if (input == null || input.trim().isEmpty()) {
            JOptionPane.showMessageDialog(null, "Por favor ingrese un valor válido.");
            return getStringInput(message);
        }
        return input;
    }

    public static int getIntInput(String message) {
        String input = getStringInput(message);
        try {
            return Integer.parseInt(input);
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Por favor ingrese un número válido.");
            return getIntInput(message);
        }
    }
}

