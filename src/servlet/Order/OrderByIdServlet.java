package servlet.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.OrderService;
import util.JspHelper;

import java.io.IOException;

import static util.UrlPath.ORDER_SERVLET_BY_ORDER_ID;

@WebServlet(ORDER_SERVLET_BY_ORDER_ID)
public class OrderByIdServlet extends HttpServlet {

    private final OrderService orderService = OrderService.getInstance();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer orderId = Integer.valueOf(req.getParameter("orderId"));
        req.setAttribute("order", orderService.findById(orderId));
        req.getRequestDispatcher(JspHelper.getPath("orderbyid"))
                .forward(req, resp);

    }

}