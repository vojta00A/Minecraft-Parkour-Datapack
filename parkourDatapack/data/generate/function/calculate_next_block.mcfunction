# na základě aktuálního bloku a obtížnosti to vygeneruje souřadnice pro další blok a položí ho, také aktualizuje proměnné

#generování náhodných souřadnic v daném rozsah
#execute store result score @p randX run random value 2..4
#execute store result score @p randY run random value -1..1
#execute store result score @p randZ run random value -3..3

# LEVEL 1 (Easy)
execute if score @p difficultyLevel matches 1 store result score @p randX run random value 2..3
execute if score @p difficultyLevel matches 1 store result score @p randY run random value 0..0
execute if score @p difficultyLevel matches 1 store result score @p randZ run random value -1..1

# LEVEL 2 (Medium)
execute if score @p difficultyLevel matches 2 store result score @p randX run random value 3..4
execute if score @p difficultyLevel matches 2 store result score @p randY run random value -1..1
execute if score @p difficultyLevel matches 2 store result score @p randZ run random value -2..2

# LEVEL 3 (Hard)
execute if score @p difficultyLevel matches 3 store result score @p randX run random value 4..5
execute if score @p difficultyLevel matches 3 store result score @p randY run random value -1..1
execute if score @p difficultyLevel matches 3 store result score @p randZ run random value -3..3

# LEVEL 4 (Extreme)
execute if score @p difficultyLevel matches 4 store result score @p randX run random value 4..5
execute if score @p difficultyLevel matches 4 store result score @p randY run random value -2..1
execute if score @p difficultyLevel matches 4 store result score @p randZ run random value -2..2

# LEVEL 5 (Žebříková sekce - pohyb do strany po ose Z)
execute if score @p difficultyLevel matches 5 store result score @p randX run random value 2..3
execute if score @p difficultyLevel matches 5 store result score @p randY run random value -1..1
execute if score @p difficultyLevel matches 5 store result score @p randZ run random value -1..0



#vytvoření absolutní X hodnoty pro kontrolní součet
scoreboard players operation @p absX = @p randX
execute if score @p absX matches ..-1 run scoreboard players operation @p absX *= @p minus1

#vytvoření absolutní Z hodnoty pro kontrolní součet
scoreboard players operation @p absZ = @p randZ
execute if score @p absZ matches ..-1 run scoreboard players operation @p absZ *= @p minus1

#kontrolní součet (stará se o to, aby nebyl blok moc daleko)
scoreboard players operation @p soucet = @p absX
scoreboard players operation @p soucet += @p absZ
scoreboard players operation @p soucet += @p randY

#pokud je kontrolní součet větší než 6 provede se vše nad tím znovu
execute if score @p soucet matches 7.. run return run function generate:calculate_next_block

scoreboard players operation @p testY = @p prevY
scoreboard players operation @p testY += @p randY
execute if score @p testY matches ..-40 run return run function generate:calculate_next_block

scoreboard players operation @p prevX += @p randX
scoreboard players operation @p prevY += @p randY
scoreboard players operation @p prevZ += @p randZ

summon marker ~ ~ ~ {Tags:["builder"]}

execute store result entity @e[type=marker,tag=builder,limit=1] Pos[0] double 1 run scoreboard players get @p prevX
execute store result entity @e[type=marker,tag=builder,limit=1] Pos[1] double 1 run scoreboard players get @p prevY
execute store result entity @e[type=marker,tag=builder,limit=1] Pos[2] double 1 run scoreboard players get @p prevZ

function generate:selector
#execute at @e[type=marker,tag=builder] run setblock ~ ~ ~ stone

#kill @e[type=marker,tag=builder]

#scoreboard players operation @p prevX = @p X
#scoreboard players operation @p prevY = @p Y
#scoreboard players operation @p prevZ = @p Z
