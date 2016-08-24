package com.auction.service;

import com.auction.model.Cart;
import com.auction.model.Good;
import java.util.List;
import java.util.Date;

public interface CartService {
    public List<Cart> getCart(int cartId);

    public void addGood(int userId,Good good);

    public void deleteGood(Good good,Cart cart);

    public Date getTime();

}
