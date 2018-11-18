/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

/**
 *
 * @author admin
 */
public class ParametrosConexion {
    public String user;
    public String pass;
    public String bd;
    public String host;
    public ParametrosConexion(String user, String pass, String bd, String host) {
        this.user = user;
        this.pass = pass;
        this.bd = bd;
        this.host = host;
    }
}
