/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.services;

import ca.sait.dataaccess.ItemDB;
import ca.sait.models.Item;
import ca.sait.models.User;
import java.util.Vector;

/**
 *
 * @author J.Pointer
 */
public class ItemService {

    public Vector<Item> getAll(User user) {
        ItemDB itemDb = new ItemDB();

        Vector<Item> getAllItems = (Vector<Item>) itemDb.getAll();
        Vector<Item> usersItems = new Vector<Item>();

        for (Item item : getAllItems) {
            if (item.getOwner().getEmail().equals(user.getEmail())) {
                usersItems.add(item);
            }
        }

        return usersItems;
    }

    public void deleteItem(Item item) {
        if (item != null) {
            ItemDB itemDb = new ItemDB();

            itemDb.deleteItem(item);
        }
    }

    public boolean updateItem(Item item) {
        if (item != null) {
            ItemDB itemDb = new ItemDB();

            return itemDb.updateItem(item);
        }

        return false;
    }

    public boolean createItem(Item item) {
        if (item != null) {
            item.setItemId(getNextItemIdNumber());
            ItemDB itemDb = new ItemDB();
            
            return itemDb.createItem(item);

        }

        return false;
    }

    public int getNextItemIdNumber() {
        ItemDB itemDb = new ItemDB();

        Vector<Item> itemList = (Vector) itemDb.getAll();

        return itemList.get(itemList.size() - 1).getItemId() + 1;
    }
}
