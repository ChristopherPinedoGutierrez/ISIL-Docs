/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package examenfinalalgoritmos;

/**
 *
 * @author spazz
 */


import java.util.InputMismatchException;
import java.util.Scanner;

public class Menu {
    private Inventario inventario;
    private Scanner scanner;

    public Menu() {
        inventario = new Inventario();
        scanner = new Scanner(System.in);
    }

    public void mostrarMenu() {
        int opcion;
        do {
            System.out.println("\n--- Sistema de Gestión de Inventario ---");
            System.out.println("1. Registrar producto");
            System.out.println("2. Mostrar productos");
            System.out.println("3. Buscar producto por ID");
            System.out.println("4. Actualizar producto");
            System.out.println("5. Eliminar producto");
            System.out.println("6. Ordenar productos por precio");
            System.out.println("0. Salir");

            opcion = obtenerOpcion();

            switch (opcion) {
                case 1:
                    registrarProducto();
                    break;
                case 2:
                    inventario.mostrarProductos();
                    break;
                case 3:
                    buscarProducto();
                    break;
                case 4:
                    actualizarProducto();
                    break;
                case 5:
                    eliminarProducto();
                    break;
                case 6:
                    inventario.ordenarProductosPorPrecio();
                    break;
                case 0:
                    System.out.println("Saliendo del sistema...");
                    break;
                default:
                    System.out.println("Opción no válida. Intente de nuevo.");
            }
        } while (opcion != 0);
    }

    private int obtenerOpcion() {
        int opcion = -1; // Inicializar con un valor no válido
        do {
            try {
                System.out.print("Ingrese una opción: ");
                opcion = scanner.nextInt();
                scanner.nextLine(); // Limpiar el buffer

                if (opcion >= 0 && opcion <= 6) {
                    break; // La opción es válida, salir del bucle
                } else {
                    System.out.println("Opción no válida. Intente de nuevo (0-6).");
                }
            } catch (InputMismatchException e) {
                System.out.println("Entrada no válida. Debe ingresar un número.");
                scanner.nextLine(); // Limpiar el buffer
            }
        } while (true);

        return opcion;
    }

    private void registrarProducto() {
        System.out.print("Ingrese el nombre del producto: ");
        String nombre = scanner.nextLine();
        System.out.print("Ingrese la descripción del producto: ");
        String descripcion = scanner.nextLine();
        System.out.print("Ingrese el precio del producto: ");
        double precio = obtenerDoubleConDosDecimales();
        System.out.print("Ingrese la cantidad del producto: ");
        int cantidad = obtenerEnteroPositivo();
        System.out.print("Ingrese el stock mínimo del producto: ");
        int stockMinimo = obtenerEnteroNoNegativo();
        inventario.registrarProducto(nombre, descripcion, precio, cantidad, stockMinimo);
    }

    private void buscarProducto() {
        do {
            try {
                System.out.print("Ingrese el ID del producto a buscar: ");
                int id = scanner.nextInt();
                scanner.nextLine();
                Producto producto = inventario.buscarProducto(id);
                if (producto != null) {
                    System.out.println("Producto encontrado:");
                    System.out.println(producto);
                } else {
                    System.out.println("Producto no encontrado.");
                }
                break;
            } catch (InputMismatchException e) {
                System.out.println("Entrada no válida. Debe ingresar un número para el ID.");
                scanner.nextLine();
            }
        } while (true);
    }

    private void actualizarProducto() {
        int id;
        do {
            try {
                System.out.print("Ingrese el ID del producto a actualizar: ");
                id = scanner.nextInt();
                scanner.nextLine(); // Limpiar el buffer
                if (inventario.buscarProducto(id) == null) {
                    System.out.println("Producto no encontrado con el ID: " + id);
                    return;
                }
                break;
            } catch (InputMismatchException e) {
                System.out.println("Entrada no válida. Debe ingresar un número para el ID.");
                scanner.nextLine(); // Limpiar el buffer
            }
        } while (true);

        System.out.print("Ingrese el nuevo nombre del producto: ");
        String nombre = scanner.nextLine();
        System.out.print("Ingrese la nueva descripción del producto: ");
        String descripcion = scanner.nextLine();
        System.out.print("Ingrese el nuevo precio del producto: ");
        double precio = obtenerDoubleConDosDecimales();
        System.out.print("Ingrese la nueva cantidad del producto: ");
        int cantidad = obtenerEnteroPositivo();
        System.out.print("Ingrese el nuevo stock mínimo del producto: ");
        int stockMinimo = obtenerEnteroNoNegativo();

        inventario.actualizarProducto(id, nombre, descripcion, precio, cantidad, stockMinimo);
    }

    private void eliminarProducto() {
        do {
            try {
                System.out.print("Ingrese el ID del producto a eliminar: ");
                int id = scanner.nextInt();
                scanner.nextLine();
                inventario.eliminarProducto(id);
                break;
            } catch (InputMismatchException e) {
                System.out.println("Entrada no válida. Debe ingresar un número para el ID.");
                scanner.nextLine();
            }
        } while (true);
    }

    private int obtenerEnteroPositivo() {
        int valor = 0;
        do {
            try {
                valor = scanner.nextInt();
                scanner.nextLine();
                if (valor <= 0) {
                    System.out.println("El valor debe ser mayor que cero. Intente de nuevo.");
                }
            } catch (InputMismatchException e) {
                System.out.println("Entrada no válida. Debe ingresar un número entero.");
                scanner.nextLine();
                valor = -1;
            }
        } while (valor <= 0);
        return valor;
    }

    private int obtenerEnteroNoNegativo() {
        int valor = -1;
        do {
            try {
                valor = scanner.nextInt();
                scanner.nextLine();
                if (valor < 0) {
                    System.out.println("El valor no puede ser negativo. Intente de nuevo.");
                }
            } catch (InputMismatchException e) {
                System.out.println("Entrada no válida. Debe ingresar un número entero.");
                scanner.nextLine();
                valor = -1;
            }
        } while (valor < 0);
        return valor;
    }

    private double obtenerDoubleConDosDecimales() {
        double valor = 0.0;
        do {
            try {
                valor = scanner.nextDouble();
                scanner.nextLine();
                if (valor <= 0) {
                    System.out.println("El valor debe ser mayor que cero. Intente de nuevo.");
                } else if (String.valueOf(valor).split("\\.")[1].length() > 2) {
                    System.out.println("El valor debe tener como máximo dos decimales. Intente de nuevo.");
                } else {
                    break;
                }
            } catch (InputMismatchException e) {
                System.out.println("Entrada no válida. Debe ingresar un número (use punto para los decimales).");
                scanner.nextLine();
                valor = -1;
            }
        } while (true);
        return valor;
    }
}