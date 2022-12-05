function songCutscene()
{
	for (hud in allUIs)
		hud.visible = false;

	var black:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, 0xFF000000);
	black.scrollFactor.set();
	add(black);

	new FlxTimer().start(0.3, function(tmr:FlxTimer)
	{
		black.alpha -= 0.15;
		if (black.alpha > 0)
		{
			tmr.reset(0.3);
		}
		else
		{
			for (hud in allUIs)
				hud.visible = true;
			game.callTextbox();
		}
	});
}
