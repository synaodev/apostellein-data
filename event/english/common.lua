-- Common Room

local function main()
	hud.title('Common Room');
	hud.fade_in();
end

local function door_to_naomi()
	local THIS_DOOR_ID = 100;
	local THAT_DOOR_ID = 100;

	sys.lock();
	env.animate(THIS_DOOR_ID, 1, 2);
	sfx.sound('door');
	hud.fade_out();
	sys.transfer('naomi', THAT_DOOR_ID);
end

local function door_to_practice()
	local THIS_DOOR_ID = 300;
	local THAT_DOOR_ID = 100;

	sys.lock();
	env.animate(THIS_DOOR_ID, 1, 2);
	sfx.sound('door');
	hud.fade_out();
	sys.transfer('practice', THAT_DOOR_ID);
end

local function check_fireplace()
	sys.lock();
	hud.high();
	hud.say('Crackle!\nSnap!');
	sys.stall();
	hud.clear();
	hud.say('It\'s hot...');
	sys.stall();
end

return {
	main = main,
	door_to_naomi = door_to_naomi,
	door_to_practice = door_to_practice,
	check_fireplace = check_fireplace
};
