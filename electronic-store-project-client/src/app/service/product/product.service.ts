import { Injectable } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { PRODUCTS } from '../../mock-test/mock-products';
import { Product } from '../../mock-test/product'
@Injectable({
  providedIn: 'root'
})
export class ProductService {
  constructor() { }
  getProducts():Product[] {
    return PRODUCTS;
  }
  getProduct(id: number) {
    return PRODUCTS.find(product => product.id === id);
  }
}
