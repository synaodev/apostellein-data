-- Practice Room

local function main()
	hud.fade_in();
end

local function door_to_common()
	local THIS_DOOR_ID = 100;
	local THAT_DOOR_ID = 300;

	sys.lock();
	env.animate(THIS_DOOR_ID, 1, 2);
	sfx.sound('door');
	hud.fade_out();
	sys.transfer('common', THAT_DOOR_ID);
end

local function door_to_silver()
	local THIS_DOOR_ID = 300;
	local THAT_DOOR_ID = 100;

	sys.lock();
	env.animate(THIS_DOOR_ID, 1, 2);
	sfx.sound('door');
	hud.fade_out();
	sys.transfer('silver', THAT_DOOR_ID);
end

return {
	main = main,
	door_to_common = door_to_common,
	door_to_silver = door_to_silver
};
