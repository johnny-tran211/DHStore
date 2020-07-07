import { Items } from 'src/app/models/items.model';
import { Router } from '@angular/router';
import { CheckoutDetailService } from './../services/checkout-detail.service';
import { CheckoutService } from './../services/checkout.service';
import { AuthService } from './../services/auth.service';
import { Checkout } from './../models/checkout.model';
import { ItemsService } from './../services/items.service';
import { ToastrService } from './../services/toastr.service';
import { CartService } from './../services/cart.service';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  itemCheck: Items[];
  checkState: boolean = false;
  loading: boolean = false;
  checkOutValue: Checkout;
  constructor(
    public cartService: CartService,
    public toastService: ToastrService,
    public itemsService: ItemsService,
    public authService: AuthService,
    public checkoutService: CheckoutService,
    public checkoutDetailService: CheckoutDetailService,
    public router: Router
  ) {}

  ngOnInit(): void {
    this.cartService.loadCart();
  }
  deleteCart(id: number) {
    this.cartService.delete(id);
    this.toastService.showToast(
      'Delete successful',
      'Success',
      'trash-outline',
      'eva'
    );
  }

  checkValidate() {
    let count: number = 0;
    this.itemsService.getAllList().subscribe(res => {
      this.loading = true;
      for (let i = 0; i < this.cartService.cartList.length; i++) {
        for (let y = 0; y < res.length; y++) {
          if (
            res[y].Id == this.cartService.cartList[i].Item.Id &&
            res[y].Quantity < this.cartService.cartList[i].Quantity
          ) {
            count += 1;
            this.toastService.showToast(
              'Quantity of ' +
                this.cartService.cartList[i].Item.ClothesName +
                ' has only ' +
                res[y].Quantity,
              'Fail',
              'alert-triangle-outline',
              'eva',
              'danger'
            );
          }
        }
      }
      if (count == 0) {
        this.checkState = true;
      }
      this.loading = false;
    });
  }

  checkOut(form: NgForm) {
    this.loading = true;
    let address = form.value.address;
    let phone = form.value.phone;
    let email = this.authService.user.email;
    let time = new Date(Date.now());
    this.checkOutValue = new Checkout();
    this.checkOutValue.CheckOutID = '0';
    this.checkOutValue.Address = address;
    this.checkOutValue.Phone = phone;
    this.checkOutValue.Email = email;
    this.checkOutValue.Date = time.toLocaleDateString();
    this.checkOutValue.Price = this.cartService.total;
    this.checkoutService.postItem(this.checkOutValue).subscribe(res => {
      this.checkoutDetailService
        .postItem(JSON.stringify(this.cartService.cartList), res)
        .subscribe(res => {
          localStorage.removeItem('CART');
          setTimeout(() => {
            this.toastService.showToast(
              'Check Out Successful',
              'Success',
              'checkmark-circle-2-outline',
              'eva'
            );
            this.loading = false;
            this.cartService.count = 0;
            return this.router.navigateByUrl('/history');
          }, 1000);
        });
    });
  }
}
