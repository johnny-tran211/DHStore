import { ItemsService } from './items.service';
import { Injectable } from '@angular/core';
import { Cart } from '../models/cart.model';
import { Items } from '../models/items.model';

@Injectable({
  providedIn: 'root'
})
export class CartService {
  item: Items;
  cartList: Cart[] = [];
  total: number;
  count: number = 0;
  constructor(public itemService: ItemsService) {}
  loadCart() {
    this.total = 0;
    this.cartList = [];
    let cart = JSON.parse(localStorage.getItem('CART'));
    if (cart != null) {
      for (let i = 0; i < cart.length; i++) {
        let cartChild: Cart = JSON.parse(cart[i]);
        this.cartList.push({
          Item: cartChild.Item,
          Quantity: cartChild.Quantity
        });
        this.total += cartChild.Item.Price * cartChild.Quantity;
      }
    }
  }

  addToCart(id: any, quantity: number) {
    this.itemService.getItemIndex(id).subscribe(
      (res: any) => {
        this.item = res;
        let cartChild: Cart = {
          Item: this.item,
          Quantity: quantity
        };
        if (localStorage.getItem('CART') == null) {
          let cart: any = [];
          cart.push(JSON.stringify(cartChild));
          localStorage.setItem('CART', JSON.stringify(cart));
        } else {
          let cart: any = JSON.parse(localStorage.getItem('CART'));
          let index: number = -1;
          for (let i = 0; i < cart.length; i++) {
            let item: Cart = JSON.parse(cart[i]);
            if (item.Item.Id == id) {
              index = i;
              break;
            }
          }
          if (index == -1) {
            cart.push(JSON.stringify(cartChild));
            localStorage.setItem('CART', JSON.stringify(cart));
          } else {
            let item: Cart = JSON.parse(cart[index]);
            item.Quantity += quantity;
            cart[index] = JSON.stringify(item);
            localStorage.setItem('CART', JSON.stringify(cart));
          }
        }
        this.loadCart();
        this.count = this.cartList.length;
      },
      err => {
        console.log(err);
      }
    );
  }
  delete(id: number) {
    let cart: any = JSON.parse(localStorage.getItem('CART'));
    let index: number = -1;
    for (let i = 0; i < cart.length; i++) {
      let item: Cart = JSON.parse(cart[i]);
      if (item.Item.Id == id) {
        cart.splice(i, 1);
        break;
      }
    }
    localStorage.setItem('CART', JSON.stringify(cart));
    this.loadCart();
    this.count = this.cartList.length;
  }
}
