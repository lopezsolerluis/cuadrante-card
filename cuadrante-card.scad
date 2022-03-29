$fa = 1;
$fs = 0.4;

th = 1;
tj = .4;

largo = 85;
ancho = 54;
alto = 1.8;
alto_p = .3; // alto de las "pestañitas" de unión entre piezas
ancho_p = 1; // ancho de las mismas

eje = alto*sqrt(2);
echo(eje);

marco();

module cubo_redondeado(largo,ancho,alto,r){
  minkowski(){
    cube([largo-2*r,ancho-2*r,alto/2]);
    cylinder(h=alto/2, r=r);
  }
}

module marco(){
  r=2;
  union() {
    difference(){
      cubo_redondeado(largo,ancho,alto,r);
      translate([r,r,-r])
        cubo_redondeado(largo-2*r,ancho-2*r,alto+2*r,r);
    }  
//    difference(){
//      translate([0,28,0])
//        cubo_redondeado(30,7,alto,2);
//      translate([0,28.,alto-.9])
//        linear_extrude(1.2)
//          text("TELESCARD", size=3, spacing=1.1, font="Liberation Sans:style=Bold Italic");
//    }  
    pestanitas();
  }
}

translate(3*[2,2,0])
cuadrante();

module cuadrante () {
  module porcion (r1,r2,a){
    intersection(){
      cubo_redondeado(r1,r1,a,r2);
      cylinder(h=3*a,r=r1-r2,center=true);
    }
  }
  radio=ancho*.85;
  r=4;
  difference() {
    porcion(radio,r,alto);
    intersection(){
      translate([1.5*r,1.5*r,-.1])    
        cubo_redondeado(radio*.7,radio*.7,3*alto,r);
      translate([0,0,-.1])
        cylinder(h=6*alto,r=radio*.75);
    }
    //  eje
    translate([0,0,-.1])
      cylinder(d=eje+th,h=3*alto,center=true);
    // marquitas
    anchito=1.5;    
    for (alfa=[0:10:90],
         z=[alto-.6,-.3])
      rotate([0,0,alfa])
        translate([radio*.8,-anchito/2,z])
          cube([1.8*r,anchito,.9]);
    // muescas para ojitos
    for (x=[r,radio-3.5*r])
      translate([x,-r-.1,-.1])
        cube([alto+tj,1.5+tj,2*alto]);
  }
}


translate([largo-13,6,0])
  rotate([0,0,35])
    cursor();

module cursor(){
  difference(){
    union(){
      cylinder(d=8,h=alto);
      translate([-4,0,0])
        cube([4,ancho*.85,alto]);
      translate([0,ancho*.85,0])
        cylinder(d=8,h=alto);
    }
    //  eje
    translate([0,0,-.1])
      cylinder(d=eje+th,h=3*alto,center=true);
  }
}

module eje(){
  l=3*alto;
  a=eje;
  d=a*1.55; //1.35
  difference(){
    union(){
      translate([-l/2,-a/2,0])
        cube([l,a,alto]);
      for(x=[-1,1])
        translate([(-l/2-d/3.)*x,0,0])  
          cylinder(h=alto, d=d);
    }
    for(x=[l/6,-l/6-l])      
      translate([x,-a/5,-.01])
        cube([l,a/2.5,2*alto]);
  }
}


translate([58,5,0])
   eje();

for (y=[13,29])
  translate([largo-13,ancho-y,0])
    rotate(90)
    //rotate([0,90,0])
    //color("cyan")
    ojito();

module ojito() {
  r=2;
  difference(){
    cylinder(d=6.5*r,h=alto);
    translate([0,0,-.1])
      cylinder(d=3*r,h=3*alto);
    translate([-(alto+tj)/2,2.3*r,-1])
      cube([alto+tj,1.5+tj,3*alto]);
  }
}

module pestanitas() {
  translate([0,40,0])
    cube([3,ancho_p,alto_p]); 
   translate([0,10,0])
    cube([3,ancho_p,alto_p]); 
   translate([7,0,0])
    rotate(90)
      cube([3,ancho_p,alto_p]); 
  translate([43,0,0])
    rotate(90)
      cube([3,ancho_p,alto_p]); 
  translate([54.5,0,0])
    rotate(90)
      cube([4,ancho_p,alto_p]); 
  translate([62.5,0,0])
    rotate(90)
      cube([4,ancho_p,alto_p]); 
  translate([72.5,0,0])
    rotate(90)
      cube([4,ancho_p,alto_p]); 
  translate([72.5,47,0])
    rotate(90)
      cube([4,ancho_p,alto_p]); 
  translate([72.5,30,0])
    rotate(90)
      cube([6,ancho_p,alto_p]); 
  translate([72.5,9,0])
    rotate(90)
      cube([10,ancho_p,alto_p]);       
  translate([74,5.5,0])
      cube([7,ancho_p,alto_p]);             
  translate([76,24.5,0])
       cube([5,ancho_p,alto_p]);
  translate([76,40.5,0])
       cube([5,ancho_p,alto_p]);
  translate([46,47,0])
    rotate(90)
      cube([4,ancho_p,alto_p]);       
  translate([46,16,0])
    rotate(35)
      cube([13,ancho_p,alto_p]);             
       
       }