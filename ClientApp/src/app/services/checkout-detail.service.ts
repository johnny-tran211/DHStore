import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class CheckoutDetailService {
  readonly url = 'https://localhost:44327/api/CheckOutDetail/';
  constructor(private http: HttpClient) {}
  postItem(form: any, id: number): Observable<any> {
    return this.http.post(
      'https://localhost:44327/api/CheckOutDetail/' + id,
      form,
      {
        headers: new HttpHeaders({
          'Content-Type': 'application/json'
        })
      }
    );
  }
  getDetailById(id: any): Observable<any> {
    return this.http.get(this.url + 'details/' + id);
  }
}
