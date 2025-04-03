/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package examenfinalalgoritmos;

/**
 *
 * @author spazz
 */


import java.util.LinkedList;
import java.util.Queue;
import java.util.Comparator;
import java.util.Collections;

public class Inventario {
    private Queue<Producto> inventario = new LinkedList<>();
    private int contadorId = 1;

    // Registrar un nuevo producto
    public void registrarProducto(String nombre, String descripcion, double precio, int cantidad, int stockMinimo) {
        // Validaciones
        if (nombre == null || nombre.trim().isEmpty()) {
            System.out.println("Error: El nombre del producto no puede estar vacío.");
            return;
        }
        if (descripcion == null || descripcion.trim().isEmpty()) {
            System.out.println("Error: La descripción del producto no puede estar vacía.");
            return;
        }
        if (precio <= 0) {
            System.out.println("Error: El precio debe ser mayor que cero.");
            return;
        }
        if (cantidad <= 0) {
            System.out.println("Error: La cantidad debe ser mayor que cero.");
            return;
        }
        if (stockMinimo < 0) {
            System.out.println("Error: El stock mínimo no puede ser negativo.");
            return;
        }

        Producto producto = new Producto(contadorId++, nombre, descripcion, precio, cantidad, stockMinimo);
        inventario.add(producto);
        System.out.println("Producto registrado con éxito. ID: " + producto.getId());
        verificarStockMinimo(producto);
    }

    // Mostrar todos los productos
    public void mostrarProductos() {
        if (inventario.isEmpty()) {
            System.out.println("No hay productos en el inventario.");
            return;
        }
        System.out.println("Productos en el inventario:");
        for (Producto producto : inventario) {
            System.out.println(producto);
        }
    }

    // Buscar un producto por ID
    public Producto buscarProducto(int id) {
        for (Producto producto : inventario) {
            if (producto.getId() == id) {
                return producto;
            }
        }
        return null;
    }

    // Actualizar un producto
    public void actualizarProducto(int id, String nombre, String descripcion, double precio, int cantidad,
            int stockMinimo) {
        Producto producto = buscarProducto(id);
        if (producto == null) {
            System.out.println("Producto no encontrado. Considere registrarlo primero.");
            return;
        }

        // Validaciones
        if (nombre == null || nombre.trim().isEmpty()) {
            System.out.println("Error: El nombre del producto no puede estar vacío.");
            return;
        }
        if (descripcion == null || descripcion.trim().isEmpty()) {
            System.out.println("Error: La descripción del producto no puede estar vacía.");
            return;
        }
        if (precio <= 0) {
            System.out.println("Error: El precio debe ser mayor que cero.");
            return;
        }
        if (cantidad < 0) {
            System.out.println("Error: La cantidad no puede ser negativa.");
            return;
        }
        if (stockMinimo < 0) {
            System.out.println("Error: El stock mínimo no puede ser negativo.");
            return;
        }
        if (cantidad < stockMinimo) {
            System.out.println("Advertencia: La cantidad está por debajo del stock mínimo.");
        }

        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setPrecio(precio);
        producto.setCantidad(cantidad);
        producto.setStockMinimo(stockMinimo);
        System.out.println("Producto actualizado con éxito.");
        verificarStockMinimo(producto);
    }

    // Eliminar un producto
    public void eliminarProducto(int id) {
        Producto producto = buscarProducto(id);
        if (producto == null) {
            System.out.println("Producto no encontrado.");
            return;
        }
        inventario.remove(producto);
        System.out.println("Producto eliminado con éxito.");
    }

    // Ordenar productos por precio (de menor a mayor)
    public void ordenarProductosPorPrecio() {
        LinkedList<Producto> listaOrdenada = new LinkedList<>(inventario);
        Collections.sort(listaOrdenada, Comparator.comparingDouble(Producto::getPrecio));
        System.out.println("Productos ordenados por precio:");
        for (Producto producto : listaOrdenada) {
            System.out.println(producto);
        }
    }

    // Método para verificar y notificar si un producto está por debajo del stock
    // mínimo
    private void verificarStockMinimo(Producto producto) {
        if (producto.getCantidad() < producto.getStockMinimo()) {
            System.out.println("Advertencia: El producto '" + producto.getNombre() + "' (ID: " + producto.getId()
                    + ") está por debajo del stock mínimo.");
        }
    }
}