package servlet.Admin;

import dto.OrderDto;
import dto.UserInfoDto;
import entity.Enum.RoleEnum;
import entity.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.*;
import util.JspHelper;

import java.io.IOException;

import static util.UrlPath.CHECK_ORDER_EXISTING;

@WebServlet(CHECK_ORDER_EXISTING)
public class CheckOrderExistingServlet extends HttpServlet {

    private final QuantityBedService quantityBedService = QuantityBedService.getInstance();
    private final UserInfoService userInfoService = UserInfoService.getInstance();
    private final RoomService roomService = RoomService.getInstance();
    private final OrderService orderService = OrderService.getInstance();
    private final CategoryRoomService categoryRoomService = CategoryRoomService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer orderId = Integer.valueOf(req.getParameter("orderId"));
        Order orderById = orderService.findOrderById(orderId);
        forwardOrder(req, resp, orderById);
    }

    private void forwardOrder(HttpServletRequest req, HttpServletResponse resp, Order order) {
        UserInfoDto user = (UserInfoDto) req.getSession().getAttribute("user");
        req.setAttribute("order", orderService.findOrderById(order.getId()));
        req.setAttribute("userInfo", userInfoService.findUserInfoById(user.getId()));
        req.setAttribute("roomFromOrder", roomService.findRoomById(order.getRoom().getId()));
        req.setAttribute("categoryRoom", categoryRoomService.findCategoryRoomById(order.getRoom().getCategoryRoomId().getId()));
        req.setAttribute("quantityBed", quantityBedService.findQuantityBedById(order.getRoom().getQuantityBedId().getId()));

        try {
            if (user.getRole().getRank().equals(RoleEnum.ADMIN.name())) {
                req.getRequestDispatcher(JspHelper.getPath("checkorder"))
                        .forward(req, resp);
            } else {
                req.getRequestDispatcher(JspHelper.getPath("orderbyid"))
                        .forward(req, resp);
            }
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}