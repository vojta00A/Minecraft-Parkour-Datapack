# Postavíme obyčejnou bezpečnou plošinu (třeba 2x2, ať je to fér)
execute at @e[type=marker,tag=builder] run setblock ~ ~ ~ stone_bricks
execute at @e[type=marker,tag=builder] run setblock ~1 ~ ~ stone_bricks
execute at @e[type=marker,tag=builder] run setblock ~ ~ ~1 stone_bricks
execute at @e[type=marker,tag=builder] run setblock ~1 ~ ~1 stone_bricks

# Označíme ID pro mazání (stejně jako u normálních bloků)
tag @e[type=marker,tag=builder] add tag_ladder_first

# TÍMTO PŘEPNEME SMĚR DRÁHY! Další skoky už poletí do strany.
scoreboard players set @p difficultyLevel 5

scoreboard players add @p prevX 2