scoreboard players set @p difficultyLevel 3

execute store result score @p jump_select run random value 1..100

execute if score @p jump_select matches 1..50 run function generate:buildings/left_neo

execute if score @p jump_select matches 51..100 run function generate:buildings/right_neo

#execute if score @p jump_select matches 81..100 run function generate:buildings/zatacka