/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cdpg.ep_01.Ejercicio_05;

import javax.swing.*;

public class Solucion {

    public static void main(String[] args) {
        
        // Entrada de dattos
        int numeroEstudiantes = Integer.parseInt(JOptionPane.showInputDialog("Ingrese el número de estudiantes:"));
        
        double[] calificaciones = new double[numeroEstudiantes];
        
        for (int i = 0; i < numeroEstudiantes; i++) {
            double calificacion;
            while (true) {
                String input = JOptionPane.showInputDialog("Ingrese la calificación del estudiante " + (i + 1) + ":");
                calificacion = Double.parseDouble(input);
                
                // Validación de la calificación
                if (calificacion < 0 || calificacion > 20) {
                    JOptionPane.showMessageDialog(null, "Calificación no válida. Debe estar entre 0 y 20. Intente nuevamente.");
                } else {
                    break; // Salir del bucle si la calificación es válida
                }
            }
            calificaciones[i] = calificacion; // Almacenar calificación válida
        }
        
        // Cálculos
        double sumaCalificaciones = 0;
        int estudiantesAprobados = 0;
        double calificacionMaxima = 0;
        int estudiantesDebajoPromedio = 0;

        // Cálculo de suma de calificaciones y otras métricas
        for (double calificacion : calificaciones) {
            sumaCalificaciones += calificacion; // Sumar las calificaciones
            if (calificacion >= 11) {
                estudiantesAprobados++; // Contar estudiantes aprobados
            }
            if (calificacion > calificacionMaxima) {
                calificacionMaxima = calificacion; // Encontrar la calificación más alta
            }
        }
        
        // Calcular promedio
        double promedio = sumaCalificaciones / numeroEstudiantes;

        // Contar estudiantes con calificaciones por debajo del promedio
        for (double calificacion : calificaciones) {
            if (calificacion < promedio) {
                estudiantesDebajoPromedio++; // Contar estudiantes por debajo del promedio
            }
        }

        // Resultados
        String mensaje = String.format("Calificación promedio: %.2f\n" +
                                        "Estudiantes aprobados: %d\n" +
                                        "Calificación más alta: %.2f\n" +
                                        "Estudiantes debajo del promedio: %d",
                                        promedio, estudiantesAprobados, calificacionMaxima, estudiantesDebajoPromedio);

        JOptionPane.showMessageDialog(null, mensaje);
    }
}
