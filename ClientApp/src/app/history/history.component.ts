import { Router } from '@angular/router';
import { AuthService } from './../services/auth.service';
import { CheckoutService } from './../services/checkout.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { MatPaginator } from '@angular/material/paginator';

@Component({
  selector: 'app-history',
  templateUrl: './history.component.html',
  styleUrls: ['./history.component.css']
})
export class HistoryComponent implements OnInit {
  user: string;
  loading: boolean = false;
  displayedColumns: string[] = [
    'Id',
    'Email',
    'Address',
    'Phone',
    'Date',
    'Price'
  ];
  dataSource: any;
  constructor(
    public checkOut: CheckoutService,
    public auth: AuthService,
    public router: Router
  ) {}
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  ngOnInit(): void {
    this.loading = true;
    this.user = this.auth.user.email;
    this.checkOut.getHistoryItem(this.user).subscribe(
      res => {
        this.dataSource = new MatTableDataSource(res);
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
        this.loading = false;
      },
      err => {
        console.log(err);
      }
    );
  }
  showDetail(id: any) {
    this.router.navigate(['detail'], {
      queryParams: { id: id }
    });
  }
}
