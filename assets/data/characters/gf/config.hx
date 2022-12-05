function loadAnimations()
{
	addByPrefix('cheer', 'GF Cheer', 24, false);
	addByPrefix('singLEFT', 'GF left note', 24, false);
	addByPrefix('singRIGHT', 'GF Right Note', 24, false);
	addByPrefix('singUP', 'GF Up Note', 24, false);
	addByPrefix('singDOWN', 'GF Down Note', 24, false);
	addByPrefix('scared', 'GF FEAR', 24);

	addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 24, false);
	addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], 24, false);
	addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], 24, false);
	addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], 24);
	addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 24, false);

	addOffset("danceLeft", 0, -9);
	addOffset("danceRight", 0, -9);
	addOffset("hairBlow", 45, -8);
	addOffset("hairFall", 0, -9);
	addOffset("cheer", 0, 0);
	addOffset("sad", -2, -20);
	addOffset("scared", -2, -18);

	addOffset("singLEFT", 0, -19);
	addOffset("singDOWN", 0, -20);
	addOffset("singUP", 0, 4);
	addOffset("singRIGHT", 0, -20);

	playAnim('danceRight');

	set('antialiasing', true);
	setBarColor([165, 0, 77]);
	setOffsets(0, 580);
}
