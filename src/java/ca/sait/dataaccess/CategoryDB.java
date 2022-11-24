/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.dataaccess;

import ca.sait.models.Category;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author Arcto
 */
public class CategoryDB {
    public List<Category> getAll() {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();

        return em.createNamedQuery("Category.findAll", Category.class).getResultList();
    }
}
