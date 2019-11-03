/*
 * Logistics configuration for RHS mod.
 * The configuration is splitted in categories dispatched in the included files.
 *Name file RHS.sqf
 * modified by Chamberlain
 */

// Load the logistics config only if the addon is used
if (isClass (configfile >> "CfgPatches" >> "AiA_Core")) then
{
	#include "RHS\Aircraft.sqf"
	#include "RHS\LandVehicles.sqf"
	//#include "RHS\Ship.sqf"
	//#include "RHS\Building.sqf"
	//#include "RHS\ReammoBox.sqf"
	//#include "RHS\Others.sqf"
};
