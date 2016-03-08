//main body

BODY_BACK_LENGTH = 15;
CABIN_LENGTH = 5;
BODY_FRONT_LENGTH = 30;

FLATTEN_BODY_FACTOR = [1.1, 0.9, 1];
BODY_PART_REFINEMENT = 6;
BODY_RADIUS = 5.5;
CABIN_FRONT_RADIUS = 4;

SHIP_NOSE_CUBE_HELPER_SIZE = 20;
SHIP_NOSE_ROTATION_CORRECTION_FOR_HELPER_CYLINDER = 5;

module body_back() {

	scale(FLATTEN_BODY_FACTOR) 
		cylinder(BODY_BACK_LENGTH, BODY_RADIUS, BODY_RADIUS, $fn=BODY_PART_REFINEMENT);
}


module cabin() {
	
	offset = [0, 0, BODY_BACK_LENGTH];
	
	translate(offset) 
		scale(FLATTEN_BODY_FACTOR)
			cylinder(CABIN_LENGTH ,BODY_RADIUS ,CABIN_FRONT_RADIUS, $fn=BODY_PART_REFINEMENT);
}

module body_front() {

	offset = [0, 0 ,BODY_BACK_LENGTH + CABIN_LENGTH];
	front_radius = 2;

	translate(offset) 
		scale(FLATTEN_BODY_FACTOR)
			cylinder(BODY_FRONT_LENGTH ,CABIN_FRONT_RADIUS ,front_radius ,$fn=BODY_PART_REFINEMENT);
}

module main_body() {
	right = [270,0,0];
	rotate(right) 
		union() {
		    body_back();
		    cabin();
			body_front();
		}
}


module ship_nose_helper_cylinder(flatten_factor_y, correction) {
	
    flatten_factor = [1.5, flatten_factor_y, 1];
	offset = [0, correction, 0];
	
    refinement = 100;
	length = 6;
	radius = 10;
    
	scale(flatten_factor)
		translate(offset) 
			cylinder(h=length, r1=radius, r2=radius, $fn=refinement);
}

module ship_nose_helper_cube(offset) {
    
    translate(offset) 
		cube(SHIP_NOSE_CUBE_HELPER_SIZE);
}

module ship_nose_upper_part() {
    
	cube_offset_first_cut = [-20, -15, -1];
    cube_offset_second_cut = [-1, -20, -1];
    flatten_factor_y = 0.8;
    correction = -SHIP_NOSE_ROTATION_CORRECTION_FOR_HELPER_CYLINDER;
    
    difference(){
        ship_nose_helper_cylinder(flatten_factor_y, correction);
        ship_nose_helper_cube(cube_offset_first_cut);  
        ship_nose_helper_cube(cube_offset_second_cut);
    }
}

module ship_nose_lower_part() {

    cube_offset_first_cut = [-20, -10, -1];
    cube_offset_second_cut = [-1, -0.01, -1];
    flatten_factor_y = 0.4;
    correction = SHIP_NOSE_ROTATION_CORRECTION_FOR_HELPER_CYLINDER;

	difference(){
        ship_nose_helper_cylinder(flatten_factor_y, correction);
        ship_nose_helper_cube(cube_offset_first_cut);  
        ship_nose_helper_cube(cube_offset_second_cut);
	}
}

module ship_inner_part() {
    
    flatten_factor = [0.9, 0.6, 1];
    slightly_rotate_and_turn_right = [4, 90, 0];
    offset = [-3.4, 1.7, 0];
    back_radius = 5;
    front_radius = 2;
    length = 10.8;
    
	rotate(slightly_rotate_and_turn_right) 
		scale(flatten_factor) 
			translate(offset) 
				cylinder(length, back_radius, front_radius, $fn=BODY_PART_REFINEMENT);
}

function half(value) = value/2;



module ship_nose() {

    cylinder_radius = 6;
    offset_x = half(half(cylinder_radius));
    offset_y = BODY_BACK_LENGTH + CABIN_LENGTH + BODY_FRONT_LENGTH;
    offset_z = -0.5;
    adjustment = 0.2;
    to_half = 0.5;
    left_and_turn_right = [90,0,90];
    
    offset = [-offset_x, offset_y - adjustment, offset_z];
   
	translate(offset) 
		scale(to_half) 
			rotate(left_and_turn_right) 
				union() {
			    	ship_nose_upper_part();
					ship_nose_lower_part();
					ship_inner_part();
				}
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

module xwing() {
	main_body();
	ship_nose();
}

xwing();