/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.mycompanylab2.finalexamen;

import java.util.Stack;

public class Pila {
    private Stack<Producto> pila;

    public Pila() {
        this.pila = new Stack<>();
    }

    
    public void registrarProducto(Producto producto) {
        pila.push(producto);
        System.out.println("Producto registrado: " + producto.getNombre());
    }

    
    public void mostrarProductos() {
        if (pila.isEmpty()) {
            System.out.println("La pila está vacía.");
            return;
        }
        System.out.println("Productos en la pila:");
        for (Producto producto : pila) {
            System.out.println(producto);
        }
    }

    
    public Producto buscarProducto(int id) {
        for (Producto producto : pila) {
            if (producto.getId() == id) {
                return producto;
            }
        }
        return null; 
    }

    
    public void actualizarProducto(int id, String nuevoNombre, int nuevaCantidad, double nuevoPrecio) {
        Stack<Producto> temporal = new Stack<>();
        boolean encontrado = false;

        while (!pila.isEmpty()) {
            Producto producto = pila.pop();
            if (producto.getId() == id) {
                producto.setNombre(nuevoNombre);
                producto.setCantidad(nuevaCantidad);
                producto.setPrecio(nuevoPrecio);
                encontrado = true;
            }
            temporal.push(producto);
        }

        while (!temporal.isEmpty()) {
            pila.push(temporal.pop());
        }

        if (encontrado) {
            System.out.println("Producto actualizado correctamente.");
        } else {
            System.out.println("Producto no encontrado.");
        }
    }

    // Eliminar un producto por ID
    public void eliminarProducto(int id) {
        Stack<Producto> temporal = new Stack<>();
        boolean encontrado = false;

        while (!pila.isEmpty()) {
            Producto producto = pila.pop();
            if (producto.getId() == id) {
                encontrado = true;
            } else {
                temporal.push(producto);
            }
        }

        while (!temporal.isEmpty()) {
            pila.push(temporal.pop());
        }

        if (encontrado) {
            System.out.println("Producto eliminado correctamente.");
        } else {
            System.out.println("Producto no encontrado.");
        }
    }

    // Ordenar productos por precio
    public void ordenarPorPrecio() {
        pila.sort((p1, p2) -> Double.compare(p1.getPrecio(), p2.getPrecio()));
        System.out.println("Productos ordenados por precio.");
    }
}