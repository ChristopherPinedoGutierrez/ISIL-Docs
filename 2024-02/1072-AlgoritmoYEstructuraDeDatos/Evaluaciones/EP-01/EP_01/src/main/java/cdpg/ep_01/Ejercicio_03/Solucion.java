
package cdpg.ep_01.Ejercicio_03;

import javax.swing.*;

public class Solucion {
    
    public static void main(String[] args) {
        // Entrada de datos
        String tipoCredito = JOptionPane.showInputDialog(null, "Ingrese el tipo de crédito solicitado (basico, premium, empresarial):").toLowerCase();
        String antiguedadStr = JOptionPane.showInputDialog(null, "Ingrese la antigüedad del cliente (en años):");
        int antiguedad = Integer.parseInt(antiguedadStr);
        String historial = JOptionPane.showInputDialog(null, "Ingrese el historial crediticio (excelente, bueno, regular, malo):").toLowerCase();
        
        // Para el crédito empresarial, preguntamos por tenido moras
        boolean tieneMoras = false;
        if (tipoCredito.equals("empresarial")) {
            int moras = JOptionPane.showConfirmDialog(null, "¿El cliente ha tenido moras en los ultimos 3 años?", "Moras", JOptionPane.YES_NO_OPTION);
            tieneMoras = (moras == JOptionPane.YES_OPTION);
        }
        
        // Evaluación del crédito
        boolean califica = false;
        
        switch (tipoCredito) {
            case "basico":
                if (historial.equals("excelente") && antiguedad > 2) {
                    califica = true;
                } else if (historial.equals("regular") && antiguedad > 5) {
                    califica = true;
                }
                break;
            case "premium":
                if ((historial.equals("excelente") || historial.equals("bueno")) && antiguedad > 5) {
                    califica = true;
                }
                break;
            case "empresarial":
                if (historial.equals("excelente") && antiguedad > 10) {
                    califica = true;
                } else if (historial.equals("bueno") && antiguedad > 10 && !tieneMoras) {
                    califica = true;
                }
                break;
            default:
                JOptionPane.showMessageDialog(null, "Tipo de crédito no reconocido.");
                return;
        }
        
        // Mensaje de resultado
        if (califica) {
            JOptionPane.showMessageDialog(null, "El cliente califica para el crédito " + tipoCredito + ".");
        } else {
            JOptionPane.showMessageDialog(null, "El cliente no califica para el crédito " + tipoCredito + ".");
        }
    }
}
