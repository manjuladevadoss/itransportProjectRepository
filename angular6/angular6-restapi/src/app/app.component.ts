import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
      title = 'angular6-restapi';
      myData = ['Dictionary','Pockets','youtube'];
      myDatats : String[] = ['Dictionary','Pockets','youtube'];
      myDataObject = [
                        {name:'ram',likes:'Dictionary'},
                        {name:'ram',likes:'Pockets'},
                        {name:'ram',likes:'youtube'}
                    ];

    num = 12;
    b = getPersonInfo({name:'ram',age:10});
    onClick(txtValue:number) {
      this.num=txtValue ;
      alert(txtValue);
    
      alert(this.b);
    }
    editText(val: string){
      this.title = val;
    }

 
}
interface Person{
  name: String;
  age: number;
  }
  
  function getPersonInfo(person : Person){
  return '${person.name} - ${person.age}';
  }
  
  