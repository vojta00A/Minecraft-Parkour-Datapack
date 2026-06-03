effect give @s minecraft:resistance 2 255 true

execute at @e[type=marker,tag=old_builder,limit=1] run tp @s ~0.5 ~1 ~0.5

#playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1

execute at @e[type=marker,tag=old_builder,tag=crumbling,limit=1] run setblock ~ ~ ~ stone_bricks

execute as @e[type=marker,tag=old_builder,tag=crumbling,limit=1] run scoreboard players set @s crumble_timer -20