/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repositorio;

import java.util.ArrayList;
import java.util.List;
import negocios.Lutador;
/**
 *
 * @author samuel
 */
public class Repositoriolutador {
    
    private static Repositoriolutador myself = null;
    
    private List<Lutador> lutadores= null;
    private static int lastId = 1;
    
    private Repositoriolutador(){
        this.lutadores= new ArrayList<>();
    }
    
    public static Repositoriolutador getCurrentInstance(){
        
        if(myself == null)
            myself = new Repositoriolutador();
        
        return myself;
        
    }
    
    public void inserir(Lutador l){
        l.setId(lastId++);
        this.lutadores.add(l);
    }
    
    public void alterar(Lutador l){
        for(Lutador lAux : this.lutadores){
            
            if(lAux.getId() == l.getId()){
                lAux.setApelido(l.getApelido());
                lAux.setNome(l.getNome());
                lAux.setSenha(l.getSenha());
                lAux.setPeso(l.getPeso());
                lAux.setAltura(l.getAltura());
                lAux.setDestro(l.isDestro());
                lAux.setCurso(l.getCurso());
                lAux.setArtMarcial(l.getArtMarcial());
                lAux.setNascimento(l.getNascimento());
                lAux.setContatoEmergencia(l.getContatoEmergencia());
              
              
                return;
            }
            
        }
    }
    
    public Lutador ler(int id){
        for(Lutador lAux : this.lutadores){
            if(lAux.getId() == id){
                return lAux;
            }
        }
        return null;
    }
    
    public void remover(int id){
        Lutador l = null;
        for(Lutador lAux : this.lutadores){
            if(lAux.getId() == id){
                l = lAux;
                break;
            }
        }
        
        this.lutadores.remove(l);
    }
    
    public List<Lutador> lerTudo(){
        return this.lutadores;
    }
    
    
    
}