
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class conectate {
    
    protected Connection conexion = null;	
    // JDBC driver nombre y url de la Base de Datos
    private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private final String DB_URL = "jdbc:mysql://localhost/proyecto_basico_transporte";

    // datos de conexión base de datos
    private final String USER = "root";
    private final String PASS = "123456";	

    public void conectar() throws Exception{	        
        try{
            Class.forName(JDBC_DRIVER);
            conexion = DriverManager.getConnection(DB_URL, USER, PASS);	
        }catch(Exception e){
            throw e;
        }
    }

    public void desconectar() throws SQLException{
        if (!conexion.isClosed()){
                conexion.close();			
        }
    }
    
    public ResultSet Listar (String Cad){
        try{
            Class.forName(JDBC_DRIVER).newInstance();
            Connection cn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            PreparedStatement da = cn.prepareStatement(Cad);
            ResultSet tbl = da.executeQuery();
            return tbl;
        }catch (ClassNotFoundException | InstantiationException | IllegalAccessException| SQLException e) {            
            javax.swing.JOptionPane.showMessageDialog(null, e.getMessage());
            return null;            
        }
        
    }
    
    public String Ejecutar(String Cad){
        try{
            Class.forName(JDBC_DRIVER).newInstance();
            Connection cn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            PreparedStatement da = cn.prepareStatement(Cad);
            int tbl = da.executeUpdate();
            return "REGISTROS GRABADOS CON EXITO";
            
        }catch (ClassNotFoundException | InstantiationException | IllegalAccessException| SQLException e) {            
            javax.swing.JOptionPane.showMessageDialog(null, e.getMessage());
            return "Error: " + e.getMessage();
        }
    }
    
}
    

