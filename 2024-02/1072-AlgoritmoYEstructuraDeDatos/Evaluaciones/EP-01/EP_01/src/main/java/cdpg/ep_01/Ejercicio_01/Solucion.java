
package cdpg.ep_01.Ejercicio_01;

import javax.swing.JOptionPane;

public class Solucion {

    public static void main(String[] args) {
        // Entrada y validacion de datos
        String nivel = JOptionPane.showInputDialog(null, "Ingrese el nivel del empleado (junior, semi-senior, senior):").toLowerCase();
        if (!nivel.equals("junior") && !nivel.equals("semi-senior") && !nivel.equals("senior")) {
            JOptionPane.showMessageDialog(null, "Nivel no válido. Debe ser 'junior', 'semi-senior' o 'senior'.");
            return;
        }
        String departamento = JOptionPane.showInputDialog(null, "Ingrese el departamento del empleado (produccion, ventas, administracion):").toLowerCase();
        if (!departamento.equals("produccion") && !departamento.equals("ventas") && !departamento.equals("administracion")) {
            JOptionPane.showMessageDialog(null, "Departamento no válido. Debe ser 'produccion', 'ventas' o 'administracion'.");
            return;
        }
        // Convertir los valores
        String salarioStr = JOptionPane.showInputDialog(null, "Ingrese el salario del empleado:");
        double salario;
        try {
            salario = Double.parseDouble(salarioStr);
            if (salario <= 0) {
                JOptionPane.showMessageDialog(null, "El salario debe ser un número positivo.");
                return;
            }
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Salario no válido. Debe ser un número.");
            return;
        }
        String porcentajeCumplimientoStr = JOptionPane.showInputDialog(null, "Ingrese el porcentaje de cumplimiento de la meta:");
        double porcentajeCumplimiento;
        try {
            porcentajeCumplimiento = Double.parseDouble(porcentajeCumplimientoStr);
            if (porcentajeCumplimiento < 0 || porcentajeCumplimiento > 100) {
                JOptionPane.showMessageDialog(null, "El porcentaje de cumplimiento debe estar entre 0 y 100.");
                return;
            }
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Porcentaje no válido. Debe ser un número.");
            return;
        }

        // Cálculo del bono
        double bono = 0;
        if (nivel.equals("junior")) {
            bono = salario * 0.05;
        } else if (nivel.equals("semi-senior")) {
            bono = salario * 0.10;
        } else if (nivel.equals("senior")) {
            bono = salario * 0.20;
        }

        // Aplicar reglas por departamento
        if (departamento.equals("produccion")) {
            if (porcentajeCumplimiento > 90) {
                bono *= 1.5;  // Se multiplica por 1.5 si cumple más del 90%
            } else {
                bono = 0;  // No recibe bono si no cumple más del 90%
            }
        } else if (departamento.equals("ventas")) {
            if (porcentajeCumplimiento >= 100) {
                // Recibe bono completo
            } else {
                bono *= 0.5;  // Bono reducido si no cumple la meta
            }
        }
        //else if (departamento.equals("administracion")) {
            // Siempre reciben bono, no se hace ningún ajuste
        //}

        // Mostrar el bono final
        JOptionPane.showMessageDialog(null, "El bono final es: " + bono);
    }
}
