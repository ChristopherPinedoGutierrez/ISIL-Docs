
package isil.final_aed.product;

public enum Product {
    SMARTPHONE("Smartphone", 300.00),
    LAPTOP("Laptop", 600.00),
    TABLET("Tablet", 150.00),
    SMARTWATCH("Smartwatch", 100.00),
    EARPHONES("Earphones", 50.00),
    MONITOR("Monitor", 200.00),
    PRINTER("Printer", 120.00),
    KEYBOARD("Keyboard", 30.00),
    MOUSE("Mouse", 20.00),
    SPEAKERS("Speakers", 80.00);

    private final String name;
    private final double price;

    Product(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public static Product getByName(String name) {
        for (Product product : Product.values()) {
            if (product.getName().equalsIgnoreCase(name)) {
                return product;
            }
        }
        return null; // Si no se encuentra el producto
    }
}
