package servlet.User;

import entity.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.OrderService;
import util.JspHelper;

import java.io.IOException;

import static util.UrlPath.PAY_ORDER;

@WebServlet(PAY_ORDER)
public class PayServlet extends HttpServlet {
    private final OrderService orderService = OrderService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var orderId = Integer.valueOf(req.getParameter("orderId"));

        var order = orderService.findOrderById(orderId);
        forwardOrder(req, resp, order);

        req.getRequestDispatcher(JspHelper.getPath("checkorder"))
                .forward(req, resp);
    }

    private void forwardOrder(HttpServletRequest req, HttpServletResponse resp, Order order) {
        orderService.payOrder(order);
        req.setAttribute("order", orderService.findAll());

        try {
            req.getRequestDispatcher(JspHelper.getPath("orders"))
                    .forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}