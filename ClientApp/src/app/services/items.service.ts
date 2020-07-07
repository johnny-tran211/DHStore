import { Http, Response } from '@angular/http';
import { Injectable } from '@angular/core';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Items } from '../models/items.model';
import { HttpHeaders, HttpClient } from '@angular/common/http';
@Injectable({
  providedIn: 'root',
})
export class ItemsService {
  allList: Items[];
  itemIndex: Items;
  urlRewriting: string;
  readonly url = 'https://localhost:44327/api/Items/';
  constructor(private http: Http, private httpClient: HttpClient) {}
  getAllList(): Observable<any> {
    return this.http.get(this.url).pipe(
      map((data: Response) => {
        return data.json();
      })
    );
  }

  getIphoneList(): Observable<any> {
    return this.httpClient.get(this.url + 'iphone');
  }
  getMacbookList(): Observable<any> {
    return this.httpClient.get(this.url + 'macbook');
  }
  getItemIndex(id: number): Observable<any> {
    this.urlRewriting = this.url + id;
    return this.httpClient.get(this.urlRewriting);
  }
}
