package com.auction.service.imp;


import com.auction.dao.CartMapper;
import com.auction.model.Cart;
import com.auction.model.Good;
import com.auction.service.CartService;
import org.springframework.stereotype.Service;
import java.util.List;
import javax.annotation.Resource;
import java.util.Date;


@Service
public class CartServiceImpl implements CartService {

    @Resource
    private CartMapper cartMapper;

    public Date getTime() {
        return new Date();
    }

    public void addGood(int userId,Good good){
        Cart cart=new Cart();
        cart.setCartId(userId);
        cart.setUserId(userId);
        cart.setGoodId(good.getGoodId());
        cart.setCreateTime(getTime());
        cart.setUpdateTime(getTime());
        cartMapper.insert(cart);
    }

    public List<Cart> getCart(int cartId){
        return cartMapper.selectByPrimaryKey(cartId);
    }

    public void deleteGood(Good good){
        cartMapper.deleteByPrimaryKey(good.getGoodId());
    }







}
