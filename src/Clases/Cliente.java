
package Clases;


public class Cliente {
    private String apellido_pat;
    private String apellido_mat;
    private String nombre;

    //Constructor
    public Cliente(String apellido_pat, String apellido_mat, String nombre) {
        this.apellido_pat = apellido_pat;
        this.apellido_mat = apellido_mat;
        this.nombre = nombre;
    }
    
    //Getter y Setters
    public String getApellido_pat() {
        return apellido_pat;
    }

    public String getApellido_mat() {
        return apellido_mat;
    }

    public String getNombre() {
        return nombre;
    }

    public void setApellido_pat(String apellido_pat) {
        this.apellido_pat = apellido_pat;
    }

    public void setApellido_mat(String apellido_mat) {
        this.apellido_mat = apellido_mat;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
