import { Component, OnInit } from '@angular/core';
import { AccountService } from 'src/app/service/account/account.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  
  //Slider settings
  slideConfig = {"slidesToShow": 1, "slidesToScroll": 1} ;
  constructor(private accountService: AccountService) { }
  ngOnInit(): void {
    this.accountService.getAllAcount().subscribe({
      next: data => {
        console.log(data);
      },
      error: err => {console.log(err)
        // if (err.error) {
        //   this.content = JSON.parse(err.error).message;
        // } else {
        //   this.content = "Error with status: " + err.status;
        // }
      }
    });
  }

}