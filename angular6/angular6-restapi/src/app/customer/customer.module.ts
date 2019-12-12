import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CustomerComponent } from './customer/customer.component';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [CustomerComponent],
  imports: [
    CommonModule,
    FormsModule
  ]
})
export class CustomerModule { 
  customerName : string;
  customerAge : number;
  customerPhone : number;
}
