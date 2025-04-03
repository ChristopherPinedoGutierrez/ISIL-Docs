/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cdpg.ep_04.main;

import cdpg.ep_04.pila.Pila;
import cdpg.ep_04.cola.Cola;
import cdpg.ep_04.clases.Producto;
import cdpg.ep_04.enums.Categoria;
import cdpg.ep_04.enums.Marca;
import cdpg.ep_04.enums.Proveedor;
import cdpg.ep_04.enums.Medida;
import cdpg.ep_04.enums.Ubicacion;

import javax.swing.JOptionPane;

public class Main {
    public static void main(String[] args) {
        String menu = """
                ***** Menú Principal *****
                [1] Usar Pila
                [2] Usar Cola
                [3] Salir
                Seleccione una opción:
                """;
        int opcion;
        do {
            opcion = Integer.parseInt(JOptionPane.showInputDialog(menu));
            switch (opcion) {
                case 1 -> manejarPila();
                case 2 -> manejarCola();
                case 3 -> JOptionPane.showMessageDialog(null, "Saliendo del programa.");
                default -> JOptionPane.showMessageDialog(null, "Opción inválida.");
            }
        } while (opcion != 3);
    }

    private static void manejarPila() {
        Pila pila = new Pila();
        String menuPila = """
                *** Menú Pila ***
                [1] Apilar Producto
                [2] Desapilar Producto
                [3] Ver Producto en el Tope
                [4] Mostrar Pila
                [5] Ver Tamaño de la Pila
                [6] Salir
                Seleccione una opción:
                """;
        int opcion;
        do {
            opcion = Integer.parseInt(JOptionPane.showInputDialog(menuPila));
            switch (opcion) {
                case 1 -> {
                    Producto producto = crearProducto();
                    pila.apilar(producto);
                    JOptionPane.showMessageDialog(null, "Producto apilado: " + producto.getNombre());
                }
                case 2 -> JOptionPane.showMessageDialog(null, "Producto desapilado: " + pila.desapilar());
                case 3 -> JOptionPane.showMessageDialog(null, "Producto en el tope: " + pila.verTope());
                case 4 -> pila.mostrarPila();
                case 5 -> JOptionPane.showMessageDialog(null, "Tamaño de la pila: " + pila.getTamaño());
                case 6 -> JOptionPane.showMessageDialog(null, "Regresando al menú principal.");
                default -> JOptionPane.showMessageDialog(null, "Opción inválida.");
            }
        } while (opcion != 6);
    }

    private static void manejarCola() {
        Cola cola = new Cola();
        String menuCola = """
                ***** Menú Cola *****
                [1] Encolar un Producto
                [2] Desencolar un Producto
                [3] Ver el Primer Producto
                [4] Verificar si la Cola está Vacía
                [5] Ver Tamaño de la Cola
                [6] Mostrar la Cola
                [7] Salir
                Seleccione una opción:
                """;
        int opcion;
        do {
            opcion = Integer.parseInt(JOptionPane.showInputDialog(menuCola));
            switch (opcion) {
                case 1 -> {
                    Producto producto = crearProducto();
                    cola.encolar(producto);
                    JOptionPane.showMessageDialog(null, "Producto encolado: " + producto.getNombre());
                }
                case 2 -> JOptionPane.showMessageDialog(null, "Producto desencolado: " + cola.desencolar());
                case 3 -> JOptionPane.showMessageDialog(null, "Primer producto: " + cola.verPrimero());
                case 4 -> JOptionPane.showMessageDialog(null, "¿Cola vacía?: " + cola.estaVacia());
                case 5 -> JOptionPane.showMessageDialog(null, "Tamaño de la cola: " + cola.getTamaño());
                case 6 -> cola.mostrarCola();
                case 7 -> JOptionPane.showMessageDialog(null, "Regresando al menú principal.");
                default -> JOptionPane.showMessageDialog(null, "Opción inválida.");
            }
        } while (opcion != 7);
    }

    
    private static Producto crearProducto() {
        // Solicitar al usuario la información del producto
        int codigo = Integer.parseInt(JOptionPane.showInputDialog("Ingrese el código del producto:"));
        String nombre = JOptionPane.showInputDialog("Ingrese el nombre del producto:");
        
        // Mostrar y solicitar la categoría
        Categoria categoria = seleccionarEnum(Categoria.class, "Seleccione una categoría:");
        
        // Mostrar y solicitar la marca
        Marca marca = seleccionarEnum(Marca.class, "Seleccione una marca:");
        
        double precioCompra = Double.parseDouble(JOptionPane.showInputDialog("Ingrese el precio de compra:"));
        int stock = Integer.parseInt(JOptionPane.showInputDialog("Ingrese el stock:"));
        
        // Mostrar y solicitar el proveedor
        Proveedor proveedor = seleccionarEnum(Proveedor.class, "Seleccione un proveedor:");
        
        // Mostrar y solicitar la medida
        Medida medida = seleccionarEnum(Medida.class, "Seleccione el tipo de medida:");
        
        // Mostrar y solicitar la ubicación
        Ubicacion ubicacion = seleccionarEnum(Ubicacion.class, "Seleccione una ubicación:");
        
        boolean estado = JOptionPane.showConfirmDialog(null, "¿Está activo?") == JOptionPane.YES_OPTION;

        return new Producto(codigo, nombre, categoria, marca, precioCompra, stock, proveedor, medida, ubicacion, estado);
    }

    private static <T extends Enum<T>> T seleccionarEnum(Class<T> enumClass, String mensaje) {
        // Construir el mensaje con las opciones del enum
        StringBuilder menu = new StringBuilder(mensaje + "\n");
        T[] enumValues = enumClass.getEnumConstants();
        for (int i = 0; i < enumValues.length; i++) {
            menu.append("[").append(i).append("] ").append(enumValues[i].toString()).append("\n");
        }

        // Solicitar al usuario la selección del valor del enum
        int opcion = Integer.parseInt(JOptionPane.showInputDialog(menu.toString()));
        if (opcion >= 0 && opcion < enumValues.length) {
            return enumValues[opcion];
        } else {
            JOptionPane.showMessageDialog(null, "Opción inválida. Se asignará el primer valor.");
            return enumValues[0];  // Por defecto, si se ingresa una opción inválida
        }
    }
    
}

