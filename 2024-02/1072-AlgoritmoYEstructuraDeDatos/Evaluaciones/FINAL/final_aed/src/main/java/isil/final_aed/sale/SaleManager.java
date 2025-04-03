
package isil.final_aed.sale;

import isil.final_aed.client.Client;
import isil.final_aed.product.Product;

import java.util.Stack;

public class SaleManager {
    private Stack<Sale> salesStack;

    public SaleManager() {
        salesStack = new Stack<>();
        // Añadimos ventas por defecto
        Client defaultClient = new Client("Juan Pérez", "juan@email.com");
        salesStack.push(new Sale(defaultClient, Product.SMARTPHONE, 2));
        salesStack.push(new Sale(defaultClient, Product.LAPTOP, 1));
        salesStack.push(new Sale(defaultClient, Product.TABLET, 3));
    }

    public void registerSale(Client client, Product product, int quantity) {
        salesStack.push(new Sale(client, product, quantity));
    }

    public void updateSale(Sale sale, String newProductName, int quantity) {
        // Obtener el producto por nombre
        Product newProduct = Product.getByName(newProductName);
        if (newProduct != null) {
            sale.setProduct(newProduct);  // Cambiar el producto en la venta
            sale.setQuantity(quantity);   // Mantener la cantidad
        } else {
            System.out.println("Producto no encontrado.");
        }
    }

    public void deleteSale(Sale sale) {
        salesStack.remove(sale);
    }

    // Método getter para obtener las ventas
    public Stack<Sale> getSales() {
        return salesStack;
    }

    public void displaySales() {
        salesStack.forEach(sale -> System.out.println(sale.getSaleDetails()));
    }
}
