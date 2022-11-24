/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.services;

import ca.sait.dataaccess.UserDB;
import ca.sait.models.Item;
import ca.sait.models.User;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author J.Pointer
 */
public class UserService {

    public UserService() {

    }

    public User getUser(String userEmail, String userPassword) {
        UserDB userDb = new UserDB();

        User user = userDb.getUser(userEmail);

        if (user != null && userPassword.equals(user.getPassword())) {
            return user;
        } else {
            return null;
        }
    }

    public List<User> getAll() {
        UserDB userDb = new UserDB();

        return userDb.getAll();
    }

    public void updateUser(User user) {
        if (user != null) {
            UserDB uDb = new UserDB();

            uDb.updateUser(user);
        }
    }

    public boolean updateUserInfo(User newUserInfo, User oldUserInfo) {
        if (newUserInfo != null) {
            UserDB uDb = new UserDB();
            ItemService itemService = new ItemService();

            /**
             * This will check to make sure no one has already used this new
             * email in the system.
             */
            if (!newUserInfo.getEmail().equals(oldUserInfo.getEmail())) {
                User checkUserEmail = uDb.getUser(newUserInfo.getEmail());

                if (checkUserEmail != null) {
                    return false;
                }
            }

            // Perserves all users items
            Vector<Item> usersItems = itemService.getAll(oldUserInfo);
            
             for (Item item : usersItems) {
                    itemService.deleteItem(item);
                }

            Boolean updated = uDb.updateUser(newUserInfo, oldUserInfo.getEmail());

            if (updated) {
                for (Item item : usersItems) {
                    item.setOwner(newUserInfo);
                    itemService.createItem(item);
                }
                return true;
            }

            return false;
        }

        return false;
    }

    public void deleteUser(User user) {
        if (user != null) {
            UserDB udb = new UserDB();

            udb.deleteUser(user);
        }
    }

    public boolean createUser(User user) {
        if (user != null) {
            UserDB udb = new UserDB();

            return udb.createUser(user);
        }

        return false;
    }
}
