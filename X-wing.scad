//example
//translate([-50,44,-8]) import("x-template.stl");

//main body
rotate([270,0,0]) union(){
    scale([1.1,0.9,1]) cylinder(15,5.5,5.5, $fn=6);
    translate([0,0,15]) scale([1.1,0.9,1])cylinder(5,5.5,4, $fn=6);
    translate([0,0,20]) scale([1.1,0.9,1])cylinder(30,4,2, $fn=6);
}

//nose
translate([-1.5,49.8,-0.5]) scale(0.5) rotate([90,0,90]) union(){
difference(){
    scale([1.5,0.8,1]) translate([0,-5,0]) cylinder(6,10,10, $fn=100);
    translate([-20,-15,-1]) cube(20);
    translate([-1,-20,-1]) cube(20);
}
difference(){
    scale([1.5,0.4,1]) translate([0,5,0]) cylinder(6,10,10, $fn=100);
    translate([-20,-10,-1]) cube(20);
    translate([-1,0.01,-1]) cube(20);
}
rotate([4,90,0]) scale([0.9,0.6,1]) translate([-3.4,1.7,0]) cylinder(10.8,5,2, $fn=6);
}

//bottom right wing
scale(0.6) translate([8,0,-2]) rotate([0,13,0]) linear_extrude(0.6) polygon([[0,0],[1,0],[1,2],[12,2],[13,0],[45,10],[48,10],[48,13],[49,13],[49,18],[48.5,19.5],[48.5,25],[0,25]],[[0,1,2,3,4,5,6,7,8,9,10,11,12]]);

//bottom right gun
translate([32.2,.5,-8]) rotate([0,193,0]) scale(.545) union(){
rotate([-90,0,0]) translate([.2,-0.55,0]) union(){
    translate([0,0,10]) cylinder(16.5,1.5,1.5,$fn=30);
    scale([1,0.9,1]) rotate([0,0,-90]) translate([-1,0,10]) cylinder(16.5,1.5,1.5,$fn=3);
    translate([0,0,9.5]) cylinder(.5,.8,1.5,$fn=30);
    translate([0,0,7.5]) cylinder(2,.8,.8,$fn=30);
    translate([0,0,6.5]) difference(){
        cylinder(1.3,1.7,1.7,$fn=30);
        translate([0,0,-0.01]) cylinder(1.6,.7,.7,$fn=30);
    }
    translate([0,0,26.5]) cylinder(3,1.8,1.8,$fn=30);
}

//bottom right gun barrel
rotate([-90,0,-1]) translate([-.3,-0.55,29.3]) union(){
    cylinder(1,2.1,2.1,$fn=30);
    translate([0,0,1]) cylinder(0.7,1.8,1.8,$fn=30);
    translate([0,0,1.7]) cylinder(14,.7,.7,$fn=30);
    translate([0,0,15.7]) cylinder(12,.35,.35,$fn=30);
    translate([0,0,27.7]) cylinder(2,.35,1.5,$fn=30);
    translate([0,0,29.7]) cylinder(7,.5,.2,$fn=30);
}
}





//top right wing
scale(0.6) translate([8.5,0,1]) rotate([0,-13,0]) linear_extrude(0.6) polygon([[0,0],[1,0],[1,2],[12,2],[13,0],[45,10],[48,10],[48,13],[49,13],[49,18],[48.5,19.5],[48.5,25],[0,25]],[[0,1,2,3,4,5,6,7,8,9,10,11,12]]);

//top right gun
translate([32.2,.5,7.75]) rotate([0,-13,0]) scale(.545) union(){
rotate([-90,0,0]) translate([.2,-0.55,0]) union(){
    translate([0,0,10]) cylinder(16.5,1.5,1.5,$fn=30);
    scale([1,0.9,1]) rotate([0,0,-90]) translate([-1,0,10]) cylinder(16.5,1.5,1.5,$fn=3);
    translate([0,0,9.5]) cylinder(.5,.8,1.5,$fn=30);
    translate([0,0,7.5]) cylinder(2,.8,.8,$fn=30);
    translate([0,0,6.5]) difference(){
        cylinder(1.3,1.7,1.7,$fn=30);
        translate([0,0,-0.01]) cylinder(1.6,.7,.7,$fn=30);
    }
    translate([0,0,26.5]) cylinder(3,1.8,1.8,$fn=30);
}

//top right gun barrel
rotate([-90,0,1]) translate([0.7,-0.55,29.3]) union(){
    cylinder(1,2.1,2.1,$fn=30);
    translate([0,0,1]) cylinder(0.7,1.8,1.8,$fn=30);
    translate([0,0,1.7]) cylinder(14,.7,.7,$fn=30);
    translate([0,0,15.7]) cylinder(12,.35,.35,$fn=30);
    translate([0,0,27.7]) cylinder(2,.35,1.5,$fn=30);
    translate([0,0,29.7]) cylinder(7,.5,.2,$fn=30);
}
}






