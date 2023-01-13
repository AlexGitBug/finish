package servlet.Order;

import dto.OrderDto;
import dto.UserInfoDto;
import entity.Enum.ConditionEnum;;
import entity.Enum.RoomStatusEnum;
import exception.ValidationException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.*;
import util.JspHelper;
import util.LocalDateFormatter;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import static util.UrlPath.*;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    private final OrderService orderService = OrderService.getInstance();
    private final UserInfoService userInfoService = UserInfoService.getInstance();
    private final RoomService roomService = RoomService.getInstance();
    private final RoleService roleService = RoleService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("roomlist", roomService.findAll());
        req.setAttribute("userinfoid", userInfoService.findAll());
        req.setAttribute("roomid", roomService.findAllFreeRoomNew());
        req.setAttribute("roles", roleService.findAll());
        req.setAttribute("conditions", ConditionEnum.values());
        req.setAttribute("roomfree", RoomStatusEnum.values());


        req.getRequestDispatcher(JspHelper.getPath("orders"))
                .forward(req, resp);
        req.getRequestDispatcher(JspHelper.getPath("userorderlist"))
                .forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var user = (UserInfoDto) req.getSession().getAttribute("user");
        var orderDto = OrderDto.builder()
                .userInfo(user.getId())
                .room(Integer.parseInt(req.getParameter("roomid")))
                .beginTimeOfTheOrder(req.getParameter("begintime"))
                .endTimeOfTheOrder(req.getParameter("endtime"))
                .condition(req.getParameter("conditions"))
                .message(req.getParameter("message"))
                .build();

        try {
            LocalDate beginDate = LocalDateFormatter.format(orderDto.getBeginTimeOfTheOrder());
            if (beginDate.isBefore(LocalDate.now())) {
                resp.sendRedirect(ORDER + "?begintime=" + req.getParameter("orders"));
            } else {
                orderService.create(orderDto);
                resp.sendRedirect(ORDER_DONE);
            }
        } catch (ValidationException exception) {
            req.setAttribute("errors", exception.getErrors());
            doGet(req, resp);
        }
    }

}