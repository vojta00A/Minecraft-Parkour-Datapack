execute store result score @p opakovani run random value 1..6

scoreboard players operation @e[type=marker,tag=builder,limit=1] opakovani = @p opakovani

tag @e[type=marker,tag=builder] add repeatable
tag @e[type=marker,tag=builder] add headhitter

execute at @e[type=marker,tag=builder,limit=1] run summon marker ~ ~ ~ {Tags:["cursor", "headhitter"]}

execute as @e[type=marker,tag=cursor] at @s run function generate:buildings/build_loop

kill @e[type=marker,tag=cursor]

scoreboard players set @e[type=marker,tag=builder,limit=1] jump_id 5

#scoreboard players add @p prevX 1