local item_sounds = require("__base__.prototypes.item_sounds")

local function cannon_turret_sheet(inputs)
return
{
      filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-sheet.png",
      priority = "medium",
      scale = 0.75,
      width = 128,
      height = 128,
      direction_count = inputs.direction_count and inputs.direction_count or 64,
      frame_count = 1,
      line_length = inputs.line_length and inputs.line_length or 8,
      axially_symmetrical = false,
      run_mode = inputs.run_mode and inputs.run_mode or "forward",
      shift = {0.25,-0.58},
}
end

local function cannon_turret_mask(inputs)
return
{
      filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-mask.png",
      scale = 0.75,
      flags = { "mask" },
      width = 128,
      height = 128,
      direction_count = inputs.direction_count and inputs.direction_count or 64,
      frame_count = inputs.frame_count,
      line_length = inputs.line_length and inputs.line_length or 8,
      axially_symmetrical = false,
      run_mode = inputs.run_mode and inputs.run_mode or "forward",
      shift = {0.25,-0.58},
      apply_runtime_tint = true
}
end

local function cannon_turret_heavy_extension(inputs)
	return
	{
		filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-heavy.png",
		priority = "medium",
		scale = 0.5,
		line_length = 1,
    width = 179,
    height = 132,
		direction_count = 8,
		frame_count = 1,
		run_mode = inputs.run_mode and inputs.run_mode or "forward",
		shift = {0.055, -0.7},
		axially_symmetrical = false
	}
end

local function cannon_turret_heavy_extension_mask(inputs)
	return
	{
    filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-heavy-mask.png",
    scale = 0.5,
    flags = { "mask" },
    line_length = 8,
    width = 72,
    height = 66,
    axially_symmetrical = false,
    direction_count = 64,
    frame_count = 1,
    shift = {0.055, -0.73},
    apply_runtime_tint = true
	}
end

local function cannon_turret_heavy_extension_shadow(inputs)
	return
	{
		filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-heavy-shadow.png",
		scale = 0.5,
    line_length = 1,
    width = 193,
    height = 134,
		frame_count = 1,
		direction_count = 8,
		run_mode = inputs.run_mode and inputs.run_mode or "forward",
		shift = {0.9, 0.1},
		axially_symmetrical = false,
		draw_as_shadow = true
	}
end

local function cannon_turret_heavy_attack(inputs)
	return
	{
		layers =
		{
			{
				filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-heavy.png",
				scale = 0.5,
 				line_length = 8,
        width = 179,
        height = 132,
				frame_count = 1,
				direction_count = 64,
				shift = {0.055, -0.75},
				animation_speed = 8
			},
			{
        filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-heavy-mask.png",
        scale = 0.5,
        flags = { "mask" },
        line_length = 8,
        width = 72,
        height = 66,
        axially_symmetrical = false,
        direction_count = 64,
        frame_count = 1,
        shift = {0.055, -0.80},
        apply_runtime_tint = true
      },
			{
				filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-heavy-shadow.png",
				scale = 0.5,
 				line_length = 8,
        width = 193,
        height = 134,
				frame_count = 1,
				draw_as_shadow = true,
				shift = {1, 0.1},
				direction_count = 64,
			}
		}
	}
end

-- entity
data:extend(
{
  {
    type = "ammo-turret",
    name = "vtk-cannon-turret",
    icon = "__vtk-cannon-turret__/graphics/icons/cannon-turret-icon.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "vtk-cannon-turret"},
    max_health = 1500,
    corpse = "medium-remnants",
    collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    selection_box = {{-1, -1 }, {1, 1}},
    rotation_speed = 0.003,
    preparing_speed = 0.04,
    folding_speed = 0.04,
    dying_explosion = "medium-explosion",
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.5,

    alert_when_attacking = true,
    open_sound = {filename = "__base__/sound/open-close/turret-open.ogg", volume = 0.6},
    close_sound = {filename = "__base__/sound/open-close/turret-close.ogg", volume = 0.6},
    
    turret_base_has_direction = true,

    folded_animation = { 
      layers = 
      { 
        cannon_turret_sheet{},
        cannon_turret_mask{}
      }
    },
    preparing_animation = { 
      layers = 
      { 
        cannon_turret_sheet{},
        cannon_turret_mask{}
      }
    },
    prepared_animation = { 
      layers = 
      { 
        cannon_turret_sheet{},
        cannon_turret_mask{}
      }
    },
    attacking_animation = { 
      layers = 
      { 
        cannon_turret_sheet{},
        cannon_turret_mask{}
      }
    },
    folding_animation = { 
      layers = 
      { 
        cannon_turret_sheet{},
        cannon_turret_mask{}
      }
    },
    
    graphics_set =
    {
      base_visualisation =
      {
        animation =
        {
          layers =
          {
            {
              filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-base.png",
              priority = "medium",
              width = 128,
              height = 128,
              shift = {0.0,0.0},
              scale = 0.5
            },
            {
              filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-base.png",
              flags = {"mask", "low-object"},
              line_length = 1,
              width = 128,
              height = 128,
              shift = {0.0,0.0},
              apply_runtime_tint = true,
              scale = 0.5
            }
          }
        }
      }
    },

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "cannon-shell-magazine",
      cooldown = 180,
      projectile_creation_distance = 2,
      projectile_center = {0, 0},
      damage_modifier = 1,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 35,
      min_range = 12,
      prepare_range = 45,
      shoot_in_prepare_state = false,
      sound =
      {
        {
            -- filename = "__base__/sound/fight/tank-cannon.ogg",
            filename = "__vtk-cannon-turret__/sounds/CANNHVY5.ogg",
            volume = 1.0
        }
      },
    },
    call_for_help_radius = 46
  },
})

