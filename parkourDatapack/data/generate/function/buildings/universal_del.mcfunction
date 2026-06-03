scoreboard players operation @p opakovani = @s opakovani

summon marker ~ ~ ~ {Tags:["cursor_del"]}

execute if entity @s[tag=headhitter] run tag @e[type=marker,tag=cursor_del] add headhitter

execute as @e[type=marker,tag=cursor_del] at @s run function generate:buildings/delete_loop

# Úklid
kill @e[type=marker,tag=cursor_del]