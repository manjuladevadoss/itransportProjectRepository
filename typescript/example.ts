export{}

let msg = "Welcome to typescript";
console.log("variable declaration -- " + msg);
//output (Welcome to typescript)

let namestr : String= 'Ram';
console.log("String variable Declaration -- " + namestr);
//output (Ram)

let age : number=5;
console.log("Number variable Declaration -- " + age);

let nameflag : boolean=false;;
console.log("boolean variable Declaration -- " + nameflag);
//output (false)
let namef : any;
namef=true;
namef ="ram";
namef=4;

let arr : string[] = ['Ram','charan','siva'];
console.log("Array decleration " + arr[2]);
//output(siva)

let arrnum : number[] = [12,14,45,23,64];
console.log("Array decleration " + arrnum[4]);
//output (64)

let multiarr : Array<string | number> = ['ram',10,'guru',10];
console.log("multiple datatype Array decleration " + multiarr);
//output (ram,10,guru,10)

enum color  {'red'=10,'green','yellow'};
let c : color=color.green;
console.log("enum datatype decleration " + c);
//output (11)

function add(a:number, b:number){
    //var c = a+b;
    return a+b;
}
let a: number=20;
let b: number=40;
console.log("function decleration " + add(a,b));
//output (60)

function addoption(a:number, b?:number){
    //var c = a+b;
    return a+b;
}
console.log("function optional Decleration " + addoption(a));
//output (NaN)

let s: string='guru';
let n: number=40;
function namereturn(name:string, num:number): string{
    return name;
}
console.log("function two datatypes Decleration return string :" + namereturn(s,n));
//output (guru)

function numreturn(name:string, num:number): number{
    return num;
}
console.log("function two datatypes Decleration return number :" + numreturn(s,n));
//output (40)

function addassignvalue(a:number, b:number=23){
    //var c = a+b;
    return a+b;
}
console.log("function two datatypes Decleration assign values on method 20+23:" + addassignvalue(a));
//output (43)

console.log("function two datatypes Decleration assign values on method 15+25:" + addassignvalue(15,25));
//output (40)

/* funcation has object arguement */
function objectpara(person:{fname:string, fage:number}){
    console.log("Passing object to a method");
    console.log(person.fname +" " + person.fage);
   console.log(person);
}
let q = {
    fname:'ram',
    fage:10
};
objectpara(q);
//output(ram 10)
//output({ fname: 'ram', fage: 10 })


/*Interface Declaration */
interface objinter{
    fname: string,
    lname: string
};
function intercall(objin : objinter){
    console.log("interface declaration");
    console.log(objin.fname + objin.lname);
}
let objvalue = {
    fname :'ganesh',
    lname: 'siva'
}
let objvalue2 = {
    fname :'guru',
    lname: 'ram'
}
intercall(objvalue);
intercall(objvalue2);
//output (ganeshsiva)


/* optional parameter using interface mname is optional*/
interface optionalinter {
    fname:string,
    mname?:string
}
function optionalinterfunction(op:optionalinter){
    console.log("Optional interface declaration");
    console.log(op.fname + op.mname);
}
let optval1 ={
    fname:'seema'
}
optionalinterfunction(optval1);
//output(seema undefined)

/*Class Declaration */
class emp{
    ename: string;
    constructor(name:string){
        this.ename = name
    };
    meth(){
        console.log("name is : " + this.ename);
    }
}
let empobj = new emp("Veer");
console.log(empobj.ename);
console.log(empobj.meth());
//output(veer)
//output(name is : Veer)