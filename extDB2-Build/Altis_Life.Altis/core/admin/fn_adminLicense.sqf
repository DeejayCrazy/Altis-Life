#include <macro.h>
/*
	File: fn_adminLicense.sqf
	Created by Stephen "DeejayCrazy" Feil
*/
if(FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

if (playerSide == civilian) then 
{
	license_civ_driver = true;
	license_civ_boat = true;
	license_civ_air = true;
	license_civ_gun = true;
	license_civ_dive = true;
	license_civ_oil = true;
	license_civ_heroin = true;
	license_civ_marijuana = true;
	license_civ_gang = true;
	license_civ_rebel = true;
	license_civ_truck = true;
	license_civ_diamond = true;
	license_civ_salt = true;
	license_civ_coke = true;
	license_civ_sand = true;
	license_civ_iron = true;
	license_civ_copper = true;
	license_civ_cement = true;
	license_civ_home = true;
	systemChat "Added Car, Boat, Air, Gun, Diving, Oil, Heroin, Pot and";
	systemChat "Gang, Rebel, Truck, Diamond, Salt, Coke, Sand, Iron and";
	systemChat "Copper, Cement, Home Owners Licenses";
};

if (playerSide == west) then 
{
	license_cop_air = true;
	license_cop_swat = true;
	license_cop_cg = true;
	systemChat "Added Cop Air, Swat, CG Licenses";
};

if (playerSide == independent) then 
{
	license_med_air = true;
	systemChat "Added Medic Air License";
};
