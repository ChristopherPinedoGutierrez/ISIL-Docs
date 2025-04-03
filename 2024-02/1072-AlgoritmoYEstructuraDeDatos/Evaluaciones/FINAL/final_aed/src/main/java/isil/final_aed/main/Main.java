/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package isil.final_aed.main;


import isil.final_aed.client.Client;
import isil.final_aed.client.ClientManager;
import isil.final_aed.product.Product;
import isil.final_aed.sale.Sale;
import isil.final_aed.sale.SaleManager;
import java.util.Queue;

import javax.swing.*;

public class Main {
    public static void main(String[] args) {
        ClientManager clientManager = new ClientManager();
        SaleManager saleManager = new SaleManager();

        // Añadir valores por defecto para clientes, ventas y productos
        addDefaultClients(clientManager);
        addDefaultSales(saleManager);

        while (true) {
            // Paso inicial: mostrar las opciones principales
            String[] options = {"Clientes", "Ventas", "Productos", "Salir"};
            int initialOption = JOptionPane.showOptionDialog(null, "Seleccione una opción", "Menú Principal",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, options, options[0]);

            // Salir si el usuario elige cerrar
            if (initialOption == 3) {
                JOptionPane.showMessageDialog(null, "Saliendo...");
                System.exit(0);
            }

            // Lógica según la opción seleccionada
            switch (initialOption) {
                case 0: // Clientes
                    handleClients(clientManager, saleManager);
                    break;
                case 1: // Ventas
                    handleSales(clientManager, saleManager);
                    break;
                case 2: // Productos
                    handleProducts();
                    break;
                default:
                    JOptionPane.showMessageDialog(null, "Opción no válida.");
            }
        }
    }

    // Añadir clientes por defecto
    private static void addDefaultClients(ClientManager clientManager) {
        clientManager.registerClient("Juan Pérez", "juan@example.com");
        clientManager.registerClient("Ana Gómez", "ana@example.com");
        clientManager.registerClient("Carlos Díaz", "carlos@example.com");
    }

    // Añadir ventas por defecto
    private static void addDefaultSales(SaleManager saleManager) {
        Client juan = new Client("Juan Pérez", "juan@example.com");
        Client ana = new Client("Ana Gómez", "ana@example.com");
        saleManager.registerSale(juan, Product.LAPTOP, 2);
        saleManager.registerSale(ana, Product.SMARTPHONE, 1);
    }

