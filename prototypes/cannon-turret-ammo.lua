local item_sounds = require("__base__.prototypes.item_sounds")

local path = "__snouz-cannon-turret__"

-- New category for turret cannon shells
data:extend(
{
  {
    type = "ammo-category",
    name = "cannon-shell-magazine",
    icon = "__base__/graphics/icons/ammo-category/cannon-shell.png",
    subgroup = "ammo-category"
  },
})

-- New cannon turret shell magazine ammo items
-- same as shells but with magazin_size and the new cannon-shell-magazine ammo type exclusive to turrets.
data:extend(
{
  {
    type = "ammo",
    name = "cannon-shell-magazine",
    description = "cannon-shell-magazine",
    icon = path .. "/graphics/icons/cannon-shell-magazine.png",
    icon_size = 64,
    ammo_category = "cannon-shell-magazine",
    ammo_type =
    {
      category = "cannon-shell-magazine",
      target_type = "direction", -- was position -- was entity
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "cannon-magazine-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "d[cannon-shell]-a[basic]-m[magazine]",
    stack_size = 20,
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    weight = 20 * 12 * kg
  },
  {
    type = "ammo",
    name = "explosive-cannon-shell-magazine",
    description = "explosive-cannon-shell-magazine",
    icon = path .. "/graphics/icons/explosive-cannon-shell-magazine.png",
    icon_size = 64,
    ammo_category = "cannon-shell-magazine",
    ammo_type =
    {
      category = "cannon-shell-magazine",
      target_type = "direction", -- was position
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-cannon-magazine-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "d[cannon-shell]-c[explosive]-m[magazine]",
    stack_size = 20,
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    weight = 20 * 12 * kg
  },
  {
    type = "ammo",
    name = "uranium-cannon-shell-magazine",
    description = "uranium-cannon-shell-magazine",
    icon = path .. "/graphics/icons/uranium-cannon-shell-magazine.png",
    icon_size = 64,
    ammo_category = "cannon-shell-magazine",
    ammo_type =
    {
      category = "cannon-shell-magazine",
      target_type = "direction", -- was position -- was entity
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "uranium-cannon-magazine-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "d[cannon-shell]-c[uranium]-m[magazine]",
    stack_size = 20,
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    weight = 40 * 12 * kg
  },
  {
    type = "ammo",
    name = "explosive-uranium-cannon-shell-magazine",
    description = "explosive-uranium-cannon-shell-magazine",
    icon = path .. "/graphics/icons/explosive-uranium-cannon-shell-magazine.png",
    icon_size = 64,
    ammo_category = "cannon-shell-magazine",
    ammo_type =
    {
      category = "cannon-shell-magazine",
      target_type = "direction", -- was position
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-uranium-cannon-magazine-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "d[explosive-cannon-shell]-c[uranium]-m[magazine]",
    stack_size = 20,
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    weight = 40 * 12 * kg
  },
})

-- Blueprints for new turrent cannon ammo shell magazine

-- All cannon turret ammo shell magazine share the same receipe appart from the base shell ingredient
-- inputs = array(name, ingredient)
function build_ammo_recipe(inputs)
return
{
  type = "recipe",
  name = inputs.name,
  enabled = false,
  energy_required = 2,
  ingredients = 
  {
    {
      type = "item",
      name = "iron-plate",
      amount = 2
    },
    {
      type = "item",
      name = "plastic-bar",
      amount = 1
    },
    {
      type = "item",
      name = inputs.ingredient,
      amount = 10
    },
  },
  results = {
    {
      type = "item",
      name = inputs.name,
      amount = 1
    }
  },
  requester_paste_multiplier = 10,
}
end

data:extend(
{
  build_ammo_recipe{name = "cannon-shell-magazine", ingredient = "cannon-shell"},
  build_ammo_recipe{name = "explosive-cannon-shell-magazine", ingredient = "explosive-cannon-shell"},
  build_ammo_recipe{name = "uranium-cannon-shell-magazine", ingredient = "uranium-cannon-shell"},
  build_ammo_recipe{name = "explosive-uranium-cannon-shell-magazine", ingredient = "explosive-uranium-cannon-shell"},
})

-- New projectiles behavior for cannon turret shell magazine, same as shells
data:extend(
{
  {
    type = "projectile",
    name = "cannon-magazine-projectile",
--    flags = {"not-on-map"},
    hidden = true,
    projectile_creation_distance = 1,
    projectile_center = {0, 0},
    force_condition = "not-same",
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = 1000,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 1000 , type = "physical"}
          },
          {
            type = "damage",
            damage = {amount = 100 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark-tintable",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    },
  },
  {
    type = "projectile",
    name = "explosive-cannon-magazine-projectile",
--    flags = {"not-on-map"},
    collision_box = {{-0.6, -1.6}, {0.6, 1.6}},
    force_condition = "not-same", 
    acceleration = 0,
    direction_only = true, -- make projectile vectorized instead of exploding on target
    piercing_damage = 100,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 180, type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {

          {
            type = "create-entity",
            entity_name = "big-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 300, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "medium-scorchmark-tintable",
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 2 -- large radius for demostrative purposes
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    },
  },
  {
    type = "projectile",
    name = "uranium-cannon-magazine-projectile",
--    flags = {"not-on-map"},
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = "not-same", 
    acceleration = 0,
    direction_only = true,
    piercing_damage = 2200,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 2000 , type = "physical"}
          },
          {
            type = "damage",
            damage = {amount = 200 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "uranium-cannon-explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark-tintable",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    },
  },
  {
    type = "projectile",
    name = "explosive-uranium-cannon-magazine-projectile",
--    flags = {"not-on-map"},
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = "not-same", 
    acceleration = 0,
    direction_only = true,
    piercing_damage = 150,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 350 , type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "uranium-cannon-explosion"
          },
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "uranium-cannon-shell-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4.25,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 315, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "uranium-cannon-explosion"
                  }
                }
              }
            }
          },

          {
            type = "create-entity",
            entity_name = "medium-scorchmark-tintable",
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 3.25 -- large radius for demostrative purposes
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    },
  },
})