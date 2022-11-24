/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.dataaccess;

import ca.sait.models.Item;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

/**
 *
 * @author Arcto
 */
public class ItemDB {
    
    public List<Item> getAll() {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();
        
        EntityManager em = emFactory.createEntityManager();
        
        return em.createNamedQuery("Item.findAll", Item.class).getResultList();
    }
    
    public boolean updateItem(Item item) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();
        EntityManager em = emFactory.createEntityManager();
        Item ref = em.find(Item.class, item.getItemId());
        
        ref.setItemName(item.getItemName());
        ref.setCategory(item.getCategory());
        ref.setPrice(item.getPrice());
        
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
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

    public boolean createItem(Item item) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(item);
            em.getTransaction().commit();

            return true;
        } catch (Exception ex) {
            em.getTransaction().rollback();

            return false;
        } finally {
            em.close();
        }
    }
    
    public void deleteItem(Item item) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();

        EntityTransaction trans = em.getTransaction();

        Item ref = em.find(Item.class, item.getItemId());

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
}
