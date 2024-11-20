/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cdpg.ep_03.main;

import cdpg.ep_03.clases.*;

import javax.swing.JOptionPane;
import java.util.LinkedList;

public class Main {

    public static void main(String[] args) {
        // Lista de productos
        LinkedList<Producto> productos = new LinkedList<>();
        
        // Menú de opciones
        while (true) {
            // Mostrar menú
            String[] options = {"Registrar Producto", "Mostrar Productos", "Actualizar Producto", "Eliminar Producto", "Salir"};
            int choice = JOptionPane.showOptionDialog(null, "Seleccione una opción", "Menú Principal",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, options, options[0]);

            switch (choice) {
                case 0:
                    // Registrar Producto
                    registrarProducto(productos);
                    break;
                case 1:
                    // Mostrar productos
                    mostrarProductos(productos);
                    break;
                case 2:
                    // Actualizar producto
                    actualizarProducto(productos);
                    break;
                case 3:
                    // Eliminar producto
                    eliminarProducto(productos);
                    break;
                case 4:
                    // Salir
                    JOptionPane.showMessageDialog(null, "¡Hasta pronto!");
                    return;
                default:
                    break;
            }
        }
    }

    // Función para registrar un producto
    private static void registrarProducto(LinkedList<Producto> productos) {
        try {
            // Pedir datos del producto
            String codigoStr = JOptionPane.showInputDialog("Ingrese el código del producto:");
            int codigo = Integer.parseInt(codigoStr);

            String nombre = JOptionPane.showInputDialog("Ingrese el nombre del producto:");

            // Validar categoría
            Categoria categoria = obtenerCategoria();

            // Validar marca
            Marca marca = obtenerMarca();

            String precioCompraStr = JOptionPane.showInputDialog("Ingrese el precio de compra del producto:");
            double precioCompra = Double.parseDouble(precioCompraStr);

            // Calcular el precio de venta (15% más del precio de compra)
            double precioVenta = precioCompra * 1.15;

            String stockStr = JOptionPane.showInputDialog("Ingrese la cantidad de stock:");
            int stock = Integer.parseInt(stockStr);

            // Validar tipo de medida
            Medida tipoMedida = obtenerMedida();

            // Validar ubicación
            Ubicacion ubicacion = obtenerUbicacion();

            boolean estado = true; // Estado predeterminado como activo

            // Crear el producto y añadirlo a la lista
            Producto producto = new Producto(codigo, nombre, categoria, marca, precioCompra, precioVenta, stock, tipoMedida, ubicacion, estado);
            productos.add(producto);

            // Mensaje de confirmación
            JOptionPane.showMessageDialog(null, "Producto registrado exitosamente.");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al registrar el producto. Por favor intente de nuevo.");
        }
    }

    // Validar y obtener categoría
    private static Categoria obtenerCategoria() {
        while (true) {
            StringBuilder sb = new StringBuilder();
            for (Categoria c : Categoria.values()) {
                sb.append(c.ordinal()).append(": ").append(c.name()).append("\n");
            }

            String categoriaStr = JOptionPane.showInputDialog("Seleccione la categoría del producto:\n" + sb.toString());
            try {
                int opcion = Integer.parseInt(categoriaStr);
                return Categoria.values()[opcion];
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Categoría no válida. Intente nuevamente.");
            }
        }
    }

    // Validar y obtener marca
    private static Marca obtenerMarca() {
        while (true) {
            StringBuilder sb = new StringBuilder();
            for (Marca m : Marca.values()) {
                sb.append(m.ordinal()).append(": ").append(m.name()).append("\n");
            }

            String marcaStr = JOptionPane.showInputDialog("Seleccione la marca del producto:\n" + sb.toString());
            try {
                int opcion = Integer.parseInt(marcaStr);
                return Marca.values()[opcion];
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Marca no válida. Intente nuevamente.");
            }
        }
    }

    // Validar y obtener medida
    private static Medida obtenerMedida() {
        while (true) {
            StringBuilder sb = new StringBuilder();
            for (Medida m : Medida.values()) {
                sb.append(m.ordinal()).append(": ").append(m.name()).append("\n");
            }

            String tipoMedidaStr = JOptionPane.showInputDialog("Seleccione la medida del producto:\n" + sb.toString());
            try {
                int opcion = Integer.parseInt(tipoMedidaStr);
                return Medida.values()[opcion];
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Medida no válida. Intente nuevamente.");
            }
        }
    }

