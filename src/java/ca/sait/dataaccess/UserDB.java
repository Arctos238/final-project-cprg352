/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.dataaccess;

import ca.sait.models.Role;
import ca.sait.models.User;
import ca.sait.services.RoleService;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

/**
 *
 * @author Arcto
 */
public class UserDB {

    public UserDB() {

    }
    
    public boolean createUser(User user) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();
        
        User userCheck = getUser(user.getEmail());
        
        if (userCheck != null) {
            return false;
        }
        
       

        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();

            return true;
        } catch (Exception ex) {
            em.getTransaction().rollback();

            return false;
        } finally {
            em.close();
        }

    }

    public void deleteUser(User user) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();

        EntityTransaction trans = em.getTransaction();

        User ref = em.find(User.class, user.getEmail());

        try {
            trans.begin();
            em.remove(ref);
            trans.commit();

        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }

    }

    public boolean updateUser(User user) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();
        EntityManager em = emFactory.createEntityManager();
        User ref = em.find(User.class, user.getEmail());

        ref.setActive(user.getActive());
        ref.setFirstName(user.getFirstName());
        ref.setLastName(user.getLastName());
        ref.setRole(user.getRole());
        
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.persist(ref);
            trans.commit();
            return true;
        } catch (Exception ex) {
            trans.rollback();
            return false;
        } finally {
            em.close();
        }
    }
    
     public boolean updateUser(User user, String oldEmail) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();
        EntityManager em = emFactory.createEntityManager();
        
        User oldUser = getUser(oldEmail);
        deleteUser(oldUser);
        
        return createUser(user);
        
    }

    public List<User> getAll() {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();

        return em.createNamedQuery("User.findAll", User.class).getResultList();
    }

    public User getUser(String userEmail) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();
        
        Query query  = em.createNamedQuery("User.findByEmail");

        query.setParameter("email", userEmail);
        
        
        try {
            User userCheck = (User) query.getResultList().get(0);
            
            return userCheck;
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
        
        
        
        
    }
}
