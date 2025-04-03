/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cdpg.ep_04.clases;

import cdpg.ep_04.enums.Categoria;
import cdpg.ep_04.enums.Marca;
import cdpg.ep_04.enums.Proveedor;
import cdpg.ep_04.enums.Medida;
import cdpg.ep_04.enums.Ubicacion;

public class Producto {
    private int codigo;
    private String nombre;
    private Categoria categoria;
    private Marca marca;
    private double precioCompra;
    private double precioVenta;
    private int stock;
    private Proveedor proveedor;
    private Medida tipoMedida;
    private Ubicacion ubicacion;
    private boolean estado;

    // Constructor
    public Producto(int codigo, String nombre, Categoria categoria, Marca marca, double precioCompra, 
                    int stock, Proveedor proveedor, Medida tipoMedida, Ubicacion ubicacion, boolean estado) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.categoria = categoria;
        this.marca = marca;
        this.precioCompra = precioCompra;
        this.precioVenta = calcularPrecioVenta(precioCompra);
        this.stock = stock;
        this.proveedor = proveedor;
        this.tipoMedida = tipoMedida;
        this.ubicacion = ubicacion;
        this.estado = estado;
    }

    // Método para calcular el precio de venta
    private double calcularPrecioVenta(double precioCompra) {
        return precioCompra + (precioCompra * 0.15);  // Precio de venta es 15% más que el precio de compra
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

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
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

    @Override
    public String toString() {
        return "Producto{" +
                "codigo=" + codigo +
                ", nombre='" + nombre + '\'' +
                ", categoria=" + categoria +
                ", marca=" + marca +
                ", precioCompra=" + precioCompra +
                ", precioVenta=" + precioVenta +
                ", stock=" + stock +
                ", proveedor=" + proveedor +
                ", tipoMedida=" + tipoMedida +
                ", ubicacion=" + ubicacion +
                ", estado=" + estado +
                '}';
    }
}