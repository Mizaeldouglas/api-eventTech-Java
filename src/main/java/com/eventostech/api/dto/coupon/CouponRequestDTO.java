package com.eventostech.api.dto.coupon;

public record CouponRequestDTO(String code, Integer discount, Long valid) {
}
