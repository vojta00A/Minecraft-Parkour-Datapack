scoreboard players set @p difficultyLevel 2

execute store result score @p jump_select run random value 1..100

execute if score @p jump_select matches 1..50 run function generate:buildings/neo

execute if score @p jump_select matches 51..75 run function generate:buildings/headhitter

execute if score @p jump_select matches 76..100 run function generate:buildings/up_headhitter

#execute if score @p jump_select matches 81..100 run function generate:buildings/zatacka