    // Validar y obtener ubicación
    private static Ubicacion obtenerUbicacion() {
        while (true) {
            StringBuilder sb = new StringBuilder();
            for (Ubicacion u : Ubicacion.values()) {
                sb.append(u.ordinal()).append(": ").append(u.name()).append("\n");
            }

            String ubicacionStr = JOptionPane.showInputDialog("Seleccione la ubicación del producto:\n" + sb.toString());
            try {
                int opcion = Integer.parseInt(ubicacionStr);
                return Ubicacion.values()[opcion];
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Ubicación no válida. Intente nuevamente.");
            }
        }
    }

    // Función para mostrar los productos
    private static void mostrarProductos(LinkedList<Producto> productos) {
        StringBuilder sb = new StringBuilder();
        for (Producto producto : productos) {
            sb.append("Código: ").append(producto.getCodigo()).append("\n");
            sb.append("Nombre: ").append(producto.getNombre()).append("\n");
            sb.append("Categoría: ").append(producto.getCategoria()).append("\n");
            sb.append("Marca: ").append(producto.getMarca()).append("\n");
            sb.append("Precio Compra: ").append(producto.getPrecioCompra()).append("\n");
            sb.append("Precio Venta: ").append(producto.getPrecioVenta()).append("\n");
            sb.append("Stock: ").append(producto.getStock()).append("\n");
            sb.append("Medida: ").append(producto.getTipoMedida()).append("\n");
            sb.append("Ubicación: ").append(producto.getUbicacion()).append("\n");
            sb.append("Estado: ").append(producto.isEstado() ? "Activo" : "Inactivo").append("\n\n");
        }

        // Mostrar los productos
        if (productos.isEmpty()) {
            JOptionPane.showMessageDialog(null, "No hay productos registrados.");
        } else {
            JOptionPane.showMessageDialog(null, sb.toString(), "Productos", JOptionPane.INFORMATION_MESSAGE);
        }
    }

    // Función para actualizar un producto
    private static void actualizarProducto(LinkedList<Producto> productos) {
        String codigoStr = JOptionPane.showInputDialog("Ingrese el código del producto a actualizar:");
        int codigo = Integer.parseInt(codigoStr);

        Producto producto = null;
        for (Producto p : productos) {
            if (p.getCodigo() == codigo) {
                producto = p;
                break;
            }
        }

        if (producto == null) {
            JOptionPane.showMessageDialog(null, "Producto no encontrado.");
            return;
        }

        // Actualizar campos
        String nombre = JOptionPane.showInputDialog("Ingrese el nuevo nombre del producto (actual: " + producto.getNombre() + "):");
        producto.setNombre(nombre);

        // Validar nueva categoría
        producto.setCategoria(obtenerCategoria());

        // Validar nueva marca
        producto.setMarca(obtenerMarca());

        String precioCompraStr = JOptionPane.showInputDialog("Ingrese el nuevo precio de compra del producto (actual: " + producto.getPrecioCompra() + "):");
        producto.setPrecioCompra(Double.parseDouble(precioCompraStr));
        producto.setPrecioVenta(producto.getPrecioCompra() * 1.15);

        String stockStr = JOptionPane.showInputDialog("Ingrese la nueva cantidad de stock (actual: " + producto.getStock() + "):");
        producto.setStock(Integer.parseInt(stockStr));

        // Validar nuevo tipo de medida
        producto.setTipoMedida(obtenerMedida());

        // Validar nueva ubicación
        producto.setUbicacion(obtenerUbicacion());

        JOptionPane.showMessageDialog(null, "Producto actualizado exitosamente.");
    }

    // Función para eliminar un producto
    private static void eliminarProducto(LinkedList<Producto> productos) {
        String codigoStr = JOptionPane.showInputDialog("Ingrese el código del producto a eliminar:");
        int codigo = Integer.parseInt(codigoStr);

        Producto producto = null;
        for (Producto p : productos) {
            if (p.getCodigo() == codigo) {
                producto = p;
                break;
            }
        }

        if (producto == null) {
            JOptionPane.showMessageDialog(null, "Producto no encontrado.");
        } else {
            productos.remove(producto);
            JOptionPane.showMessageDialog(null, "Producto eliminado exitosamente.");
        }
    }
}