import { ItemsService } from './../../services/items.service';
import { Component, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';
import { Items } from 'src/app/models/items.model';

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
  styleUrls: ['./product-detail.component.css']
})
export class ProductDetailComponent implements OnInit {
  item: Items = null;
  id: any;
  constructor(
    public dialogRef: NbDialogRef<EventListenerObject>,
    public itemsService: ItemsService
  ) {}
  ngOnInit(): void {
    this.itemsService.getItemIndex(this.id).subscribe(
      (res: Items) => {
        this.item = res;
      },
      err => {
        console.log(err);
      }
    );
  }
  close() {
    this.dialogRef.close();
    this.itemsService.itemIndex = null;
  }
}
