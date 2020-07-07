import { ToastrService } from './../services/toastr.service';
import { CartService } from './../services/cart.service';
import { Items } from './../models/items.model';
import { ProductDetailComponent } from './product-detail/product-detail.component';
import { AuthService } from './../services/auth.service';
import { Component, OnInit } from '@angular/core';
import { ItemsService } from '../services/items.service';
import { NbDialogService } from '@nebular/theme';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  Iphone: Items[];
  IphoneBackUp: Items[];
  MacbookBackUp: Items[];
  Macbook: Items[];
  Id = '0';
  loading: boolean = false;
  constructor(
    public itemService: ItemsService,
    public auth: AuthService,
    public dialogService: NbDialogService,
    public toastService: ToastrService,
    public cartService: CartService
  ) {}

  ngOnInit(): void {
    this.loading = true;
    this.itemService.getIphoneList().subscribe(
      res => {
        this.Iphone = res;
        this.IphoneBackUp = res;
        this.loading = false;
      },
      err => {
        console.log(err);
      }
    );
    this.itemService.getMacbookList().subscribe(
      res => {
        this.Macbook = res;
        this.MacbookBackUp = res;
      },
      err => {
        console.log(err);
      }
    );
  }
  showDetail(id: any) {
    this.Id = id;
    this.dialogService.open(ProductDetailComponent, {
      context: {
        id: this.Id
      }
    });
  }
  addToCart(id: any, value: any) {
    if (value == '') {
      value = 1;
    }
    this.cartService.addToCart(id, value);
    this.toastService.showToast(
      'Add to Cart successful',
      'Success',
      'checkmark-square-outline',
      'eva'
    );
  }

  macbookSearch(searchValue: string) {
    let MacbookTmp: Items[] = [];
    this.Macbook = this.MacbookBackUp;
    if (searchValue.length != 0) {
      for (let i = 0; i < this.Macbook.length; i++) {
        if (
          this.Macbook[i].ClothesName.toLowerCase().includes(
            searchValue.toLowerCase()
          )
        ) {
          MacbookTmp.push(this.Macbook[i]);
        }
      }
      this.Macbook = MacbookTmp;
    }
  }
  iphoneSearch(searchValue: string) {
    let IphoneTmp: Items[] = [];
    this.Iphone = this.IphoneBackUp;
    if (searchValue.length != 0) {
      for (let i = 0; i < this.Iphone.length; i++) {
        if (
          this.Iphone[i].ClothesName.toLowerCase().includes(
            searchValue.toLowerCase()
          )
        ) {
          IphoneTmp.push(this.Iphone[i]);
        }
      }
      this.Iphone = IphoneTmp;
    }
  }
}
