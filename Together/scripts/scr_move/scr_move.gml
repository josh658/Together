///scr_move

/*
	falling/gravity on player
*/

// setting gravity on the player
if(place_meeting(x,y+grav, obj_solid)){
	while(!place_meeting(x,y+sign(grav), obj_solid)){
		y += sign(grav)
	}
	col = 0;
}else{
	col = 1;
}
	
y += col * grav ;
/*
	END of falling/gravity on player
*/


/*
	jumping algo
	
	TODO:
		-MOVING AND JUMPING
			-NOT ABLE TO CHANGE DIRECTIONS IN THE AIR (AT LEAST NOT TILL LATER IN THE GAME)
*/
if(jump && col == 0){
	//adding physics to the equation
	vspd = 50;
	//looping vspd - grav to get acceleration while jumping
	/* 
		this was not working because this is doing all the work in one frame
		to fix this i need to deminish the vspd per frame (without a while loop)
	*/
	
	if(place_meeting(x, y-vspd, obj_solid)){
		while(!place_meeting(x, y-1, obj_solid)){
			y -= 1;
		}
		vspd = 0;
	}
}

//subtrating grav from vspd
if(col == 1 && vspd > 0){
	vspd -= grav;
	if(vspd < 0){
		vspd = 0;
	}
}

y -= vspd
/*
	END jumping algo
*/

/*
	horizontal movement of the character
	
	TODO:
		-ADD ACCELERATION TO TO MOVEMENT SPEED
		-FIX COLLISION SYSTEM
*/
// moving the character is the horizontal
if(col == 0 && abs(hspd) == 1){
	if(place_meeting(x+(hspd*spd), y, obj_solid)){
		x += hspd
	}
}

x += hspd*spd
/*
	END of horizontal movement of the chracter
*/