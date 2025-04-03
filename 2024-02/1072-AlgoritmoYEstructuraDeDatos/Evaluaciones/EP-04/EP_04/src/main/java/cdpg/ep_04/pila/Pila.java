/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cdpg.ep_04.pila;

import cdpg.ep_04.clases.Nodo;
import cdpg.ep_04.clases.Producto;
import javax.swing.JOptionPane;

public class Pila {
    private Nodo tope;
    private int tamaño;

    public Pila() {
        this.tope = null;
        this.tamaño = 0;
    }

    public void apilar(Producto producto) {
        Nodo nuevo = new Nodo(producto); // Se crea un nodo con el producto
        nuevo.setSiguiente(tope); // El siguiente del nuevo nodo es el tope actual
        tope = nuevo; // El nuevo nodo pasa a ser el tope
        tamaño++;
    }

    public Producto desapilar() {
        if (tope == null) {
            return null; // Pila vacía
        }
        Producto dato = (Producto) tope.getDato(); // Obtener el producto del tope
        tope = tope.getSiguiente(); // El tope avanza al siguiente nodo
        tamaño--;
        return dato;
    }

    public Producto verTope() {
        return tope != null ? (Producto) tope.getDato() : null; // Ver el producto en el tope
    }

    public int getTamaño() {
        return tamaño;
    }

    public void mostrarPila() {
        if (tope == null) {
            JOptionPane.showMessageDialog(null, "La pila está vacía.");
        } else {
            StringBuilder sb = new StringBuilder("Contenido de la Pila:\n");
            Nodo actual = tope;
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
