package model.repository.impl;

import model.bean.User;
import model.repository.BaseRepository;
import model.repository.UserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {

    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<User> findAll() {

            List<User> users = new ArrayList<>();

            try {
                Statement statement = this.baseRepository.getConnection().createStatement();
                ResultSet resultSet = statement.executeQuery("select * \n" +
                        "from users;");

                User user = null;
                while(resultSet.next()) {
                    user = new User();
                    user.setId(Integer.parseInt(resultSet.getString("id")));
                    user.setName(resultSet.getString("name"));
                    user.setEmail(resultSet.getString("email"));
                    user.setCountry(resultSet.getString("country"));

                    users.add(user);
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            return users;
    }

    @Override
    public boolean save(User user) {
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "insert into users(`name`,email,country)\n" +
                                    "values (?, ?, ?);"
                    );

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());

            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public User findById(int id) {
        User user = new User();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select  * \n" +
                            "from users\n" +
                            "where id = ?");

            preparedStatement.setString(1, id + "");

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user.setId(Integer.parseInt(resultSet.getString("id")));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return user;
    }

    @Override
    public List<User> findByCountry(String Country) {
        List<User> users = new ArrayList<>();
        User user ;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select  * \n" +
                            "from users\n" +
                            "where country = ?");

            preparedStatement.setString(1, Country );
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                user = new User();
                user.setId(Integer.parseInt(resultSet.getString("id")));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                users.add(user);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return users ;
    }

    @Override
    public void update(int id, User user) {
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "update users\n" +
                                    "set `name` = ? , email = ? , country = ?\n" +
                                    "where id = ?;"
                    );

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setString(4, id+"");

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void remove(int id) {
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "delete from users\n" +
                                    "where id = ?;\n"
                    );
            preparedStatement.setString(1, id+"");

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<User> orderByName() {
        List<User> users = new ArrayList<>();
        User user ;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select*\n" +
                            "from users\n" +
                            "order by `name`;");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                user = new User();
                user.setId(Integer.parseInt(resultSet.getString("id")));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                users.add(user);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return users ;
    }
}
