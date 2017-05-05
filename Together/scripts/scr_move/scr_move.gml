///scr_move

x += hspd * spd;

//moving the player left of right
if(vspd == 0){
	y += -vspd;
}

if(vspd > 0){
	if(place_meeting(x+hspd, y-vspd, all)){
		while(!place_meeting(x+sign(hspd), y-sign(vspd), all)){
			x += sign(hspd); 
			y -= sign(vspd);
		}
		vspd = 0;
	}
	y += -vspd;
	vspd -= grav;
}

