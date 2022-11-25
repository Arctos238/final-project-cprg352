/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.services;

import ca.sait.dataaccess.CategoryDB;
import ca.sait.models.Category;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author Arcto
 */
public class CategoryService {
    public List<Category> getAll() {
        CategoryDB cateDb = new CategoryDB();
        
        return cateDb.getAll();
    }

    public void addCategory(String newCategoryName) {
        if(newCategoryName != null) {
            CategoryDB cateDb = new CategoryDB();
            Category newCategory = new Category(getNextCategoryIdNumber(), newCategoryName);
           
            cateDb.addCategory(newCategory);
            
        }
    }
    
    private int getNextCategoryIdNumber() {
        Vector<Category> CategoryList = (Vector<Category>) getAll();

        return CategoryList.get(CategoryList.size() - 1).getCategoryId() + 1;
    }

    public void updateCategory(Category selectedCategory) {
        if(selectedCategory != null) {
            CategoryDB categoryDb = new CategoryDB();
            
            categoryDb.updateCategory(selectedCategory);
        }
    }
}
