/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package isil.final_aed.client;

import javax.swing.*;
import java.util.LinkedList;
import java.util.Queue;

public class ClientManager {
    private Queue<Client> clientQueue;

    public ClientManager() {
        clientQueue = new LinkedList<>();
        // Añadimos clientes por defecto
        clientQueue.add(new Client("Juan Pérez", "juan@email.com"));
        clientQueue.add(new Client("Ana García", "ana@email.com"));
        clientQueue.add(new Client("Luis Gómez", "luis@email.com"));
    }

    // Método para registrar un cliente
    public void registerClient(String name, String email) {
        clientQueue.add(new Client(name, email));
    }

    // Método para encontrar un cliente por nombre
    public Client findClient(String name) {
        for (Client client : clientQueue) {
            if (client.getName().equalsIgnoreCase(name)) {
                return client;
            }
        }
        return null;
    }

    // Método para actualizar un cliente
    public void updateClient(String oldName, String newName, String newEmail) {
        Queue<Client> tempQueue = new LinkedList<>();
        boolean updated = false;

        while (!clientQueue.isEmpty()) {
            Client client = clientQueue.poll();  // Obtiene el primer cliente
            if (client.getName().equalsIgnoreCase(oldName) && !updated) {
                tempQueue.add(new Client(newName, newEmail));  // Se actualiza el cliente
                updated = true;
            } else {
                tempQueue.add(client);  // Si no es el cliente a actualizar, lo agregamos sin cambios
            }
        }

        clientQueue = tempQueue;  // Reemplazamos la cola original con la nueva
    }

    // Método para eliminar un cliente
    public void deleteClient(String name) {
        Queue<Client> tempQueue = new LinkedList<>();

        while (!clientQueue.isEmpty()) {
            Client client = clientQueue.poll();  // Obtiene el primer cliente
            if (!client.getName().equalsIgnoreCase(name)) {
                tempQueue.add(client);  // Solo se agrega si no es el cliente a eliminar
            }
        }

        clientQueue = tempQueue;  // Reemplazamos la cola original con la nueva
    }

    // Método para mostrar los clientes
    public void displayClients() {
        if (clientQueue.isEmpty()) {
            JOptionPane.showMessageDialog(null, "No hay clientes registrados.");
        } else {
            StringBuilder clientList = new StringBuilder("Clientes registrados:\n");
            int index = 1;
            for (Client client : clientQueue) {
                clientList.append(index++).append(". ").append(client.getName()).append(" - ").append(client.getEmail()).append("\n");
            }
            JOptionPane.showMessageDialog(null, clientList.toString());
        }
    }

    // Método para obtener todos los clientes en la cola (útil para otras operaciones)
    public Queue<Client> getClients() {
        return clientQueue;
    }
}