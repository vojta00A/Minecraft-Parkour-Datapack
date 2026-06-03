execute at @e[type=marker,tag=builder] run setblock ~ ~ ~ stone

tag @e[type=marker,tag=builder] add regular

scoreboard players set @e[type=marker,tag=builder,limit=1] jump_id 1