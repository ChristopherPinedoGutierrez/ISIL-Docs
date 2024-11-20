/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cdpg.ep_03.clases;

public class Producto {

    private int codigo;
    private String nombre;
    private Categoria categoria;
    private Marca marca;
    private double precioCompra;
    private double precioVenta;
    private int stock;
    private Medida tipoMedida;
    private Ubicacion ubicacion;
    private boolean estado;

    // Constructor
    public Producto(int codigo, String nombre, Categoria categoria, Marca marca, double precioCompra,
                    double precioVenta, int stock, Medida tipoMedida, Ubicacion ubicacion, boolean estado) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.categoria = categoria;
        this.marca = marca;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
        this.stock = stock;
        this.tipoMedida = tipoMedida;
        this.ubicacion = ubicacion;
        this.estado = estado;
    }

    // Getters y Setters
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
        this.precioVenta = precioCompra * 1.15;  // Calcular automáticamente el precio de venta al modificar el precio de compra
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Medida getTipoMedida() {
        return tipoMedida;
    }

    public void setTipoMedida(Medida tipoMedida) {
        this.tipoMedida = tipoMedida;
    }

    public Ubicacion getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(Ubicacion ubicacion) {
        this.ubicacion = ubicacion;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}