import { OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { RestService } from 'src/app/rest.service';

import {MatPaginator} from '@angular/material/paginator';

  const C_DATA = [

    {name:'ram',age:'30',phone:'256436',address:'21street',likes:'Newspaper',gender:'male'},
    {name:'kumar',age:'32',phone:'579895',address:'19street',likes:'e-paper',gender:'female'},
    {name:'shiva',age:'29',phone:'956421',address:'06street',likes:'magazine',gender:'mmale'}
]


@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.scss']
})

export class CustomerComponent implements OnInit {
  //@ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;

  
    
  
  constructor(private db: RestService) { }
users : String[];

  ngOnInit() {
    console.log("rest API Calls");
    console.log(this.db.getUsers().subscribe(data => this.users));
    return this.db.getUsers().subscribe(data => this.users);
  // this.dataSourceA.paginator = this.paginator;
  }

  customerObject = [
    {name:'ramGupta',age:'30',phone:'256436',address:'21street',likes:'Newspaper',gender:'male'},
    {name:'kumarShiva',age:'32',phone:'579895',address:'19street',likes:'e-paper',gender:'female'},
    {name:'shivaSri',age:'29',phone:'956421',address:'06street',likes:'magazine',gender:'male'}
];

genderObject = ['Male','Female'];
submitCustomer() {
  console.log(this.customerObject);
}

displayColumns: string[] = ['Name','Age','Phone','Address','Likes','Gender'];
  dataSourceA = this.customerObject;
 // dataSourceA = this.C_DATA;
}

