package servlet.Admin;

import entity.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.OrderService;
import util.JspHelper;

import java.io.IOException;


import static util.UrlPath.CHECK_ORDER_BOOKED_FREE;

@WebServlet(CHECK_ORDER_BOOKED_FREE)
public class CheckOrderBookedFreeServlet extends HttpServlet {
    private final OrderService orderService = OrderService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var orderId = Integer.valueOf(req.getParameter("orderId"));

        var order = orderService.findOrderById(orderId);
        forwardCheckedExistingOrder(req, resp, order);

        req.getRequestDispatcher(JspHelper.getPath("checkorder"))
                .forward(req, resp);
    }

    private void forwardCheckedExistingOrder(HttpServletRequest req, HttpServletResponse resp, Order order) {
        orderService.setFreeStatusRoom(order);
        req.setAttribute("order", orderService.findAll());
        try {
            req.getRequestDispatcher(JspHelper.getPath("adminpage"))
                    .forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}