    // CRUD de Clientes
    private static void handleClients(ClientManager clientManager, SaleManager saleManager) {
        while (true) {
            // Opciones del menú de clientes como una lista de botones
            String[] clientOptions = {"Registrar Cliente", "Ver Clientes", "Actualizar Cliente", "Eliminar Cliente", "Volver"};

            // Mostrar el menú de clientes con botones
            int clientOption = JOptionPane.showOptionDialog(null, "Seleccione una opción de Cliente", "Clientes",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, clientOptions, clientOptions[0]);

            // Verificar si se seleccionó "Volver" o si se cerró la ventana
            if (clientOption == -1 || clientOption == 4) {
                return; // Salir del CRUD de clientes
            }

            switch (clientOption) {
                case 0: // Registrar Cliente
                    String name = JOptionPane.showInputDialog("Ingrese el nombre del cliente:");
                    String email = JOptionPane.showInputDialog("Ingrese el correo del cliente:");
                    clientManager.registerClient(name, email);
                    break;
                case 1: // Ver Clientes
                    // Mostrar los clientes de forma ordenada en un JOptionPane
                    StringBuilder clientList = new StringBuilder("Clientes:\n");
                    int index = 1;
                    for (Client client : clientManager.getClients()) {
                        clientList.append(index++).append(". ").append(client.getName()).append("\n");
                    }
                    JOptionPane.showMessageDialog(null, clientList.toString());
                    break;
                case 2: // Actualizar Cliente
                    // Crear una lista numerada de clientes para seleccionar por número
                    StringBuilder clientListToUpdate = new StringBuilder("Seleccione el cliente a actualizar (por número):\n");
                    index = 1;
                    for (Client client : clientManager.getClients()) {
                        clientListToUpdate.append(index++).append(". ").append(client.getName()).append("\n");
                    }

                    String updateClientIndex = JOptionPane.showInputDialog(clientListToUpdate.toString());
                    int clientToUpdateIndex;
                    try {
                        clientToUpdateIndex = Integer.parseInt(updateClientIndex) - 1;
                        if (clientToUpdateIndex < 0 || clientToUpdateIndex >= clientManager.getClients().size()) {
                            throw new NumberFormatException();
                        }
                    } catch (NumberFormatException e) {
                        JOptionPane.showMessageDialog(null, "Entrada no válida.");
                        continue;
                    }

                    // Obtener el cliente seleccionado
                    Client clientToUpdate = (Client) clientManager.getClients().toArray()[clientToUpdateIndex];
                    String newName = JOptionPane.showInputDialog("Ingrese el nuevo nombre para " + clientToUpdate.getName() + ":");
                    String newEmail = JOptionPane.showInputDialog("Ingrese el nuevo correo para " + clientToUpdate.getName() + ":");
                    clientManager.updateClient(clientToUpdate.getName(), newName, newEmail);
                    break;
                case 3: // Eliminar Cliente
                    // Crear una lista numerada de clientes para seleccionar por número
                    StringBuilder clientListToDelete = new StringBuilder("Seleccione el cliente a eliminar (por número):\n");
                    index = 1;
                    for (Client client : clientManager.getClients()) {
                        clientListToDelete.append(index++).append(". ").append(client.getName()).append("\n");
                    }

                    String deleteClientIndex = JOptionPane.showInputDialog(clientListToDelete.toString());
                    int clientToDeleteIndex;
                    try {
                        clientToDeleteIndex = Integer.parseInt(deleteClientIndex) - 1;
                        if (clientToDeleteIndex < 0 || clientToDeleteIndex >= clientManager.getClients().size()) {
                            throw new NumberFormatException();
                        }
                    } catch (NumberFormatException e) {
                        JOptionPane.showMessageDialog(null, "Entrada no válida.");
                        continue;
                    }

                    // Obtener el cliente seleccionado
                    Client clientToDelete = (Client) clientManager.getClients().toArray()[clientToDeleteIndex];
                    clientManager.deleteClient(clientToDelete.getName());
                    break;
                default:
                    JOptionPane.showMessageDialog(null, "Opción no válida.");
            }
        }
    }
    // CRUD de Ventas
    private static void handleSales(ClientManager clientManager, SaleManager saleManager) {
        while (true) {
            String[] saleOptions = {"Registrar Venta", "Ver Ventas", "Actualizar Venta", "Eliminar Venta", "Volver"};
            int saleOption = JOptionPane.showOptionDialog(null, "Seleccione una opción de Venta", "Ventas",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, saleOptions, saleOptions[0]);

            if (saleOption == -1 || saleOption == 4) {
                return;
            }

            switch (saleOption) {
                case 0: // Registrar Venta
                // Lista numerada de clientes
                StringBuilder clientMenu = new StringBuilder("Seleccione un cliente:\n");
                int clientIndex = 1;
                for (Client client : clientManager.getClients()) {
                    clientMenu.append(clientIndex++).append(". ").append(client.getName()).append("\n");
                }
                String clientChoiceStr = JOptionPane.showInputDialog(clientMenu.toString());
                int clientChoice;
                try {
                    clientChoice = Integer.parseInt(clientChoiceStr) - 1;
                    if (clientChoice < 0 || clientChoice >= clientManager.getClients().size()) {
                        throw new NumberFormatException();
                    }
                } catch (NumberFormatException e) {
                    JOptionPane.showMessageDialog(null, "Selección no válida.");
                    break;
                }
                Client selectedClient = clientManager.getClients().toArray(new Client[0])[clientChoice];

                // Lista numerada de productos
                StringBuilder productMenu = new StringBuilder("Seleccione un producto:\n");
                Product[] products = Product.values();
                for (int i = 0; i < products.length; i++) {
                    productMenu.append(i + 1).append(". ").append(products[i].getName())
                               .append(" - $").append(products[i].getPrice()).append("\n");
                }
                String productChoiceStr = JOptionPane.showInputDialog(productMenu.toString());
                int productChoice;
                try {
                    productChoice = Integer.parseInt(productChoiceStr) - 1;
                    if (productChoice < 0 || productChoice >= products.length) {
                        throw new NumberFormatException();
                    }
                } catch (NumberFormatException e) {
                    JOptionPane.showMessageDialog(null, "Selección no válida.");
                    break;
                }
                Product selectedProduct = products[productChoice];

                // Solicitar la cantidad
                String quantityStr = JOptionPane.showInputDialog("Ingrese la cantidad:");
                int quantity;
                try {
                    quantity = Integer.parseInt(quantityStr);
                    if (quantity <= 0) throw new NumberFormatException();
                } catch (NumberFormatException e) {
                    JOptionPane.showMessageDialog(null, "Cantidad no válida.");
                    break;
                }

                // Registrar la venta
                saleManager.registerSale(selectedClient, selectedProduct, quantity);
                JOptionPane.showMessageDialog(null, "Venta registrada exitosamente.");
                break;

                case 1: // Ver Ventas
                    StringBuilder saleList = new StringBuilder("Ventas:\n");
                    int saleIndex = 1;
                    for (Sale sale : saleManager.getSales()) {
                        saleList.append(saleIndex++).append(". ").append(sale.getSaleDetails()).append("\n");
                    }
                    JOptionPane.showMessageDialog(null, saleList.toString());
                    break;

                case 2: // Actualizar Venta
                    // Implementación actual permanece igual
                    break;

                case 3: // Eliminar Venta
                    // Implementación actual permanece igual
                    break;

                default:
                    JOptionPane.showMessageDialog(null, "Opción no válida.");
            }
        }
    }


    // Ver Productos
    private static void handleProducts() {
        StringBuilder productMenu = new StringBuilder("Productos disponibles:\n");
        for (int i = 0; i < Product.values().length; i++) {
            productMenu.append(i + 1).append(". ").append(Product.values()[i].getName())
                    .append(" - $").append(Product.values()[i].getPrice()).append("\n");
        }
        JOptionPane.showMessageDialog(null, productMenu.toString());
    }
}