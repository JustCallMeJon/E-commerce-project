package com.jtspringproject.JtSpringProject.services;

import java.util.List;

import com.jtspringproject.JtSpringProject.dao.cartDao;
import com.jtspringproject.JtSpringProject.dao.cartProductDao;
import com.jtspringproject.JtSpringProject.models.Cart;

import com.jtspringproject.JtSpringProject.models.CartProduct;
import com.jtspringproject.JtSpringProject.models.Product;
import com.jtspringproject.JtSpringProject.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class cartService {
    private final cartDao cartDao;
    private final cartProductDao cartProductDao;

    @Autowired
    public cartService(cartDao cartDao, cartProductDao cartProductDao) {
        this.cartDao = cartDao;
        this.cartProductDao = cartProductDao;
    }

    public Cart addCart(Cart cart) {
        return cartDao.addCart(cart);
    }

    public List<Cart> getCarts() {
        return this.cartDao.getCarts();
    }

    public void updateCart(Cart cart) {
        cartDao.updateCart(cart);
    }

    public void deleteCart(Cart cart) {
        cartDao.deleteCart(cart);
    }

    public Cart getCartByUserId(int userId) {
        return cartDao.getCartByUserId(userId);
    }
    public List<CartProduct> getCartProductsByCartId(int cartId) {
        return cartProductDao.getCartProductsByCartId(cartId);
    }


    public void addProductToCart(Cart cart, Product product, int quantity) {
        CartProduct cartProduct =
                cartProductDao.getCartProduct(cart.getId(), product.getId());

        if (cartProduct != null) {
            cartProduct.setQuantity(cartProduct.getQuantity() + quantity);
            cartProductDao.updateCartProduct(cartProduct);
        } else {
            CartProduct newCartProduct = new CartProduct(cart, product);
            newCartProduct.setQuantity(quantity);
            cartProductDao.addCartProduct(newCartProduct);
        }
    }

    public void updateCartProductQuantity(int cartId, int productId, int quantity) {
        CartProduct cartProduct = cartProductDao.getCartProduct(cartId, productId);

        if (cartProduct == null) {
            return;
        }

        if (quantity <= 0) {
            cartProductDao.deleteCartProduct(cartProduct);
        } else {
            cartProduct.setQuantity(quantity);
            cartProductDao.updateCartProduct(cartProduct);
        }
    }

    public Cart getOrCreateCart(User user) {
        Cart cart = cartDao.getCartByUserId(user.getId());

        if (cart == null) {
            cart = new Cart();
            cart.setCustomer(user);
            cart = cartDao.addCart(cart);
        }

        return cart;
    }

    public void clearCart(Cart cart) {
        cartProductDao.deleteCartProductsByCartId(cart.getId());
    }

}
