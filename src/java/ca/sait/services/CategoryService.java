/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.services;

import ca.sait.dataaccess.CategoryDB;
import ca.sait.models.Category;
import java.util.List;

/**
 *
 * @author Arcto
 */
public class CategoryService {
    public List<Category> getAll() {
        CategoryDB cateDb = new CategoryDB();
        
        return cateDb.getAll();
    }
}
