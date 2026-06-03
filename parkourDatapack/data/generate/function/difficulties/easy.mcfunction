scoreboard players set @p difficultyLevel 1

execute store result score @p jump_select run random value 1..100

execute if score @p jump_select matches 1..90 run function generate:buildings/regular

execute if score @p jump_select matches 91..100 run function generate:buildings/crumbling

#execute if score @p jump_select matches 81..100 run function generate:buildings/zatacka