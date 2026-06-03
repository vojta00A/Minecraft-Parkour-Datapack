execute at @e[type=marker,tag=builder] run setblock ~ ~ ~ stone
execute at @e[type=marker,tag=builder] run setblock ~1 ~ ~ stone
execute at @e[type=marker,tag=builder] run setblock ~2 ~ ~ stone
execute at @e[type=marker,tag=builder] run setblock ~2 ~1 ~ stone
execute at @e[type=marker,tag=builder] run setblock ~2 ~2 ~-1 stone
execute at @e[type=marker,tag=builder] run setblock ~2 ~2 ~ stone
execute at @e[type=marker,tag=builder] run setblock ~3 ~ ~ stone
execute at @e[type=marker,tag=builder] run setblock ~4 ~ ~ stone


tag @e[type=marker,tag=builder] add right_neo

scoreboard players add @p prevX 4

scoreboard players set @e[type=marker,tag=builder,limit=1] jump_id 4