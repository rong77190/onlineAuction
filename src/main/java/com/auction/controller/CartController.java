package com.auction.controller;

import com.auction.model.Cart;
import com.auction.service.CartService;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/{userId}/favourite")
public class CartController {
    @Resource
    private CartService cartService;

    @RequestMapping(method=RequestMethod.GET)
    public String show(@PathVariable int  userId, Model model) {
        List<Cart> favourite =cartService.getCart(userId);
        model.addAttribute("favourite",favourite);
        return "favourite";
    }
}
