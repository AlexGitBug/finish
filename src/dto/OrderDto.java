package dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class OrderDto {

    Integer id;
    Integer userInfo;
    Integer room;
    String beginTimeOfTheOrder;
    String endTimeOfTheOrder;
    String condition;
    String message;

}