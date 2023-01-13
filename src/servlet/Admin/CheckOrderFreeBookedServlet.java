package servlet.Admin;

import dao.OrderDao;
import entity.Order;
import exception.ServiceException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.InfoOrderService;
import service.OrderService;
import util.JspHelper;

import java.io.IOException;

import static util.UrlPath.CHECK_ORDER;

@WebServlet(CHECK_ORDER)
public class CheckOrderFreeBookedServlet extends HttpServlet {

    private final OrderService orderService = OrderService.getInstance();
    private final OrderDao orderdao = OrderDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var orderId = Integer.valueOf(req.getParameter("orderId"));

        var order = orderService.findOrderById(orderId);
        forwardCheckedExistingOrder(req, resp, order);

        req.getRequestDispatcher(JspHelper.getPath("checkorder"))
                .forward(req, resp);
    }


    private void forwardCheckedExistingOrder(HttpServletRequest req, HttpServletResponse resp, Order order) {
        try {
            orderService.checkAndConfirmOrder(order);
        } catch (ServiceException e) {
            order.setMessage("Некорректные даты бронирования. Проверьте даты");
            orderdao.update(order);
        }
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
