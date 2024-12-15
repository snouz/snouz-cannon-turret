
-- Make new cannon turret shell magazine ammo affected by shell technology upgrades
-- Krastorio 2 changed technologies support
if mods["Krastorio2"] then
    table.insert(data.raw['technology']['physical-projectile-damage-1']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.25})
    table.insert(data.raw['technology']['physical-projectile-damage-2']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.25})
    table.insert(data.raw['technology']['physical-projectile-damage-3']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.25})
    table.insert(data.raw['technology']['physical-projectile-damage-4']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.35})
    table.insert(data.raw['technology']['physical-projectile-damage-5']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.35})
    table.insert(data.raw['technology']['physical-projectile-damage-6']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.35})
    table.insert(data.raw['technology']['physical-projectile-damage-7']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.10})
    if data.raw['technology']['physical-projectile-damage-8'] then
        table.insert(data.raw['technology']['physical-projectile-damage-8']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.10})
    end
    if data.raw['technology']['physical-projectile-damage-9'] then
        table.insert(data.raw['technology']['physical-projectile-damage-9']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.10})
    end
    if data.raw['technology']['physical-projectile-damage-10'] then
        table.insert(data.raw['technology']['physical-projectile-damage-10']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.10})
    end
    if data.raw['technology']['physical-projectile-damage-11'] then
        table.insert(data.raw['technology']['physical-projectile-damage-11']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.10})
    end
    if data.raw['technology']['physical-projectile-damage-12'] then
        table.insert(data.raw['technology']['physical-projectile-damage-12']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.10})
    end
    if data.raw['technology']['physical-projectile-damage-16'] then
        table.insert(data.raw['technology']['physical-projectile-damage-16']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.10})
    end
    
    table.insert(data.raw['technology']['weapon-shooting-speed-1']['effects'], {type = "gun-speed", ammo_category = "cannon-shell-magazine", modifier = 0.2})
    table.insert(data.raw['technology']['weapon-shooting-speed-2']['effects'], {type = "gun-speed", ammo_category = "cannon-shell-magazine", modifier = 0.2})
    table.insert(data.raw['technology']['weapon-shooting-speed-3']['effects'], {type = "gun-speed", ammo_category = "cannon-shell-magazine", modifier = 0.15})
    table.insert(data.raw['technology']['weapon-shooting-speed-4']['effects'], {type = "gun-speed", ammo_category = "cannon-shell-magazine", modifier = 0.15})
    table.insert(data.raw['technology']['weapon-shooting-speed-5']['effects'], {type = "gun-speed", ammo_category = "cannon-shell-magazine", modifier = 0.15})
    table.insert(data.raw['technology']['weapon-shooting-speed-6']['effects'], {type = "gun-speed", ammo_category = "cannon-shell-magazine", modifier = 0.15})
end