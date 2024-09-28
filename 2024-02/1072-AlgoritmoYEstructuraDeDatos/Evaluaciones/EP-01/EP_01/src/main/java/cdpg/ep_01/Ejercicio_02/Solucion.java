
package cdpg.ep_01.Ejercicio_02;

import javax.swing.*;

public class Solucion {

    public static void main(String[] args) {
        // Entrada de datos
        String producto = JOptionPane.showInputDialog(null, "Ingrese el tipo de producto (televisor, lavadora, refrigeradora, otro):").toLowerCase();
        String cantidadStr = JOptionPane.showInputDialog(null, "Ingrese la cantidad de productos comprados:");
        int cantidad = Integer.parseInt(cantidadStr);
        int descuento = 0;
        int esMiembro = JOptionPane.showConfirmDialog(null, "¿El cliente es miembro de la tienda?", "Miembro", JOptionPane.YES_NO_OPTION);

        // Descuentos para productos específicos
        switch (producto) {
            case "televisor":
                if (cantidad > 3) {
                    descuento = 15;
                    if (esMiembro == JOptionPane.YES_OPTION) {
                        descuento += 5;
                    }
                }
                break;
            case "lavadora":
                if (cantidad > 2) {
                    descuento = 10;
                    if (esMiembro == JOptionPane.YES_OPTION) {
                        descuento += 3;
                    }
                }
                break;
            case "refrigeradora":
                if (cantidad > 1 && esMiembro == JOptionPane.YES_OPTION) {
                    descuento = 20;
                }
                break;
            default:
                descuento = 0; // No hay descuentos para otros productos
                break;
        }

        // Mensaje final
        if (descuento > 0) {
            JOptionPane.showMessageDialog(null, "El descuento es del " + descuento + "%.");
        } else {
            JOptionPane.showMessageDialog(null, "No hay descuento disponible para este pedido.");
        }
    }
}
