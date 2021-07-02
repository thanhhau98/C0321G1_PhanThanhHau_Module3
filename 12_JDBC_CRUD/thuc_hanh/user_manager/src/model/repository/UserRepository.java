package model.repository;

import model.bean.User;

import java.util.List;

public interface UserRepository {

    List<User> findAll();

    boolean save(User user);

    User findById(int id);

    List<User> findByCountry(String Country);

    void update(int id, User user);

    void remove(int id);

    List<User> orderByName ();

}
