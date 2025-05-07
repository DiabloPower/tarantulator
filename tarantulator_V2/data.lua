path = "__tarantulator_V2__"
require("__tarantulator_V2__.prototypes.ammo")
require("__tarantulator_V2__.prototypes.projectile")
require("__tarantulator_V2__.prototypes.guns")
require("__tarantulator_V2__.prototypes.entity")
require("__tarantulator_V2__.prototypes.items")
require("__tarantulator_V2__.prototypes.equipment_grid")
require("__tarantulator_V2__.prototypes.recipes")
require("__tarantulator_V2__.prototypes.technology")

local function merge(prototype, new_data)
	prototype = table.deepcopy(prototype)
	for k, v in pairs(new_data) do
		prototype[k] = v
	end
	return prototype
end

data:extend({
	merge(data.raw['spider-leg']['spidertron-leg-1'], {
		name = 'tarantulator-leg',
		initial_movement_speed = 0.05,
		movement_acceleration = 0.5,
		part_length = 7,
	}),
	merge(data.raw['spider-leg']['spidertron-leg-1'], {
		name = 'tarantulator-leg-small',
		part_length = 2.5,
		initial_movement_speed = 0.05,
		movement_acceleration = 0.5,
		join_turn_offset = 0.375,
	}),
})

if mods.bobenemies then
	table.insert(data.raw['spider-vehicle']['tarantulator'].resistances, {type = 'plasma', decrease = 6, percent = 50})
	table.insert(data.raw['spider-vehicle']['tarantulator'].resistances, {type = 'bob-pierce', decrease = 6, percent = 50})
	table.insert(data.raw['spider-vehicle']['tarantulator']['spider-engine'].resistances, {type = 'plasma', decrease = 10, percent = 100})
	table.insert(data.raw['spider-vehicle']['tarantulator']['spider-engine'].resistances, {type = 'bob-pierce', decrease = 10, percent = 100})
end
