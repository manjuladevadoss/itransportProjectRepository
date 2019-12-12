"use strict";
exports.__esModule = true;
var msg = "Welcome to typescript";
console.log("variable declaration -- " + msg);
//output (Welcome to typescript)
var namestr = 'Ram';
console.log("String variable Declaration -- " + namestr);
//output (Ram)
var age = 5;
console.log("Number variable Declaration -- " + age);
var nameflag = false;
;
console.log("boolean variable Declaration -- " + nameflag);
//output (false)
var namef;
namef = true;
namef = "ram";
namef = 4;
var arr = ['Ram', 'charan', 'siva'];
console.log("Array decleration " + arr[2]);
//output(siva)
var arrnum = [12, 14, 45, 23, 64];
console.log("Array decleration " + arrnum[4]);
//output (64)
var multiarr = ['ram', 10, 'guru', 10];
console.log("multiple datatype Array decleration " + multiarr);
//output (ram,10,guru,10)
var color;
(function (color) {
    color[color["red"] = 10] = "red";
    color[color["green"] = 11] = "green";
    color[color["yellow"] = 12] = "yellow";
})(color || (color = {}));
;
var c = color.green;
console.log("enum datatype decleration " + c);
//output (11)
function add(a, b) {
    //var c = a+b;
    return a + b;
}
var a = 20;
var b = 40;
console.log("function decleration " + add(a, b));
//output (60)
function addoption(a, b) {
    //var c = a+b;
    return a + b;
}
console.log("function optional Decleration " + addoption(a));
//output (NaN)
var s = 'guru';
var n = 40;
function namereturn(name, num) {
    return name;
}
console.log("function two datatypes Decleration return string :" + namereturn(s, n));
//output (guru)
function numreturn(name, num) {
    return num;
}
console.log("function two datatypes Decleration return number :" + numreturn(s, n));
//output (40)
function addassignvalue(a, b) {
    if (b === void 0) { b = 23; }
    //var c = a+b;
    return a + b;
}
console.log("function two datatypes Decleration assign values on method 20+23:" + addassignvalue(a));
//output (43)
console.log("function two datatypes Decleration assign values on method 15+25:" + addassignvalue(15, 25));
//output (40)
/* funcation has object arguement */
function objectpara(person) {
    console.log("Passing object to a method");
    console.log(person.fname + " " + person.fage);
    console.log(person);
}
var q = {
    fname: 'ram',
    fage: 10
};
objectpara(q);
;
function intercall(objin) {
    console.log("interface declaration");
    console.log(objin.fname + objin.lname);
}
var objvalue = {
    fname: 'ganesh',
    lname: 'siva'
};
var objvalue2 = {
    fname: 'guru',
    lname: 'ram'
};
intercall(objvalue);
intercall(objvalue2);
function optionalinterfunction(op) {
    console.log("Optional interface declaration");
    console.log(op.fname + op.mname);
}
var optval1 = {
    fname: 'seema'
};
optionalinterfunction(optval1);
//output(seema undefined)
/*Class Declaration */
var emp = /** @class */ (function () {
    function emp(name) {
        this.ename = name;
    }
    ;
    emp.prototype.meth = function () {
        console.log("name is : " + this.ename);
    };
    return emp;
}());
var empobj = new emp("Veer");
console.log(empobj.ename);
console.log(empobj.meth());
//output(veer)
//output(name is : Veer)
