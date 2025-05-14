-- Defines the mod path for resource referencing
path = "__tarantulator_V2__"

-- Loads various mod prototypes (ammo, weapons, vehicles, etc.)
require("__tarantulator_V2__.prototypes.ammo")
require("__tarantulator_V2__.prototypes.projectile")
require("__tarantulator_V2__.prototypes.guns")
require("__tarantulator_V2__.prototypes.entity")
require("__tarantulator_V2__.prototypes.items")
require("__tarantulator_V2__.prototypes.equipment_grid")
require("__tarantulator_V2__.prototypes.recipes")
require("__tarantulator_V2__.prototypes.technology")

-- Function to merge new data into an existing prototype
local function merge(prototype, new_data)
    prototype = table.deepcopy(prototype) -- Creates a copy of the original prototype
    for k, v in pairs(new_data) do
        prototype[k] = v -- Updates the data with new values
    end
    return prototype -- Returns the modified prototype
end

-- Defines custom spider-leg variations for the Tarantulator
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

-- Adds extra resistances if the "BobEnemies" mod is active
if mods.bobenemies then
    table.insert(data.raw['spider-vehicle']['tarantulator'].resistances, {type = 'bob-pierce', decrease = 6, percent = 50})    
    table.insert(data.raw['spider-vehicle']['tarantulator']['spider_engine'].resistances, {type = 'bob-pierce', decrease = 10, percent = 100})
end

-- Modifies Tarantulator's recipe if the "Space Age" mod is present
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

-- Adjusts the energy system based on mod settings
if settings.startup["tarantulator-disable-burner-engine"].value == "void" then
    data.raw["spider-vehicle"]["tarantulator"].energy_source = {
        type = "void",
    }

    local efficiency_factor = settings.startup["tarantulator-energy-grid-efficiency"].value / 100
    local base_energy_output = 50 * efficiency_factor

    -- Updates generator settings for the Tarantulator
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

-- Adjusts technology prerequisites and recipes based on mod settings
if settings.startup["tarantulator-tech-option"].value == "early-tarantulator" then
    if settings.startup["tarantulator-assault-spidertron-integration"].value == "assault-spidertron" then
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

-- Enables automatic weapon cycling based on settings
if settings.startup["tarantulator-cycle-weapons"].value == "yes" then
    data.raw["spider-vehicle"]["tarantulator"].automatic_weapon_cycling = true
end

-- Function to generate a dynamic list of weapons based on settings
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

-- Assigns generated weapons to the Tarantulator entity
local tarantulator = data.raw["spider-vehicle"]["tarantulator"]

if tarantulator then
    tarantulator.guns = generate_gun_list()
end

-- Adjusts engine efficiency based on mod settings
local engine_efficiency_factor = settings.startup["tarantulator-engine-efficiency"].value / 100
data.raw["spider-vehicle"]["tarantulator"].energy_source.effectivity = 0.5 * engine_efficiency_factor

-- Configures different visual variations based on startup settings
-- (Medium or Skinny models)
if settings.startup["tarantulator-diet"].value == "medium" then
	data.raw["spider-vehicle"]["tarantulator"].graphics_set.base_animation = {
        layers = {
            {
                direction_count = 1,
                filename = path .. "/graphics/entity/tarantulator/torso/hr-tarantulator-body-bottom_medium.png",
                width = 189,
                height = 242,
                scale = 0.5,
                line_length = 1,
                shift = {0, 1},
            },
            {
                apply_runtime_tint = true,
                direction_count = 1,
                filename = path .. "/graphics/entity/tarantulator/torso/hr-tarantulator-body-bottom-mask.png",
                width = 186,
                height = 135,
                scale = 0.5,
                line_length = 1,
                shift = {0, 0.109375},
            }
        }
    }
elseif settings.startup["tarantulator-diet"].value == "skinny" then
	data.raw["spider-vehicle"]["tarantulator"].graphics_set.base_animation = {
        layers = {
            {
                direction_count = 1,
                filename = path .. "/graphics/entity/tarantulator/torso/hr-tarantulator-body-bottom_skinny.png",
                width = 189,
                height = 242,
                scale = 0.5,
                line_length = 1,
                shift = {0, 1},
            },
            {
                apply_runtime_tint = true,
                direction_count = 1,
                filename = path .. "/graphics/entity/tarantulator/torso/hr-tarantulator-body-bottom-mask.png",
                width = 186,
                height = 135,
                scale = 0.5,
                line_length = 1,
                shift = {0, 0.109375},
            }
        }
    }
end

-- Exclude vehicles from AAI Vehicles
if mods["aai-programmable-vehicles"] then
    table.insert(aai_vehicle_exclusions, "tarantulator")
end