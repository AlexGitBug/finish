package service;

import dao.OrderDao;

import dao.RoomDao;
import dto.OrderDto;
import entity.Enum.ConditionEnum;
import entity.Enum.RoomStatusEnum;
import entity.Order;
import exception.ServiceException;
import lombok.NoArgsConstructor;
import mapper.CreateOrderMapper;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;
import static lombok.AccessLevel.PRIVATE;

@NoArgsConstructor(access = PRIVATE)
public class OrderService {

    private static final OrderService INSTANCE = new OrderService();
    private final OrderDao orderDao = OrderDao.getInstance();
    private final RoomDao roomDao = RoomDao.getInstance();
    private final CreateOrderMapper createOrderMapper = CreateOrderMapper.getInstance();

    public Integer create(OrderDto orderDto) {
        var orderEntity = createOrderMapper.mapFrom(orderDto);
        orderDao.save(orderEntity);
        return orderEntity.getId();
    }

    public List<OrderDto> findOrdersByUserId(Integer userId) {
        var orderDtos = findAll();
        return orderDtos.stream()
                .filter(orderDto -> orderDto.getUserInfo().equals(userId))
                .collect(Collectors.toList());
    }

    public List<OrderDto> findById(Integer id) {
        return orderDao.findById(id).stream()
                .map(order -> OrderDto.builder()
                        .id(order.getId())
                        .userInfo(order.getUserInfo().getId())
                        .room(order.getRoom().getId())
                        .beginTimeOfTheOrder(order.getBeginTimeOfTheOrder().toString())
                        .endTimeOfTheOrder(order.getEndTimeOfTheOrder().toString())
                        .condition(order.getCondition().name())
                        .message(order.getMessage())
                        .build())
                .collect(toList());

    }


    public List<OrderDto> findAll() {
        return orderDao.findAll().stream()
                .map(order -> OrderDto.builder()
                        .id(order.getId())
                        .userInfo(order.getUserInfo().getId())
                        .room(order.getRoom().getId())
                        .beginTimeOfTheOrder(order.getBeginTimeOfTheOrder().toString())
                        .endTimeOfTheOrder(order.getEndTimeOfTheOrder().toString())
                        .condition(order.getCondition().name())
                        .message(order.getMessage())
                        .build())
                .collect(toList());
    }

    public Order findOrderById(Integer id) {
        return orderDao.findById(id).orElseThrow();

    }

    public void checkAndConfirmOrder(Order order) throws ServiceException {
        var dayPrice = roomDao.findById(order.getRoom().getId()).get().getDayPrice();

        Long finalPrice = calculatePrice(dayPrice, order.getBeginTimeOfTheOrder(), order.getEndTimeOfTheOrder());

        if (order.getCondition().equals(ConditionEnum.WANT_TO_RESERVE)) {
            if (isNotCorrectPeriodOfTheOrder(order.getBeginTimeOfTheOrder(), order.getEndTimeOfTheOrder())) {
                order.setCondition(ConditionEnum.REJECTED);
                throw new ServiceException();

            } else {
                order.getRoom().setStatus(RoomStatusEnum.Booked);
                roomDao.update(order.getRoom());
            }
            order.setCondition(ConditionEnum.APPROVED);
            order.setMessage("Все в порядке. Итого к оплате (с учетом НДС): " + finalPrice);
            orderDao.update(order);

        }
    }

    public void setFreeStatusRoom(Order order) {
        if (order.getCondition().equals(ConditionEnum.APPROVED)) {
            order.getRoom().setStatus(RoomStatusEnum.Free);
            roomDao.update(order.getRoom());
            order.setCondition(ConditionEnum.WANT_TO_RESERVE);
            order.setMessage("комната свободна");
            orderDao.update(order);
        }
    }

    public void sendCancelMessage(Order order) {
        if (order.getCondition().equals(ConditionEnum.APPROVED) || order.getCondition().equals(ConditionEnum.PAYED)) {
            order.setMessage("Админ, отмените заказ. Спасибо");
            orderDao.update(order);
        }
    }

    public void payOrder(Order order) {
        if (order.getCondition().equals(ConditionEnum.APPROVED)) {
            order.setCondition(ConditionEnum.PAYED);
            order.setMessage("Спасибо, скоро будем у Вас");
            orderDao.update(order);
        }
    }

    private boolean isNotCorrectPeriodOfTheOrder(LocalDate beginTimeOfTheOrder, LocalDate endTimeOfTheOrder) {
        return (beginTimeOfTheOrder.isAfter(endTimeOfTheOrder));
    }

    private Long calculatePrice(Integer dayPrice, LocalDate beginTimeOfTheOrder, LocalDate endTimeOfTheOrder) {
        var days = ChronoUnit.DAYS.between(beginTimeOfTheOrder, endTimeOfTheOrder);
        return dayPrice * days;
    }

    public static OrderService getInstance() {
        return INSTANCE;
    }
}