/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cdpg.ep_01.Ejercicio_04;

import javax.swing.*;

public class Solucion {

    public static void main(String[] args) {
        // Arreglo para almacenar las ventas diarias
        double[] ventas = new double[7];
        
        // Entrada de datos
        for (int i = 0; i < 7; i++) {
            String input = JOptionPane.showInputDialog(null, "Ingrese las ventas del día " + (i + 1) + ":");
            ventas[i] = Double.parseDouble(input);
        }
        
        // Cálculos de ventas
        double totalVentas = 0;
        int diaMayorVentas = 0;
        double mayorVentas = 0;
        int diasSinVentas = 0;
        
        for (int i = 0; i < 7; i++) {
            totalVentas += ventas[i];
            if (ventas[i] > mayorVentas) {
                mayorVentas = ventas[i];
                diaMayorVentas = i;
            }
            if (ventas[i] == 0) {
                diasSinVentas++;
            }
        }
        
        double promedioVentas = totalVentas / 7;
        
        int diasPorEncimaPromedio = 0;
        for (int i = 0; i < 7; i++) {
            if (ventas[i] > promedioVentas) {
                diasPorEncimaPromedio++;
            }
        }
        
        // Resultados
        String mensaje = "Total de ventas de la semana: " + totalVentas +
                         "\nDía con mayor cantidad de ventas: Día " + (diaMayorVentas + 1) + " con " + mayorVentas + " ventas." +
                         "\nPromedio de ventas diarias: " + promedioVentas +
                         "\nDías con ventas por encima del promedio: " + diasPorEncimaPromedio +
                         "\nDías sin ventas: " + diasSinVentas;
                         
        JOptionPane.showMessageDialog(null, mensaje);
    }
}
