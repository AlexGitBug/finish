package service;

import dao.UserInfoDao;
import dto.OrderDto;
import entity.UserInfo;

import java.util.List;

public class AdminReportService {
    private static final AdminReportService INSTANCE = new AdminReportService();
    private final OrderService orderService = OrderService.getInstance();
    private final UserInfoDao userInfoDao = UserInfoDao.getInstance();

    public String createAdminReport() {
        List<OrderDto> orderDtoList = orderService.findAll();
        StringBuilder userReport = new StringBuilder();
        for (OrderDto orderDto : orderDtoList) {
            String userOrders = String.format("Order Id: %s, User id: %s, Room id: %s, Begin time: %s, End time: %s, Condition: %s, Message: %s" + System.lineSeparator(),
                    orderDto.getId(), orderDto.getUserInfo(), orderDto.getRoom(), orderDto.getBeginTimeOfTheOrder(), orderDto.getEndTimeOfTheOrder(), orderDto.getCondition(), orderDto.getMessage());
            userReport.append(userOrders);

        }
        return userReport.toString();
    }


    public static AdminReportService getInstance() {
        return INSTANCE;
    }
}