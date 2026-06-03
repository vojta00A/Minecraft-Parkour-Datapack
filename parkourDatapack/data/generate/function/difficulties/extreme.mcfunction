scoreboard players set @p difficultyLevel 4

execute store result score @p jump_select run random value 1..100

execute if score @p jump_select matches 1..100 run function generate:buildings/regular

#execute if score @p jump_select matches 81..100 run function generate:buildings/zatacka