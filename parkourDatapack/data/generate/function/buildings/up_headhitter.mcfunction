execute at @e[type=marker,tag=builder] run setblock ~ ~ ~ stone
execute at @e[type=marker,tag=builder] run setblock ~ ~3 ~ stone


tag @e[type=marker,tag=builder] add up_headhitter

scoreboard players set @e[type=marker,tag=builder,limit=1] jump_id 6

#scoreboard players add @p prevX 1