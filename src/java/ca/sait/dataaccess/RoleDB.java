/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.dataaccess;

import ca.sait.models.Role;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author Arcto
 */
public class RoleDB {
    public RoleDB() {
        
    }
    
    public List<Role> getAll() {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();
        
        EntityManager em = emFactory.createEntityManager();
        
        try {
           return em.createNamedQuery("Role.findAll", Role.class).getResultList();

        } catch (Exception e){
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }
       
    }
}
