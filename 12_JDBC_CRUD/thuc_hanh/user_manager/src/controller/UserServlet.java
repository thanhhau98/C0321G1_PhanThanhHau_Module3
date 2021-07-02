package controller;

import model.bean.User;
import model.service.Impl.UserServiceImpl;
import model.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"","/users"})
public class UserServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createUser(request, response);
                break;
            case "edit":
                updateUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                break;
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User( name, email, country);
        this.userService.save(user);

        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        request.setAttribute("message", "New user was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = this.userService.findById(id);
        RequestDispatcher dispatcher;
        if(user == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setCountry(country);
            this.userService.update(id, user);
            request.setAttribute("user", user);
            request.setAttribute("message", "User information was updated");
            dispatcher = request.getRequestDispatcher("user/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.findById(id);
        RequestDispatcher dispatcher;
        if(user == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.userService.remove(id);
            List<User> users = this.userService.findAll();
            request.setAttribute("users",users);
            dispatcher =request.getRequestDispatcher("user/list.jsp");
            request.setAttribute("message", "User was deleted");
        }

            try {
                dispatcher.forward(request, response);
                response.sendRedirect("/users");
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "orderUser":
                orderUser(request, response);
                break;
            case "search":
                searchUser(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.findById(id);
        RequestDispatcher dispatcher;
        if(user == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("user", user);
            dispatcher = request.getRequestDispatcher("user/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.findById(id);
        RequestDispatcher dispatcher;
        if(user == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("user", user);
            dispatcher = request.getRequestDispatcher("user/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void  orderUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = this.userService.orderByName();
        request.setAttribute("users",users);
        RequestDispatcher dispatcher =request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) {
        String countrySearch = request.getParameter("search");
        List<User> users = this.userService.findByCountry(countrySearch);
        request.setAttribute("users",users);
        RequestDispatcher dispatcher =request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = this.userService.findAll();
        request.setAttribute("users",users);
        RequestDispatcher dispatcher =request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}