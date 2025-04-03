/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cdpg.ep_04.cola;

import cdpg.ep_04.clases.Nodo;
import cdpg.ep_04.clases.Producto;
import javax.swing.JOptionPane;

public class Cola {
    private Nodo frente;
    private Nodo fin;
    private int tamaño;

    public Cola() {
        this.frente = null;
        this.fin = null;
        this.tamaño = 0;
    }

    public void encolar(Producto producto) {
        Nodo nuevo = new Nodo(producto); // Se crea un nodo con el producto
        if (fin != null) {
            fin.setSiguiente(nuevo); // Si la cola no está vacía, el nodo fin apunta al nuevo nodo
        }
        fin = nuevo; // El nuevo nodo se convierte en el final de la cola
        if (frente == null) {
            frente = nuevo; // Si la cola estaba vacía, el nuevo nodo es también el frente
        }
        tamaño++;
    }

    public Producto desencolar() {
        if (frente == null) {
            return null; // Cola vacía
        }
        Producto dato = (Producto) frente.getDato(); // Obtener el producto del frente
        frente = frente.getSiguiente(); // El frente avanza al siguiente nodo
        if (frente == null) {
            fin = null; // Si la cola queda vacía, el fin también se pone en null
        }
        tamaño--;
        return dato;
    }

    public Producto verPrimero() {
        return frente != null ? (Producto) frente.getDato() : null; // Ver el producto en el frente
    }

    public int getTamaño() {
        return tamaño;
    }

    public boolean estaVacia() {
        return frente == null;
    }

    public void mostrarCola() {
        if (frente == null) {
            JOptionPane.showMessageDialog(null, "La cola está vacía.");
        } else {
            StringBuilder sb = new StringBuilder("Contenido de la Cola:\n");
            Nodo actual = frente;
            while (actual != null) {
                Producto producto = (Producto) actual.getDato(); // Obtener el producto del nodo
                sb.append("Código: ").append(producto.getCodigo())
                  .append(", Nombre: ").append(producto.getNombre())
                  .append(", Stock: ").append(producto.getStock())
                  .append("\n");
                actual = actual.getSiguiente(); // Avanzar al siguiente nodo
            }
            JOptionPane.showMessageDialog(null, sb.toString());
        }
    }
}

