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

if mods["space-age"] then
    data.raw.recipe["tarantulator"].ingredients = {
        {type = "item", name = "nuclear-reactor", amount = 1},
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "electric-engine-unit", amount = 200},
        {type = "item", name = "processing-unit", amount = 400},
		{type = "item", name = "radar", amount = 2},
        {type = "item", name = "uranium-fuel-cell", amount = 20},
        {type = "item", name = "low-density-structure", amount = 50}
    }
end

if settings.startup["tarantulator-disable-burner-engine"].value == "void" then
    data.raw["spider-vehicle"]["tarantulator"].energy_source = {
        type = "void",
    }

    local efficiency_factor = settings.startup["tarantulator-energy-grid-efficiency"].value / 100
    local base_energy_output = 50 * efficiency_factor

    local reactor = data.raw["generator-equipment"]["tarantulator-reactor"]
    reactor.power = tostring(base_energy_output) .. "MW"
    reactor.energy_source = {
        type = "electric",
        buffer_capacity = "2GJ",
        input_flow_limit = tostring(base_energy_output) .. "MW",
        output_flow_limit = tostring(base_energy_output) .. "MW",
        usage_priority = "primary-output"
    }
end

if settings.startup["tarantulator-tech-option"].value == "early-tarantulator" then
	if settings.startup["tarantulator-assauslt-spidertron-integration"].value == "assault-spidertron" then
		data.raw.technology["tarantulator"].prerequisites = {"assault_spidertron_tech", "tank", "nuclear-power"}
		data.raw.recipe["tarantulator"].ingredients = {
			{type = "item", name = "assault_spidertron", amount = 1},
			{type = "item", name = "nuclear-reactor", amount = 1},
			{type = "item", name = "radar", amount = 1},
			{type = "item", name = "uranium-fuel-cell", amount = 20},
		}
	else
		data.raw.technology["tarantulator"].prerequisites = {"tank", "nuclear-power"}
		data.raw.recipe["tarantulator"].ingredients = {
			{type = "item", name = "tank", amount = 1},
			{type = "item", name = "nuclear-reactor", amount = 1},
			{type = "item", name = "electric-engine-unit", amount = 200},
			{type = "item", name = "radar", amount = 2},
			{type = "item", name = "uranium-fuel-cell", amount = 20},
		}
	end
end

if settings.startup["tarantulator-cycle-weapons"].value == "yes" then
	data.raw["spider-vehicle"]["tarantulator"].automatic_weapon_cycling = true
end

local function generate_gun_list()
	local guns = {}
	local rocket_launcher_count = tonumber(settings.startup["tarantulator-rocket-launcher-amount"].value) or 1
	local railgun_count = tonumber(settings.startup["tarantulator-railgun-amount"].value) or 1
  
	if settings.startup["tarantulator-enable-gun-rocket-launcher"].value then
		for i = 1, rocket_launcher_count do
			table.insert(guns, "spidertron-rocket-launcher-" .. i)
		end
	end
	if settings.startup["tarantulator-enable-gun-railgun"].value then
		for i = 1, railgun_count do
			table.insert(guns, "tarantulator-railgun")
		end
	end
  
	return guns
  end
  
  local tarantulator = data.raw["spider-vehicle"]["tarantulator"]
  
  if tarantulator then
	tarantulator.guns = generate_gun_list()
  end

local engine_efficiency_factor = settings.startup["tarantulator-engine-efficiency"].value / 100
data.raw["spider-vehicle"]["tarantulator"].energy_source.effectivity = 0.5 * engine_efficiency_factor
