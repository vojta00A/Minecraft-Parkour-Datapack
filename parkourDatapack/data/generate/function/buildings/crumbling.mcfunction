execute at @e[type=marker,tag=builder] run setblock ~ ~ ~ stone_bricks

tag @e[type=marker,tag=builder] add crumbling
scoreboard players set @e[type=marker,tag=builder,limit=1] crumble_timer 0

#scoreboard players add @p prevX 1

scoreboard players set @e[type=marker,tag=builder,limit=1] jump_id 7