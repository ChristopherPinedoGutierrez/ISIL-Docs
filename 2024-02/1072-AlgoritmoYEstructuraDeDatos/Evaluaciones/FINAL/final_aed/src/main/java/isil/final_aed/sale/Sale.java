
package isil.final_aed.sale;

import isil.final_aed.client.Client;
import isil.final_aed.product.Product;
import java.time.LocalDate;

public class Sale {
    private Client client;
    private Product product;
    private LocalDate date;
    private int quantity;

    public Sale(Client client, Product product, int quantity) {
        this.client = client;
        this.product = product;
        this.date = LocalDate.now();
        this.quantity = quantity;
    }

    public String getSaleDetails() {
        return "Venta: " + product.getName() + " | Cliente: " + client.getName() + " | Fecha: " + date + " | Cantidad: " + quantity + " | Total: " + (product.getPrice() * quantity);
    }

    // Getters and Setters
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
