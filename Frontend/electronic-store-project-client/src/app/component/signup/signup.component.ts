import { Component, OnInit } from '@angular/core'
import { Router } from '@angular/router'
import { Account } from 'src/app/model/account'
import { AuthService } from 'src/app/service/auth/auth.service'

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css'],
})
export class SignupComponent implements OnInit {
  acc = new Account()
  constructor(private _service: AuthService, private _route: Router) {}

  ngOnInit(): void {}
  signup() {
    this._service.signup(this.acc)
    this._route.navigate(['/login'])
  }
}
