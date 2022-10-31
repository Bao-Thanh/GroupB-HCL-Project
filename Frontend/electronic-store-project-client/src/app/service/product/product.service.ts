import { Injectable } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const API_URL = 'http://localhost:8094/api/product/';
@Injectable({
  providedIn: 'root'
})
export class ProductService {

  constructor(private http: HttpClient) { }

  getAllProduct(): Observable<any> {
    return this.http.get(API_URL + 'viewall');
  }

  getProductByID(id: number): Observable<any> {
    return this.http.get(API_URL + `${id}`);
  }
}
