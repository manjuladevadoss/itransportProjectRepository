import { Component, OnInit } from '@angular/core';
import { FormsModule }   from '@angular/forms';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }
  title = "welcome home"
  editText(val: string){
    this.title = val;
  }

}
