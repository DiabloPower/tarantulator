local transfer_efficiency = 0.05
local global = {}

script.on_nth_tick(240, function(event)
    global.tarantulators = global.tarantulators or {}

    for id, spider in pairs(global.tarantulators) do
        if spider and spider.valid and spider.grid then
            local grid = spider.grid
            for _, equipment in pairs(grid.equipment) do
                if equipment.max_energy and equipment.energy then
                    local missing = equipment.max_energy - equipment.energy
                    if missing > 0 and spider.burner and spider.burner.remaining_burning_fuel then
                        if spider.burner.remaining_burning_fuel < missing / transfer_efficiency then
                            equipment.energy = equipment.energy + spider.burner.remaining_burning_fuel * transfer_efficiency
                            spider.burner.remaining_burning_fuel = 0
                            break
                        else
                            spider.burner.remaining_burning_fuel = spider.burner.remaining_burning_fuel - missing / transfer_efficiency
                            equipment.energy = equipment.energy + missing
                        end
                    end
                end
            end
        else
            global.tarantulators[id] = nil
        end
    end
end)

local function tarantulator_built(event)
	local entity = event.created_entity or event.entity
	entity.grid.put{
		name = 'tarantulator-reactor',
		position = {3, 4},
	}
	global.tarantulators[entity.unit_number] = entity
end

local filter = {{filter = 'name', name = 'tarantulator'}, {filter = 'type', type = 'spider-vehicle', mode = 'and'}}
script.on_event(defines.events.on_built_entity, tarantulator_built, filter)
script.on_event(defines.events.on_robot_built_entity, tarantulator_built, filter)
script.on_event(defines.events.script_raised_built, tarantulator_built, filter)
script.on_event(defines.events.script_raised_revive, tarantulator_built, filter)

script.on_event(defines.events.on_player_removed_equipment, function(event)
	if event.equipment == 'tarantulator-reactor' then
		event.grid.put{
			name = 'tarantulator-reactor',
			position = {3, 4},
		}
		game.players[event.player_index].remove_item{name = 'tarantulator-reactor', count = 100}
	end
end)

local function setup()
	global.tarantulators = global.tarantulators or {}
end

script.on_init(setup)
script.on_configuration_changed(setup)

script.on_event(defines.events.on_tick, function(event)  
    if math.fmod(event.tick, 60) == 0 then
        game.forces["player"].friendly_fire = false
    end
end)
