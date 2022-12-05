function loadAnimations()
{
	addByPrefix('idle', 'Parent Christmas Idle', 24, false);
	addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
	addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
	addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
	addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

	addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);
	addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
	addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
	addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

	addOffset('idle', 0, 0);
	addOffset('singUP', -47, 24);
	addOffset('singDOWN', -31, -29);
	addOffset('singLEFT', -30, 16);
	addOffset('singRIGHT', -1, -23);

	addOffset('singUP-alt', -47, 24);
	addOffset('singDOWN-alt', -30, -27);
	addOffset('singLEFT-alt', -30, 15);
	addOffset('singRIGHT-alt', -1, -24);

	playAnim('idle');

	set('antialiasing', true);
	setBarColor([196, 94, 174]);
	setOffsets(-10, 0);
}
