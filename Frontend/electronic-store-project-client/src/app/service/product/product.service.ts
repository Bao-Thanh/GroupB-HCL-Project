import { Injectable } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
const httpOptions : any    = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json',
  })
};
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

  deleteProductByID(id: number): Observable<any> {
    return this.http.delete(API_URL + `${id}`);
  }

  createByCategory(name: string, price: number, image: string, amount: string, status: string, description: string, saleOff: string, id: number): Observable<any> {
    return this.http.post(
      API_URL + 'createByCategory/' +`${id}`,
      {
        name,
        price,
        image,
        amount,
        status,
        description,
        saleOff
      },
      httpOptions
    );
  }

  updateProduct(name: string, price: number, image: string, amount: string, status: string, description: string, saleOff: string, id: number): Observable<any> {
    return this.http.put(
      API_URL +`${id}`,
      {
        name,
        price,
        image,
        amount,
        status,
        description,
        saleOff
      },
      httpOptions
    );
  }
}
