package service;

import dao.UserInfoDao;
import dto.OrderDto;

import java.util.List;

public class UserReportService {
    private static final UserReportService INSTANCE = new UserReportService();
    private final OrderService orderService = OrderService.getInstance();

    public String createUserReport(Integer userId) {
        List<OrderDto> orderDtoList = orderService.findOrdersByUserId(userId);
        StringBuilder userReport = new StringBuilder();
        for (OrderDto orderDto : orderDtoList) {
            String userOrders = String.format("Order Id: %s, User id: %s, Room id: %s, Begin time: %s, End time: %s, Condition: %s, Message: %s" + System.lineSeparator(),
                    orderDto.getId(), orderDto.getUserInfo(), orderDto.getRoom(), orderDto.getBeginTimeOfTheOrder(), orderDto.getEndTimeOfTheOrder(), orderDto.getCondition(), orderDto.getMessage());
            userReport.append(userOrders);
        }
        return userReport.toString();
    }
    public static UserReportService getInstance() {
        return INSTANCE;
    }
}