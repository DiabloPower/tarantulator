local path = "__tarantulator_V2__"

data:extend({
    {
        type = "projectile",
        name = "tarantulator-railgun-shell",
        acceleration = 0,
        flags = {},
        direction_only = true,
    },
    {
		type = 'explosion',
		name = 'tarantulator-beam',
		light = {
			color = {0.3, 1, 0.3},
			intensity = 1,
			size = 10,
		},
		animations = {{
			filename = path .. '/graphics/entity/blue-beam.png',
			frame_count = 6,
			height = 1,
			priority = 'extra-high',
			width = 187,
			animation_speed = 0.5,
			tint = {0.3, 1, 0.3},
		}},
		smoke = 'smoke-fast',
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		subgroup = 'explosions',
		rotate = true,
		beam = true
	},
})
