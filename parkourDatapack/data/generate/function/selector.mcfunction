say SELECTOR SPUSTEN

#execute store result score @p building_type run random value 1..100

#execute if score @p building_type matches 1..80 run function generate:buildings/regular

#execute if score @p building_type matches 71..80 run function generate:buildings/neo

#execute if score @p building_type matches 81..90 run function generate:buildings/up_headhitter

#execute if score @p building_type matches 91..100 run function generate:buildings/headhitter

execute if score @p sectionJumpsLeft matches 1.. run function generate:sections/router
execute if score @p sectionJumpsLeft matches 1.. run return 1

# První hod kostkou: Výběr obtížnosti
#execute store result score @p dificulty run random value 1..100

execute store result score @p dificulty run random value 1..100

execute if score @p dificulty matches 1..20 run function generate:sections/start_ladders



execute if score @p dificulty matches 21..80 run function generate:difficulties/easy

execute if score @p dificulty matches 81..89 run function generate:difficulties/medium

execute if score @p dificulty matches 90..95 run function generate:difficulties/hard

execute if score @p dificulty matches 96..100 run function generate:difficulties/extreme