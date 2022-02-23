-- Silver

local function main()
	hud.fade_in();
end

local function door_to_practice()
	local THIS_DOOR_ID = 100;
	local THAT_DOOR_ID = 300;

	sys.lock();
	env.animate(THIS_DOOR_ID, 1, 2);
	sfx.sound('door');
	hud.fade_out();
	sys.transfer('practice', THAT_DOOR_ID);
end

return {
	main = main,
	door_to_practice = door_to_practice
};
