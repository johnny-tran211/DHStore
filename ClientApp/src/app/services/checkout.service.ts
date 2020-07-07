import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Checkout } from './../models/checkout.model';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CheckoutService {
  readonly url = 'https://localhost:44327/api/CheckOut/';
  constructor(private http: HttpClient) {}

  postItem(form: Checkout): Observable<any> {
    return this.http.post(
      'https://localhost:44327/api/CheckOut',
      JSON.stringify(form),
      {
        headers: new HttpHeaders({
          'Content-Type': 'application/json'
        })
      }
    );
  }
  getHistoryItem(username: string): Observable<any> {
    return this.http.get<any>(this.url + 'username/' + username);
  }
}
