function loadAnimations()
{
	addByPrefix('singUP', 'spooky UP NOTE', 24, false);
	addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
	addByPrefix('singLEFT', 'note sing left', 24, false);
	addByPrefix('singRIGHT', 'spooky sing right', 24, false);
	addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], 12, false);
	addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], 12, false);

	addOffset('danceLeft', 80, -190);
	addOffset('danceRight', 80, -190);
	addOffset('singUP', 60, -164);
	addOffset('singRIGHT', -50, -204);
	addOffset('singLEFT', 210, -200);
	addOffset('singDOWN', 30, -320);

	playAnim('danceRight');

	set('antialiasing', true);
	setBarColor([213, 126, 0]);
	setCamOffsets(0, 250);
	setOffsets(0, -190);
	quickDancer(false);
}
