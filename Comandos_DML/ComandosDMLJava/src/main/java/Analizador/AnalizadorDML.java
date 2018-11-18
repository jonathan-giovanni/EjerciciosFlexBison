/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.Scanner;

/**
 *
 * @author admin
 */
public class AnalizadorDML {
public String procesar(){
    Process proceso;
    try{
        //crear el proceso para windows
        proceso = Runtime.getRuntime().exec ("dml.exe");
    }catch(IOException ex1){
        try{
            //crear el proceso para linux
            proceso = Runtime.getRuntime().exec ("./dml");
        }catch(IOException ex2){
            return  ex2.getMessage();
        }
    }
    try
    {
        OutputStreamWriter processWriter = new OutputStreamWriter(proceso.getOutputStream());
        processWriter.write(leer("dmlIn.txt"));
        processWriter.flush();
        processWriter.close();
        String out = leerSalidaEstandar(proceso.getInputStream());
        return out;
    }
    catch (IOException ioe)
    {
       return ioe.getMessage();
    }
}
    
    private String leerSalidaEstandar(InputStream stream){
        String temp="";
          Scanner scanner = new Scanner(stream);
          while(scanner.hasNextLine()){
            temp+=scanner.nextLine()+"\n";
          }
          return temp;
    }
      
    public String leer(String fileName){
        String line = null;
        String texto="";
        try {
            // FileReader reads text files in the default encoding.
            FileReader fileReader = 
                new FileReader(fileName);

            // Always wrap FileReader in BufferedReader.
            BufferedReader bufferedReader = 
                new BufferedReader(fileReader);

            while((line = bufferedReader.readLine()) != null) {
                texto+=line+'\n';
            }   

            // Always close files.
            bufferedReader.close();         
        }
        catch(FileNotFoundException ex) {
            System.out.println(
                "Unable to open file '" + 
                fileName + "'");                
        }
        catch(IOException ex) {
            System.out.println(
                "Error reading file '" 
                + fileName + "'");                  
            // Or we could just do this: 
            // ex.printStackTrace();
        }
        return texto;
    }
    
    public void escribir(String archivo,String contenido){

        try {
            // Assume default encoding.
            FileWriter fileWriter =
                new FileWriter(archivo);
            // Always wrap FileWriter in BufferedWriter.
            BufferedWriter bufferedWriter =
                new BufferedWriter(fileWriter);
            bufferedWriter.write(contenido);
            // Always close files.
            bufferedWriter.close();
        }
        catch(IOException ex) {
            System.out.println(
                "Error writing to file '"
                + archivo + "'");
        }
    }
    
}
