import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Account } from 'src/app/model/account';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private _http: HttpClient) {}
  
  public login(acc: Account): Observable<any> {
    return this._http.post<any>('http://localhost:8094/api/auth/login', acc)
  }

  public signup(acc: Account): Observable<any> {
    return this._http.post<any>('http://localhost:8094/api/auth/signup', acc)
  }

  handleError(error: Response) {}
}