//top left wing
scale(0.6) translate([-8.5,0,1.5]) rotate([0,194,0]) linear_extrude(0.6) polygon([[0,0],[1,0],[1,2],[12,2],[13,0],[45,10],[48,10],[48,13],[49,13],[49,18],[48.5,19.5],[48.5,25],[0,25]],[[0,1,2,3,4,5,6,7,8,9,10,11,12]]);

//top left gun
translate([-32.2,.5,8.2]) rotate([0,13,0]) scale(.545) union(){
rotate([-90,0,0]) translate([.2,-0.55,0]) union(){
    translate([0,0,10]) cylinder(16.5,1.5,1.5,$fn=30);
    scale([1,0.9,1]) rotate([0,0,-90]) translate([-1,0,10]) cylinder(16.5,1.5,1.5,$fn=3);
    translate([0,0,9.5]) cylinder(.5,.8,1.5,$fn=30);
    translate([0,0,7.5]) cylinder(2,.8,.8,$fn=30);
    translate([0,0,6.5]) difference(){
        cylinder(1.3,1.7,1.7,$fn=30);
        translate([0,0,-0.01]) cylinder(1.6,.7,.7,$fn=30);
    }
    translate([0,0,26.5]) cylinder(3,1.8,1.8,$fn=30);
}

//top left gun barrel
rotate([-90,0,-1]) translate([-.3,-0.55,29.3]) union(){
    cylinder(1,2.1,2.1,$fn=30);
    translate([0,0,1]) cylinder(0.7,1.8,1.8,$fn=30);
    translate([0,0,1.7]) cylinder(14,.7,.7,$fn=30);
    translate([0,0,15.7]) cylinder(12,.35,.35,$fn=30);
    translate([0,0,27.7]) cylinder(2,.35,1.5,$fn=30);
    translate([0,0,29.7]) cylinder(7,.5,.2,$fn=30);
}
}







//bottom left wing
scale(0.6) translate([-8.5,0,-1.5]) rotate([0,167,0]) linear_extrude(0.6) polygon([[0,0],[1,0],[1,2],[12,2],[13,0],[45,10],[48,10],[48,13],[49,13],[49,18],[48.5,19.5],[48.5,25],[0,25]],[[0,1,2,3,4,5,6,7,8,9,10,11,12]]);

//bottom left gun
translate([-32.1,.5,-8.05]) rotate([0,167,0]) scale(.545) union(){
rotate([-90,0,0]) translate([.2,-0.55,0]) union(){
    translate([0,0,10]) cylinder(16.5,1.5,1.5,$fn=30);
    scale([1,0.9,1]) rotate([0,0,-90]) translate([-1,0,10]) cylinder(16.5,1.5,1.5,$fn=3);
    translate([0,0,9.5]) cylinder(.5,.8,1.5,$fn=30);
    translate([0,0,7.5]) cylinder(2,.8,.8,$fn=30);
    translate([0,0,6.5]) difference(){
        cylinder(1.3,1.7,1.7,$fn=30);
        translate([0,0,-0.01]) cylinder(1.6,.7,.7,$fn=30);
    }
    translate([0,0,26.5]) cylinder(3,1.8,1.8,$fn=30);
}

//bottom left gun barrel
rotate([-90,0,1]) translate([0.7,-0.55,29.3]) union(){
    cylinder(1,2.1,2.1,$fn=30);
    translate([0,0,1]) cylinder(0.7,1.8,1.8,$fn=30);
    translate([0,0,1.7]) cylinder(14,.7,.7,$fn=30);
    translate([0,0,15.7]) cylinder(12,.35,.35,$fn=30);
    translate([0,0,27.7]) cylinder(2,.35,1.5,$fn=30);
    translate([0,0,29.7]) cylinder(7,.5,.2,$fn=30);
}
}