data:extend(
{
  {
    type = "ammo-turret",
    name = "vtk-cannon-turret-heavy",
    icon = "__vtk-cannon-turret__/graphics/icons/cannon-turret-heavy-icon.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "vtk-cannon-turret-heavy"},
    max_health = 2000,
    corpse = "medium-remnants",
    collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    selection_box = {{-1, -1 }, {1, 1}},
    rotation_speed = 0.0015,
    preparing_speed = 0.04,
    folding_speed = 0.04,
    dying_explosion = "medium-explosion",
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.5,
    
    alert_when_attacking = true,
    open_sound = {filename = "__base__/sound/open-close/turret-open.ogg", volume = 0.6},
    close_sound = {filename = "__base__/sound/open-close/turret-close.ogg", volume = 0.6},
    
    turret_base_has_direction = true,

    folded_animation = 
    {
      layers =
      {
        cannon_turret_heavy_extension_shadow{},
        cannon_turret_heavy_extension{},
        cannon_turret_heavy_extension_mask{}
      }
    },
    preparing_animation = 
    {
      layers =
      {
        cannon_turret_heavy_extension{},
        cannon_turret_heavy_extension_shadow{},
        cannon_turret_heavy_extension_mask{}
      }
    },
    prepared_animation = cannon_turret_heavy_attack{},
    attacking_animation = cannon_turret_heavy_attack{},
    folding_animation = 
    { 
      layers = 
      { 
        cannon_turret_heavy_extension{},
        cannon_turret_heavy_extension_shadow{},
        cannon_turret_heavy_extension_mask{}
      }
    },
    
    graphics_set = {
      base_visualisation =
      {
        animation =
        {
          layers =
          {
            {
              filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-heavy-base.png",
              scale = 0.5,
              priority = "high",
              width = 150,
              height = 118,
              axially_symmetrical = false,
              direction_count = 1,
              frame_count = 1,
              shift = {0.0625, -0.046875},
            },
            {
              filename = "__vtk-cannon-turret__/graphics/entity/cannon-turret-heavy-base-mask.png",
              scale = 0.5,
              flags = { "mask" },
              line_length = 1,
              width = 122,
              height = 102,
              axially_symmetrical = false,
              direction_count = 1,
              frame_count = 1,
              shift = {0.05, -0.15},
              apply_runtime_tint = true
            }
          }
        }
      },
    },
  
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "cannon-shell-magazine",
      cooldown = 90,
      projectile_creation_distance = 2,
      projectile_center = {0, 0},
      damage_modifier = 1,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 30,
      min_range = 12,
      prepare_range = 35,
      shoot_in_prepare_state = false,
      turn_range = 2.0 / 5.0,
      sound =
      {
        {
            -- filename = "__base__/sound/fight/tank-cannon.ogg",
            filename = "__vtk-cannon-turret__/sounds/CANNHVY5.ogg",
            volume = 1.0
        }
      },
    },
    call_for_help_radius = 46
  },
})

--item
data:extend({
  {
    type = "item",
    name = "vtk-cannon-turret",
    icon = "__vtk-cannon-turret__/graphics/icons/cannon-turret-icon.png",
    icon_size = 64,
    subgroup = "defensive-structure",
    order = "b[turret]-c[base]-a[cannon-turret]",
    place_result = "vtk-cannon-turret",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
  },
  {
    type = "item",
    name = "vtk-cannon-turret-heavy",
    icon = "__vtk-cannon-turret__/graphics/icons/cannon-turret-heavy-icon.png",
    icon_size = 64,
    subgroup = "defensive-structure",
    order = "b[turret]-c[base]-b[cannon-turret]",
    place_result = "vtk-cannon-turret-heavy",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
  },
})


--recipe
data:extend({
  {
    type = "recipe",
    name = "vtk-cannon-turret",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {
        type = "item",
        name = "gun-turret",
        amount = 2
      },
      {
        type = "item",
        name = "steel-plate",
        amount = 30
      },
      {
        type = "item",
        name = "electronic-circuit",
        amount = 2
      },
    },
    results = 
    {
      {
        type = "item",
        name = "vtk-cannon-turret",
        amount = 1
      }
    }
  },
  {
    type = "recipe",
    name = "vtk-cannon-turret-heavy",
    enabled = false,
    energy_required = 40,
    ingredients =
    {
      {
        type = "item",
        name = "vtk-cannon-turret",
        amount = 2
      },
      {
        type = "item",
        name = "steel-plate",
        amount = 50
      },
      {
        type = "item",
        name = "advanced-circuit",
        amount = 10
      },
    },
    results = 
    {
      {
        type = "item",
        name = "vtk-cannon-turret-heavy",
        amount = 1
      }
    }
  },
})