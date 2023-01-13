package servlet.User;

import dto.OrderDto;
import dto.UserInfoDto;
import entity.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.OrderService;
import service.UserInfoService;
import util.JspHelper;

import java.io.IOException;
import java.util.List;

import static util.UrlPath.CANCEL_ORDER_MESSAGE;

@WebServlet(CANCEL_ORDER_MESSAGE)
public class SendMessageForAdminServlet extends HttpServlet {

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
        orderService.sendCancelMessage(order);
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