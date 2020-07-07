import { NbDialogService } from '@nebular/theme';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { CheckoutDetailService } from './../../services/checkout-detail.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CheckoutDetail } from 'src/app/models/checkout-detail.model';
import { ProductDetailComponent } from 'src/app/home/product-detail/product-detail.component';

@Component({
  selector: 'app-history-detail',
  templateUrl: './history-detail.component.html',
  styleUrls: ['./history-detail.component.css']
})
export class HistoryDetailComponent implements OnInit {
  param: any;
  detail: CheckoutDetail[];
  dataSource: any;
  displayedColumns: string[] = [
    'ItemId',

    'Image',
    'ProductName',
    'Quantity',
    'Price'
  ];
  constructor(
    public route: ActivatedRoute,
    public router: Router,
    public checkout: CheckoutDetailService,
    public dialogService: NbDialogService
  ) {}
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  ngOnInit(): void {
    this.route.queryParamMap.subscribe(params => {
      if (params.keys.length === 0) {
        this.router.navigateByUrl('history');
      } else {
        if (params.has('id')) {
          this.param = this.route.snapshot.queryParamMap.get('id');
          this.checkout.getDetailById(this.param).subscribe(
            res => {
              this.dataSource = new MatTableDataSource(res);
              this.dataSource.sort = this.sort;
            },
            err => {
              console.log(err);
            }
          );
        } else {
          this.router.navigateByUrl('history');
        }
      }
    });
  }
  showDetail(id: number) {
    this.dialogService.open(ProductDetailComponent, {
      context: {
        id: id
      }
    });
  }
}
