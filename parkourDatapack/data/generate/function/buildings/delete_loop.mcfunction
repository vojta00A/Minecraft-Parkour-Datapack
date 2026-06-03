execute if entity @s[tag=headhitter] run setblock ~ ~ ~ air
execute if entity @s[tag=headhitter] run setblock ~1 ~3 ~ air
execute if entity @s[tag=headhitter] run setblock ~2 ~ ~ air


execute if entity @s[tag=headhitter] run tp @s ~2 ~ ~

scoreboard players remove @p opakovani 1
execute if score @p opakovani matches 1.. at @s run function generate:buildings/delete_loop