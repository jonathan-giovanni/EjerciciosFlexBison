/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uso.pc24.comandosdml;

import GUI.EditorSQL;
import javax.swing.JFrame;

/**
 *
 * @author PC-24
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        EditorSQL editor = new EditorSQL();
        //editor.setExtendedState(JFrame.MAXIMIZED_BOTH); 
        editor.setVisible(true);
    }
    
}
