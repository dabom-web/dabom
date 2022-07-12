package com.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = { "/payment" })
public class PaymentController {

	@GetMapping(path = { "/payment" })
	public String paymentForm() {
		return "payment/payment";
	}
}
