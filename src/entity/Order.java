
package entity;

import entity.Enum.ConditionEnum;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
@Builder
public class Order {
        private Integer id;
        private UserInfo userInfo;
        private Room room;
        private LocalDate beginTimeOfTheOrder;
        private LocalDate endTimeOfTheOrder;
        private ConditionEnum condition;
        private String message;
}