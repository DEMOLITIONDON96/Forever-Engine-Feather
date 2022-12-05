function loadAnimations()
{
	addByPrefix('idle', "Mom Idle", 24, false);
	addByIndices('idlePost', 'Mom Idle', [10, 11, 12, 13], "", 24, true);
	addByPrefix('singUP', "Mom Up Pose", 24, false);
	addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
	addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
	addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

	addOffset('idle', 0, 0);
	addOffset('idleHair', 0, 0);
	addOffset('singUP', 14, 71);
	addOffset('singDOWN', 20, -160);
	addOffset('singLEFT', 250, -23);
	addOffset('singRIGHT', 10, -60);

	playAnim('idle');

	set('antialiasing', true);
	setBarColor([216, 85, 142]);
	setCamOffsets(0, 130);
	setOffsets(25, 0);
}
