import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { FooterComponent } from './component/footer/footer.component';
import { HeaderComponent } from './component/header/header.component';
import { HomeComponent } from './component/home/home.component';
import { ProductsingleComponent } from './component/productsingle/productsingle.component';
import { CartComponent } from './component/cart/cart.component';
import { CheckoutComponent } from './component/checkout/checkout.component';
import { ProductComponent } from './component/product/product.component';
import { DashboardComponent } from './component/dashboard/dashboard.component';
import { OrdersComponent } from './component/orders/orders.component';
import { LoginComponent } from './component/login/login.component';
import { SignupComponent } from './component/signup/signup.component';
import { ForgotPasswordComponent } from './component/forgot-password/forgot-password.component';
import { ProfileDetailComponent } from './component/profile-detail/profile-detail.component';
import { SlickCarouselModule } from 'ngx-slick-carousel';
import { OrderDetailComponent } from './component/order-detail/order-detail.component';
import { MenuInfoComponent } from './component/menu-info/menu-info.component';

@NgModule({
  declarations: [
    AppComponent,
    FooterComponent,
    HeaderComponent,
    HomeComponent,
    ProductsingleComponent,
    CartComponent,
    CheckoutComponent,
    ProductComponent,
    DashboardComponent,
    OrdersComponent,
    LoginComponent,
    SignupComponent,
    ForgotPasswordComponent,
    ProfileDetailComponent,
    OrderDetailComponent,
    MenuInfoComponent
  ],
  imports: [
    BrowserModule,
    SlickCarouselModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
