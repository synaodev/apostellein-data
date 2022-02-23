-- Global Events

local function boot()
	local intro = sys.link('naomi', 'introduction');
	if intro == nil then
		sys.log('Cannot link naomi.introduction!');
	else
		sys.call(intro, 200);
	end
end

local function empty()
	sys.freeze();
	hud.high();
	hud.say(sys.i18n('Empty', 1));
	sys.stall();
end

local function bed()
	sys.freeze();
	hud.high();

	local question = {
		sys.i18n('Bed', 1),
		sys.i18n('Bed', 2),
		sys.i18n('Bed', 3)
	};
	local answer = hud.ask(question);

	if answer == 1 then
		sys.flag(1, true);
		hud.close();
		hud.save();
	elseif answer == 2 then
		hud.close();
		sfx.fade_out(2.0);
		hud.fade_out();
		sys.wait(1.0);

		hud.high();
		hud.say(sys.i18n('Bed', 4));
		sys.stall();
		hud.close();

		plr.restore(16);

		sys.wait(1.0);
		hud.fade_in();
		sfx.resume(1.0);
		sys.wait(0.5);

		hud.high();
		hud.say(sys.i18n('Bed', 5));
		sys.stall();
	end
end

-- how: u32
local function death(how)
	local words = '';
	if how == 1 then
		sfx.sound('player_death');
		sfx.sound('crash');
		words = sys.i18n('Death', 2);
	elseif how == 2 then
		sfx.sound('player_death');
		sfx.sound('crash');
		words = sys.i18n('Death', 1);
	elseif how == 3 then
		words = sys.i18n('Death', 3);
	elseif how == 4 then
		plr.animate(16, 0x0);
		words = sys.i18n('Death', 4);
	elseif how == 5 then
		words = sys.i18n('Death', 5);
	else
		words = sys.i18n('Death', 6);
	end

	sys.lock();
	sfx.clear();
	sys.wait(1.5);

	if sfx.load('game-over') then
		sfx.play(0.0, 0.0);
	end

	sys.freeze();
	hud.high();
	hud.say(words);
	sys.stall();

	if sys.flag_at(1) then
		hud.clear();
		hud.say(sys.i18n('Death', 7));
		sys.stall();

		local question = {
			sys.i18n('Main', 2),
			sys.i18n('Main', 3)
		};
		local answer = hud.ask(question);

		hud.close();
		hud.fade_out();
		sfx.fade_out(1.0);
		sys.wait(1.0);
		sfx.clear();

		if answer == 1 then
			sys.load();
		else
			sys.boot();
		end

	else
		hud.close();
		hud.fade_out();
		sfx.fade_out(1.0);
		sys.wait(1.0);
		sfx.clear();
		sys.boot();
	end
end

-- item: u32
local function inventory(item)
	hud.low();
	if item > sys.i18n_size('Inventory') then
		hud.say(sys.i18n('Main', 4));
	else
		hud.say(sys.i18n('Inventory', item + 1));
	end
	sys.stall();
end

return {
	boot = boot,
	empty = empty,
	bed = bed,
	death = death,
	inventory = inventory
};
