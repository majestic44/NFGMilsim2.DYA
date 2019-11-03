// Improved grenade throwing and weapon switching actions script v1.2  Serena 28.12.2016
// Keys binded to switch on primary/secondary/handgun weapon, if corresponding weapon allready in hands, allow to holster/move on back that weapon
// Throwing distances of hand grenades can be controlled by holding throw key. After push and holding for short time, you hear the sound of pulled out grenade safety pin. At this moment, if you release the key, you just drop a grenade right under your feet. Holding button up to 1.5 seconds proportionally increases grenade initial speed and throwing distance.
// Usage:
//	call compile preprocessFileLineNumbers "Xact.sqf";
//	true call Xact_Enable;

#define DISPLAYG (findDisplay 46)
#define XACTDATA "Xact_InternalData"

Xact_OnThrowGrenade = {
	private _unt = player;	
	private _rec = DISPLAYG getVariable XACTDATA;
	private _sta = time;
	private _frc = -0.1;

	while {_rec select 2} do {
		sleep 0.1;
		private _tps = time - _sta;
		if (_tps < 1.0) then {
			if (_frc < 0 and _tps > 0.7) then {
				_frc = 0.001;
				playSound3D ["a3\sounds_f\weapons\Other\dry2.wss",
					_unt, false, _unt modelToWorld (_unt selectionPosition "spine3"), 2.5]}
		} else {
			if (_tps < 2.6) then {
				_frc = (_tps - 1.0) / 1.5 min 1}
		}
	};
	
	private _thr = currentThrowable _unt;
	
	if (_frc > 0 and {count _thr > 0}) then {
		_rec set [4, _frc];
		_unt addEventHandler ["Fired", {
			params ["_unt", "_wpn", "", "", "", "", "_prj"];
			private _rec = DISPLAYG getVariable XACTDATA;
			_unt removeEventHandler ["Fired", _thisEventHandler];			
			if (not isNil "_rec" and {_wpn isEqualTo "Throw"}) then {
				_prj setVelocity (velocity _prj vectorMultiply (1.1 * sqrt (_rec select 4)));
				playSound3D ["a3\sounds_f\weapons\Other\dry3.wss", 
					_unt, false, getPosASL _prj, 2]}}];
					
		_unt action ["UseMagazine", _unt, _unt, _thr select 2 select 1, _thr select 2 select 0]
	}
};

Xact_OnHolsterWeapon = {
	_this spawn {
		private _unt = _this;
		if (stance _unt == "CROUCH") then {
			_unt playAction "Up"};
		_unt action ["SwitchWeapon", _unt, _unt, -1];
		_unt switchCamera cameraView}
};

Xact_OnKeyDown = {
	private _unt = player;
	private _rec = DISPLAYG getVariable XACTDATA;
		
	if (not isNil "_rec" and {inputAction "Throw" > 0}) exitWith {
		_rec params ["", "", "_gta", "_gts"];
		if (not _gta and {scriptDone _gts} and {count currentThrowable _unt > 0}) then {
			_rec set [2, true];
			_rec set [3, 0 spawn Xact_OnThrowGrenade]};
		true};

	private _cwt = [1, 2, 4] find getNumber (configFile >> "CfgWeapons" >> currentWeapon _unt >> "Type");		
	if (not isNil "_rec" and {_cwt >=0} and {inputAction (["SwitchPrimary", "SwitchHandgun", "SwitchSecondary"] select _cwt) > 0}) exitWith {
		_unt call Xact_OnHolsterWeapon;
		true};
		
	false
};

Xact_OnKeyUp = {
	private _rec = DISPLAYG getVariable XACTDATA;
	if (not isNil "_rec" and {inputAction "Throw" < 1}) then {
		_rec set [2, false]};
	false
};

Xact_Enable = {
	private _enb = _this;
	private _rec = DISPLAYG getVariable XACTDATA;
	if (not isNil "_rec") then {
		{DISPLAYG displayRemoveEventHandler [_x, _rec select _forEachIndex]} forEach ["KeyDown", "KeyUp"];
		DISPLAYG setVariable [XACTDATA, nil];
	};
	if (_enb) then {
		DISPLAYG setVariable [XACTDATA, [
			DISPLAYG displayAddEventHandler ["KeyDown", {call Xact_OnKeyDown}],
			DISPLAYG displayAddEventHandler ["KeyUp", {call Xact_OnKeyUp}],
			false, scriptNull, 0.0]];
	}
};


