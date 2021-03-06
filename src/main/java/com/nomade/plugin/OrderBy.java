package com.nomade.plugin;

import org.springframework.data.mongodb.core.query.Order;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.FIELD })
public @interface OrderBy {
  /**
  * Field name
  */
  String value();
  Order order() default Order.ASCENDING;
  SortPhase[] phase() default SortPhase.AFTER_CONVERT;
}

