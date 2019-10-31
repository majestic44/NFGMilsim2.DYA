///////////////////////////////////////////////////////////
//Advanced Sling Loading - Script
///////////////////////////////////////////////////////////

//Add the following to your init.sqf file to disable heavy lifting:
//missionNamespace setVariable ["SA_ASL_HEAVY_LIFTING_ENABLED",false,true];
//Add the following to your init.sqf file to enable heavy lifting (enabled by default):
missionNamespace setVariable ["SA_ASL_HEAVY_LIFTING_ENABLED",true,true];

//////////////////////////////////////////////////////////
//GF-Holster Script
//////////////////////////////////////////////////////////

[] execVM "scripts\GF_Holster\GF_Holster.sqf";

//////////////////////////////////////////////////////////
//CleanUp Script
//////////////////////////////////////////////////////////

[
	60, // seconds to delete dead bodies (0 means don't delete)
	5*60, // seconds to delete dead vehicles (0 means don't delete)
	3*60, // seconds to delete immobile vehicles (0 means don't delete)
	2*60, // seconds to delete dropped weapons (0 means don't delete)
	10*60, // seconds to deleted planted explosives (0 means don't delete)
	0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'scripts\repetitive_cleanup.sqf';

//////////////////////////////////////////////////////////
//Improved grenade throwing and weapon switching actions
//////////////////////////////////////////////////////////

enableSaving [false, false];

Fn_DisplayHint = {
	params ["_hdr", "_mss"];
	waitUntil {isNull findDisplay 72};
	_hdr hintC (_mss apply {parseText _x});
	findDisplay 72 displayAddEventHandler ["unload", {
		_this spawn {hintSilent ""}}]
};

player switchCamera "EXTERNAL";
player setBehaviour "SAFE";
player switchAction "";
player enableSimulation false;
sleep 1;

waitUntil {isNull findDisplay 72};
player enableSimulation true;
call compile preprocessFileLineNumbers "scripts\Xact.sqf";
true call Xact_Enable;
setDate [2035, 6, 6, 12, 0];

//////////////////////////////////////////////////////////
//Player Nametags
//////////////////////////////////////////////////////////

TAGS = addMissionEventHandler ["Draw3D", {
    {
        if (side _x == side player && {alive _x}) then {
            _dist = (player distance _x) / 800; // distance seen
            _color = getArray (configFile/'CfgInGameUI'/'SideColors'/'colorEnemy');
            if (cursorTarget != _x) then {
                _color set [3, 1 - _dist]
            };
            drawIcon3D [
                '',
                _color,
                [
                    visiblePosition _x select 0,
                    visiblePosition _x select 1,
                    (visiblePosition _x select 2) +
                    ((_x modelToWorld (
                        _x selectionPosition 'head'
                    )) select 2) + 0.4 + _dist / 1.5
                ],
                0,
                0,
                0,
                name _x,
                2,
                0.02,
                'PuristaMedium'
            ];
        };
    } count playableUnits - [player];
}];

//////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////
