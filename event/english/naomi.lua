-- Naomi's Dorm

local function main()
	sfx.clear();
	hud.title('Naomi\'s Dorm');
	hud.fade_in();
end

local function door_to_hallway()
	local THIS_DOOR_ID = 100;
	local THAT_DOOR_ID = 100;

	sys.lock();
	env.animate(THIS_DOOR_ID, 1, 2);
	sfx.sound('door');
	hud.fade_out();
	sys.transfer('common', THAT_DOOR_ID);
end

local function use_computer()
	local COMPUTER_ID = 200;

	sys.freeze();
	env.animate(COMPUTER_ID, 1, 2);
	sfx.sound('cmptr');
	hud.load();
end

local function shoshi_bed()
	sys.lock();
	hud.high();
	hud.face(1, 3);
	hud.say('Shoshi\'s Bed...');
	sys.stall();
end

local function introduction()
	sfx.clear();
	hud.message(true, 240.0, 72.0, 4, 'Apostéllein');
	sys.wait(1.5);
	hud.erase();
	hud.fade_in();
end

return {
	main = main,
	door_to_hallway = door_to_hallway,
	use_computer = use_computer,
	shoshi_bed = shoshi_bed,
	introduction = introduction
};
