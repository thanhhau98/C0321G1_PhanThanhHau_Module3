package model.service.Impl;

import model.bean.User;
import model.repository.UserRepository;
import model.repository.impl.UserRepositoryImpl;
import model.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    UserRepository userRepository = new UserRepositoryImpl();


    @Override
    public List<User> findAll() {
        return this.userRepository.findAll();
    }

    @Override
    public boolean save(User user) {
        if (user.getName().matches("[A-Za-z ]+")) {
            return this.userRepository.save(user);
        }
        return false;
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public List<User> findByCountry(String country) {

        return userRepository.findByCountry(country);
    }

    @Override
    public void update(int id, User user) {
        userRepository.update(id, user);
    }

    @Override
    public void remove(int id) {
        userRepository.remove(id);
    }

    @Override
    public List<User> orderByName() {
        return userRepository.orderByName();
    }
}
