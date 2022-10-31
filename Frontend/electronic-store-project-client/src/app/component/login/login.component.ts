import { Component, OnInit } from '@angular/core'
import { Router } from '@angular/router'
import { Account } from 'src/app/model/account'
import { AuthService } from 'src/app/service/auth/auth.service'

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  acc = new Account()
  err = ''
  constructor(private _service: AuthService, private _route: Router) {}

  ngOnInit(): void {}

  login() {
    try {
      this._service.login(this.acc)
      this._route.navigate(['/'])
    } catch (error) {
      this.err = 'Invalid username or password'
    }
  }

  gotosignup() {
    this._route.navigate(['/sigunp'])
  }
}
