say STAVIM ZEBRIK

# 1. Postavení bloku a žebříku
execute at @e[type=marker,tag=builder] run setblock ~ ~ ~ stone

execute at @e[type=marker,tag=builder] run setblock ~-1 ~ ~ ladder[facing=west]

# 2. Uložení ID a tagu pro kontrolu pádů a mazání
#scoreboard players set @e[type=marker,tag=builder,limit=1] currentJumpId 5
tag @e[type=marker,tag=builder] add tag_ladder_easy_1

# 3. Posun prevX o šířku této stavby (1 blok)
scoreboard players add @p prevX 1