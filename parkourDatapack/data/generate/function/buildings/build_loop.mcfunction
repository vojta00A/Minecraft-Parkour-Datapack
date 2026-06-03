execute if entity @s[tag=headhitter] run setblock ~ ~ ~ stone
execute if entity @s[tag=headhitter] run setblock ~1 ~3 ~ stone
execute if entity @s[tag=headhitter] run setblock ~2 ~ ~ stone

execute if entity @s[tag=headhitter] run tp @s ~2 ~ ~
execute if entity @s[tag=headhitter] run scoreboard players add @p prevX 2

scoreboard players remove @p opakovani 1
execute if score @p opakovani matches 1.. at @s run function generate:buildings/build_loop