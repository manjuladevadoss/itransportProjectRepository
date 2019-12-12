import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-newcomp',
  templateUrl: './newcomp.component.html',
  styleUrls: ['./newcomp.component.scss']
})
export class NewcompComponent implements OnInit {
  newcomponentmsg = "Entered in new component created";
  msg = this.newcomponentmsg;
  age = 50;
  cName = "JP Morgan";
  cCountry = ["USA","India","Singapore","Europe"];
  cContact = "5788234533333333";
  avlCountry = true;
  sCountry ="";
  student ="ramesh";
  submitInfo(event){
    
      if(this.avlCountry)
        this.avlCountry = false;
      else
        this.avlCountry = true;
        alert("avaiable :"  + this.avlCountry);
  } 
  sCoutnry(event){
    alert("selected country : " + event);
  }
  currformat = 6589.23 ;
  dateformat = new Date();
  decimalformat = 342349238.23423;
  namearr : String;

  constructor() { 
    this.namearr="ram";
  }

  ngOnInit() {
  }
 
}
