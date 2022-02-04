minetest.register_craftitem( "orichalcum:orichalcum_gem", {
    description = "Orichalcum Gem",
    inventory_image = "orichalcum_gem.png",
    on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_node( "orichalcum:orichalcum_ore", {
    description = "Orichalcum Ore",
    tile_images = { "orichalcum_ore.png" },
    drop = "orichalcum:orichalcum_shard",
    is_ground_content = true,
    groups = {cracky=3},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem( "orichalcum:orichalcum_shard", {
    description = "Orichalcum Shard",
    inventory_image = "orichalcum_shard.png",
    on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_node( "orichalcum:orichalcum_block", {
    description = "Orichalcum Block",
    tile_images = { "orichalcum_block.png" },
    is_ground_content = true,
    groups = {cracky=3},
    sounds = default.node_sound_stone_defaults(),
})




--
--tools
--

minetest.register_tool("orichalcum:sword", {
    description = "Orichalcum Sword",
    inventory_image = "orichalcum_sword.png",
    tool_capabilities = {
        full_punch_interval = 0.1,
        max_drop_level=1,
        groupcaps={
            fleshy={times={[1]=0.05, [2]=0.05, [3]=0.05}, uses=120, maxlevel=2},
            snappy={times={[2]=0.70, [3]=0.30}, uses=250, maxlevel=1},
            choppy={times={[3]=0.70}, uses=30, maxlevel=0}
        }
    }
})

minetest.register_tool("orichalcum:axe", {
    description = "Orichalcum Axe",
    inventory_image = "orichalcum_axe.png",
    tool_capabilities = {
        max_drop_level=2,
        groupcaps={
            choppy={times={[1]=0.60, [2]=0.30, [3]=0.15}, uses=125, maxlevel=2},
            fleshy={times={[1]=1.50, [2]=1.10, [3]=0.60}, uses=125, maxlevel=1}
        }
    },
})

minetest.register_tool("orichalcum:shovel", {
    description = "Orichalcum Shovel",
    inventory_image = "orichalcum_shovel.png",
    tool_capabilities = {
        max_drop_level=2,
        groupcaps={
            crumbly={times={[1]=1.50, [2]=1.00, [3]=0.50}, uses=150, maxlevel=2}
        }
    },
})

minetest.register_tool("orichalcum:pick", {
    description = "Orichalcum Pickaxe",
    inventory_image = "orichalcum_pick.png",
    tool_capabilities = {
        full_punch_interval = 0.1,
        max_drop_level=3,
        groupcaps={
            cracky={times={[1]=0.05, [2]=0.05, [3]=0.05}, uses=120, maxlevel=3},
            crumbly={times={[1]=0.05, [2]=0.05, [3]=0.05}, uses=120, maxlevel=3},
            snappy={times={[1]=0.05, [2]=0.05, [3]=0.05}, uses=120, maxlevel=3}
        }
    },
})


--
--crafting
--

minetest.register_craft({
    output = 'orichalcum:orichalcum_block',
    recipe = {
        {'orichalcum:orichalcum_gem', 'orichalcum:orichalcum_gem', 'orichalcum:orichalcum_gem'},
        {'orichalcum:orichalcum_gem', 'orichalcum:orichalcum_gem', 'orichalcum:orichalcum_gem'},
        {'orichalcum:orichalcum_gem', 'orichalcum:orichalcum_gem', 'orichalcum:orichalcum_gem'},
    }
})

minetest.register_craft({
    output = 'orichalcum:pick',
    recipe = {
        {'orichalcum:orichalcum_gem', 'orichalcum:orichalcum_gem', 'orichalcum:orichalcum_gem'},
        {'', 'default:stick', ''},
        {'', 'default:stick', ''},
    }
})

minetest.register_craft({
    output = 'orichalcum:axe',
    recipe = {
        {'orichalcum:orichalcum_gem', 'orichalcum:orichalcum_gem', ''},
        {'orichalcum:orichalcum_gem', 'default:stick', ''},
        {'', 'default:stick', ''},
    }
})

minetest.register_craft({
    output = 'orichalcum:shovel',
    recipe = {
        {'', 'orichalcum:orichalcum_gem', ''},
        {'', 'default:stick', ''},
        {'', 'default:stick', ''},
    }
})

minetest.register_craft({
    output = 'orichalcum:sword',
    recipe = {
        {'', 'orichalcum:orichalcum_gem', ''},
        {'', 'orichalcum:orichalcum_gem', ''},
        {'', 'default:stick', ''},
    }
})

minetest.register_craft({
    output = 'orichalcum:orichalcum_gem',
    recipe = {
        {'orichalcum:orichalcum_shard', 'orichalcum:orichalcum_shard', 'orichalcum:orichalcum_shard'},
        {'orichalcum:orichalcum_shard', 'orichalcum:orichalcum_shard', 'orichalcum:orichalcum_shard'},
        {'orichalcum:orichalcum_shard', 'orichalcum:orichalcum_shard', 'orichalcum:orichalcum_shard'},
    }
})

minetest.register_craft({
    output = 'orichalcum:orichalcum_shard 9',
    recipe = {
        {'', 'orichalcum:orichalcum_gem', ''},
    }
})







--
--Generation
--

local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, height_min, height_max)
    if maxp.y < height_min or minp.y > height_max then
        return
    end
    local y_min = math.max(minp.y, height_min)
    local y_max = math.min(maxp.y, height_max)
    local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
    local pr = PseudoRandom(seed)
    local num_chunks = math.floor(chunks_per_volume * volume)
    local chunk_size = 3
    if ore_per_chunk <= 4 then
        chunk_size = 2
    end
    local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
    --print("generate_ore num_chunks: "..dump(num_chunks))
    for i=1,num_chunks do
        local y0 = pr:next(y_min, y_max-chunk_size+1)
        if y0 >= height_min and y0 <= height_max then
            local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
            local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
            local p0 = {x=x0, y=y0, z=z0}
            for x1=0,chunk_size-1 do
            for y1=0,chunk_size-1 do
            for z1=0,chunk_size-1 do
                if pr:next(1,inverse_chance) == 1 then
                    local x2 = x0+x1
                    local y2 = y0+y1
                    local z2 = z0+z1
                    local p2 = {x=x2, y=y2, z=z2}
                    if minetest.env:get_node(p2).name == wherein then
                        minetest.env:set_node(p2, {name=name})
                    end
                end
            end
            end
            end
        end
    end
end

minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("orichalcum:orichalcum_ore", "default:stone", minp, maxp, seed+21,   1/10/10/10,    2, -1500,  -100)
end)
