/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.Scanner;

/**
 *
 * @author admin
 */
public class ConectorSingleton {
    ParametrosConexion parametrosGuardados=null; 
    public String estado;
    public boolean conectado=false;
    private static ConectorSingleton instance = null;
    protected ConectorSingleton() {
       // Exists only to defeat instantiation.
    }
    public static ConectorSingleton getInstance() {
       if(instance == null) {
          instance = new ConectorSingleton();
       }
       return instance;
    }
    public String conectar(ParametrosConexion parametros) {
        Process proceso = prepararConexion(parametros.user,parametros.pass,parametros.bd,parametros.host);
        try
        {
            conectado=false;
            OutputStreamWriter processWriter = new OutputStreamWriter(proceso.getOutputStream());
            processWriter.write("SELECT @@version;\n");
            processWriter.flush();
            processWriter.close();
            String out = leerSalidaEstandar(proceso.getInputStream());
            System.out.println(out);
            proceso.destroy();
            if(out.contains("version")){
                parametrosGuardados = parametros;
                conectado=true;
                return "Conectado";
            }else{
                return "No se pudo conectar";
            }
        }
        catch (IOException ioe)
        {
           return ioe.getMessage();
        }
    }
   private String leerSalidaEstandar(InputStream stream){
        String temp="";
          Scanner scanner = new Scanner(stream);
          if(scanner.hasNext()){
              String next = scanner.next();
              if(next.isEmpty())
              temp+= "[error]";
          }
          while(scanner.hasNextLine()){
            temp+=scanner.nextLine()+"\n";
          }
          return temp;
    }
   
  
   private Process prepararConexion(String user,String pass,String bd,String host){
       String conexion = "mysql -c -h"+host+" -u"+user+" -p"+pass+" "+bd+" --verbose -t -v -v -f";
       try{
            return Runtime.getRuntime().exec (conexion);
        }catch(IOException ex1){
            try{
                return Runtime.getRuntime().exec ("/usr/local/mysql/bin/"+conexion);
            }catch(IOException ex2){
                return null;
            }
        }
   }
   
   private String formatearResultado(String out,String error){
       String resultado="";
       out = out.replaceAll("Bye", "  ");
       String[] comandos_init   = out.split("((\\-{14})\\n(.+?)\\n(\\-{14}))");
       String[] errores_init    = error.split("ERROR");
       String[] comandos_final  = out.split("(?=((\\-{14})\\n(.+?)\\n(\\-{14})))");
       //System.out.println("Comienza analisis de errores-----------------");
       int contador_error=0;
       for(int i=1;i<comandos_init.length;i++){
           String tempC = comandos_init[i].trim();
           int inicio = comandos_final[i].lastIndexOf("--------------");
           String fin = comandos_final[i].substring(0,inicio+14);
           if(tempC.length()<4){
               resultado += "\n"+fin+"\nERROR"+errores_init[contador_error+1]+"\n";
               contador_error++;
           }else{
               resultado += comandos_final[i];
           }
       }
       return resultado;
   }
   
   
   
   public String enviarComandos(String comando){
       if(!conectado){
           return "No esta conectado a MySql";
       }else{
           Process proceso = prepararConexion(parametrosGuardados.user,parametrosGuardados.pass,parametrosGuardados.bd,parametrosGuardados.host);
           try{
                     
                OutputStreamWriter processWriter = new OutputStreamWriter(proceso.getOutputStream());  
                processWriter.write("tee mysqlOut.txt;\n");
                processWriter.flush();
                processWriter.write(comando);
                processWriter.flush();
                processWriter.close();
                String out      = leerSalidaEstandar(proceso.getInputStream());
                String error    = leerSalidaEstandar(proceso.getErrorStream());
                System.out.println(out);
                proceso.destroy();
                return formatearResultado(out, error);
            }
            catch (IOException ioe)
            {
               return "Error "+ioe.getMessage();
            }
       }
   }
      
}
