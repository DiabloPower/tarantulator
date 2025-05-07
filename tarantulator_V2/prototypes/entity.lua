path = "__tarantulator_V2__"

local leg_hit_the_ground_trigger = {{
	offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
	repeat_count = 4,
	smoke_name = 'smoke-building',
	speed_from_center = 0.03,
	starting_frame_deviation = 5,
	starting_frame_speed_deviation = 5,
	type = 'create-trivial-smoke',
}}

local leg_hit_the_ground_trigger = {{
    offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
    repeat_count = 4,
    smoke_name = 'smoke-building',
    speed_from_center = 0.03,
    starting_frame_deviation = 5,
    starting_frame_speed_deviation = 5,
    type = 'create-trivial-smoke',
}}

data:extend({
    {
        type = "spider-vehicle",
        name = 'tarantulator',
		minimap_representation = {
			filename = path .. '/graphics/entity/tarantulator/tarantulator-map.png',
			flags = {'icon'},
			scale = 0.75,
			size = {128, 128}
		},
		equipment_grid = 'tarantulator-equipment-grid',
		torso_rotation_speed = 0.02,
		automatic_weapon_cycling = false,
		chunk_exploration_radius = 4,
		chain_shooting_cooldown_modifier = 0.4,
		collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		movement_energy_consumption = "60MW",
		energy_source = {
			type = 'burner',
			fuel_inventory_size = 2,
			burnt_inventory_size = 1,
			fuel_categories = {'nuclear'},
			effectivity = 0.5,
		},
		height = 2.25,
		inventory_size = 100,
        trash_inventory_size = 20,
        logistic_slot_count = 10,
		max_health = 5000,
        weight = 1,
        braking_force = 1,
        friction_force = 1,
		minable = {
			mining_time = 2,
			result = 'tarantulator'
		},
        guns = {
			'spidertron-rocket-launcher-1',
			'spidertron-rocket-launcher-2',
			'spidertron-rocket-launcher-3',
			'spidertron-rocket-launcher-4',
			'tarantulator-railgun',
		},
        energy_per_hit_point = 1,
        spider_engine = {
            initial_movement_speed = 0.5,
            movement_acceleration = 1.0,
            legs = {
                {
                    leg = "tarantulator-leg",
                    mount_position = util.by_pixel(15, -20),
                    ground_position = {3.375 * 2, -3.75},
                    blocking_legs = {2},
                    walking_group = 1,
                },
                {
                    leg = "tarantulator-leg-small",
                    mount_position = util.by_pixel(25, 0),
                    ground_position = {3.5, -1.25},
                    blocking_legs = {1, 3},
                    walking_group = 2,
                },
                {
                    leg = "tarantulator-leg-small",
                    mount_position = util.by_pixel(15, 18),
                    ground_position = {3.5, 1.25},
                    blocking_legs = {2},
                    walking_group = 3,
                },
                {
                    leg = "tarantulator-leg",
                    mount_position = util.by_pixel(-15, -20),
                    ground_position = {-3.375 * 2, -3.75},
                    blocking_legs = {5},
                    walking_group = 4,
                },
                {
                    leg = "tarantulator-leg-small",
                    mount_position = util.by_pixel(-25, 0),
                    ground_position = {-3.5, -1.25},
                    blocking_legs = {4, 6},
                    walking_group = 5,
                },
                {
                    leg = "tarantulator-leg-small",
                    mount_position = util.by_pixel(-15, 18),
                    ground_position = {-3.5, 1.25},
                    blocking_legs = {5},
                    walking_group = 6,
                },
                {
                    leg = "tarantulator-leg",
                    mount_position = util.by_pixel(-15, 20),
                    ground_position = {-3.375 * 2, 3.75},
                    blocking_legs = {8},
                    walking_group = 7,
                },
                {
                    leg = "tarantulator-leg",
                    mount_position = util.by_pixel(15, 20),
                    ground_position = {3.375 * 2, 3.75},
                    blocking_legs = {7},
                    walking_group = 8,
                }
            },                 
			military_target = 'spidertron-military-target',
			damage_per_hit = 0,
            resistances =
            {
                {
                    type = "physical",
                    decrease = 10,
                    percent = 100
                },
                {
                    type = "explosion",
                    decrease = 10,
                    percent = 100
                },
                {
                    type = "acid",
                    decrease = 10,
                    percent = 100
                },
                {
                    type = "fire",
                    decrease = 10,
                    percent = 100
                },
                {
                    type = "impact",
                    decrease = 10,
                    percent = 100
                },
                {
                    type = "electric",
                    decrease = 10,
                    percent = 100
                },
                {
                    type = "laser",
                    decrease = 10,
                    percent = 100
                }      
            },
		},
        graphics_set = {
            light = {
                {
                    color = {0.3, 1, 0.3},
                    intensity = 0.6,
                    minimum_darkness = 0.3,
                    size = 25
                }
            },
            animation = {layers = {
                {
                    direction_count = 64,
                    filename = path .. "/graphics/entity/tarantulator/torso/hr-tarantulator-body.png",
                    height = 207,
                    width = 198,
                    scale = 0.5,
                    line_length = 8,
                    shift = {0, -0.59375},
                },
                {
                    apply_runtime_tint = true,
                    direction_count = 64,
                    filename = path .. "/graphics/entity/tarantulator/torso/hr-tarantulator-body-mask.png",
                    width = 195,
                    height = 150,
                    scale = 0.5,
                    line_length = 8,
                    shift = {0, -0.4375},
                }
            }},
            base_animation = {layers = {
                {
                    direction_count = 1,
                    filename = path .. "/graphics/entity/tarantulator/torso/hr-tarantulator-body-bottom.png",
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
            }},
        },
        resistances =
        {
            {
                type = "acid",
                decrease = 15,
                percent = 70
            },
            {
                type = "electric",
                decrease = 15,
                percent = 70
            },
            {
                type = "explosion",
                decrease = 20,
                percent = 80
            },
            {
                type = "fire",
                decrease = 15,
                percent = 90
            },
            {
                type = "impact",
                decrease = 100,
                percent = 80
            },
            {
                type = "laser",
                decrease = 15,
                percent = 70
            },
            {
                type = "physical",
                decrease = 15,
                percent = 70
            }
        },
    }
})
