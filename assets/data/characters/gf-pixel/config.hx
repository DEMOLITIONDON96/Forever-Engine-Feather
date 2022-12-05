function loadAnimations()
{
	addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], 24, false);
	addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], 24, false);

	addOffset('danceLeft', 0, 0);
	addOffset('danceRight', 0, 0);

	setGraphicSize(get('width') * 6);
	characterData.antialiasing = false;
	characterData.assetModifier = 'pixel';
	characterData.missColor = [174, 181, 229];

	playAnim('danceRight');

	setOffsets(10, 630);
	setBarColor([165, 0, 77]);
}
