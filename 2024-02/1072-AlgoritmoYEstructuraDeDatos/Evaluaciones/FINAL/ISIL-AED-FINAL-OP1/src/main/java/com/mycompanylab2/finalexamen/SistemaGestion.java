/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.mycompanylab2.finalexamen;

import java.util.Scanner;

public class SistemaGestion {
    public static void main(String[] args) {
        Pila pila = new Pila();
        Scanner scanner = new Scanner(System.in);

        int opcion;

        do {
            System.out.println("\nSistema de Gestion de Inventarios");
            System.out.println("1. Registrar producto");
            System.out.println("2. Mostrar productos");
            System.out.println("3. Buscar producto");
            System.out.println("4. Actualizar producto");
            System.out.println("5. Eliminar producto");
            System.out.println("6. Ordenar productos por precio");
            System.out.println("0. Salir");
            System.out.print("Elige una opcion: ");
            opcion = scanner.nextInt();

            switch (opcion) {
                case 1:
                    System.out.print("ID: ");
                    int id = scanner.nextInt();
                    scanner.nextLine(); // Limpiar buffer
                    System.out.print("Nombre: ");
                    String nombre = scanner.nextLine();
                    System.out.print("Cantidad: ");
                    int cantidad = scanner.nextInt();
                    System.out.print("Precio: ");
                    double precio = scanner.nextDouble();

                    Producto producto = new Producto(id, nombre, cantidad, precio);
                    pila.registrarProducto(producto);
                    break;

                case 2:
                    pila.mostrarProductos();
                    break;

                case 3:
                    System.out.print("ID del producto a buscar: ");
                    int idBuscar = scanner.nextInt();
                    Producto encontrado = pila.buscarProducto(idBuscar);
                    if (encontrado != null) {
                        System.out.println("Producto encontrado: " + encontrado);
                    } else {
                        System.out.println("Producto no encontrado.");
                    }
                    break;

                case 4:
                    System.out.print("ID del producto a actualizar: ");
                    int idActualizar = scanner.nextInt();
                    scanner.nextLine(); // Limpiar buffer
                    System.out.print("Nuevo nombre: ");
                    String nuevoNombre = scanner.nextLine();
                    System.out.print("Nueva cantidad: ");
                    int nuevaCantidad = scanner.nextInt();
                    System.out.print("Nuevo precio: ");
                    double nuevoPrecio = scanner.nextDouble();

                    pila.actualizarProducto(idActualizar, nuevoNombre, nuevaCantidad, nuevoPrecio);
                    break;

                case 5:
                    System.out.print("ID del producto a eliminar: ");
                    int idEliminar = scanner.nextInt();
                    pila.eliminarProducto(idEliminar);
                    break;

                case 6:
                    pila.ordenarPorPrecio();
                    break;

                case 0:
                    System.out.println("Saliendo del sistema...");
                    break;

                default:
                    System.out.println("Opción no valida.");
            }
        } while (opcion != 0);

        scanner.close();
    }
}
