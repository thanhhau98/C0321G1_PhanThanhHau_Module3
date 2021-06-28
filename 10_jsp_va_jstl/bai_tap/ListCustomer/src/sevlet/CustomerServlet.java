package sevlet;

import bean.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"","/list"})
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20",
                "Hà Nội", "https://phunugioi.com/wp-content/uploads/2020/03/hot-girl-trung-quoc-dep-ngot-ngao.jpg" ) );
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21",
                "Bắc Giang", "https://img3.thuthuatphanmem.vn/uploads/2019/06/17/hinh-anh-hot-girl-trung-quoc-dep-nhat_103852377.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22",
                "Nam Định", "https://anhdep123.com/wp-content/uploads/2021/02/hinh-anh-gai-xinh-trung-quoc-1.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17",
                "Hà Tây", "https://thuthuatnhanh.com/wp-content/uploads/2020/02/anh-mang-cute-girl-xinh-390x390.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19",
                "Hà Nội", "https://i.pinimg.com/originals/ab/12/5b/ab125b922803e0183f0cde1c15603747.jpg"));

        request.setAttribute("customerListServlet", customerList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
