// Paste your _objects array from Initserver.sqf below
private _objects = 
[
	["Land_CarService_F", [14618.7,16877.4,18.7724], [[0.750538,-0.660827,0],[0,0,1]], [true, false]],
	["Land_cargo_addon02_V2_F", [14563.7,16776.6,19.4699], [[0.723738,-0.690074,0],[0,0,1]], [false, false]]
];

//
//// Function start - Don't edit below if you don't know what you are doing.
// Convert 3D vectors to angles
getAnglesFromVectorDirAndUp = {
	params ["_vectorDir", "_vectorUp"];
	private _fdLength = sqrt(((_vectorDir select 0)^2) + ((_vectorDir select 1)^2) + ((_vectorDir select 2)^2));
	private _fd = [(_vectorDir select 0)/_fdLength, (_vectorDir select 1)/_fdLength, (_vectorDir select 2)/_fdLength];
	private _upLength = sqrt(((_vectorUp select 0)^2) + ((_vectorUp select 1)^2) + ((_vectorUp select 2)^2));
	private _up = [(_vectorUp select 0)/_upLength, (_vectorUp select 1)/_upLength, (_vectorUp select 2)/_upLength];
	private _right = [
		((_up select 1) * (_fd select 2)) - ((_up select 2) * (_fd select 1)),
		((_up select 2) * (_fd select 0)) - ((_up select 0) * (_fd select 2)),
		((_up select 0) * (_fd select 1)) - ((_up select 1) * (_fd select 0))
	];
	private _r11 = _right select 0;
	private _r21 = _right select 1;
	private _r31 = _right select 2;
	private _r12 = _fd select 0;
	private _r22 = _fd select 1;
	private _r32 = _fd select 2;
	private _r13 = _up select 0;
	private _r23 = _up select 1;
	private _r33 = _up select 2;
	private _pitch = asin(-_r32);
	private _roll = (_r31) atan2 (_r33);
	private _yaw = (_r12) atan2 (_r22);
	
	[_pitch, _roll, _yaw]
};
// create create3DENEntities
collect3DENHistory {

	{
		private[ "_obj" ];
		_x params[ "_type", "_pos", "_VectorUpAndDir" ];

		_obj = create3DENEntity [ "Object", _type, _pos, true ];
		_obj setPosASL _pos;
		_obj setVectorDirAndUp _VectorUpAndDir;
		
	} forEach _objects;
};
// Update edenAttributes
{
	_VectorUpAndDir = [vectorDir _x,vectorUp _x];
	_convertXYZYaw =  [_VectorUpAndDir select 0, _VectorUpAndDir select 1] call getAnglesFromVectorDirAndUp;
	_x set3DENAttribute ["position",getposATL _x];
	_x set3DENAttribute ["Rotation",_convertXYZYaw];
		
} forEach (all3DENEntities select 0);
