package com.eventostech.api.controller;

import com.eventostech.api.domain.coupon.Coupon;
import com.eventostech.api.dto.coupon.CouponRequestDTO;
import com.eventostech.api.service.CouponService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/coupon")
@Tag(name = "Coupon API", description = "API para gerenciamento de cupons")
public class CouponController {

    @Autowired
    private CouponService couponService;

    @PostMapping("/event/{eventId}")
    @Operation(summary = "Adicionar cupons a um evento", description = "Adiciona cupons a um evento específico")
    @ApiResponse(responseCode = "200", description = "Cupons adicionados com sucesso")
    @ApiResponse(responseCode = "404", description = "Evento não encontrado")
    public ResponseEntity<Coupon> addCouponsToEvent(@PathVariable UUID eventId, @RequestBody CouponRequestDTO data) {
        Coupon coupons = couponService.addCouponToEvent(eventId, data);
        return ResponseEntity.ok(coupons);
    }
}
