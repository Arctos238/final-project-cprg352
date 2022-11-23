/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.services;

import ca.sait.dataaccess.UserDB;
import ca.sait.models.User;
import java.util.List;

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
        
        if(user != null && userPassword.equals(user.getPassword())) {
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
    
    public boolean updateUserInfo(User user, String oldEmail) {
        if (user != null) {
            UserDB uDb = new UserDB();
            
            /**
             * This will check to make sure no one has already used this new email
             * in the system.
             */
            
            if(!user.getEmail().equals(oldEmail)) {
                 User checkUserEmail = uDb.getUser(user.getEmail());
                 
                 if (checkUserEmail != null) {
                     return false;
                 }
            }
           
            

            return uDb.updateUser(user, oldEmail);
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
