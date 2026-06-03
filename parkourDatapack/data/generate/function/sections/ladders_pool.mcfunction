say POOL SPUSTEN

execute store result score @p jumpRoll run random value 1..100

# Nastavíme obtížnost (např. 3 = Hard), aby podle toho fungovalo generování mezer v calculate_next_block
scoreboard players set @p difficultyLevel 3

# Losování konkrétního žebříkového skoku
execute if score @p jumpRoll matches 1..50 run function generate:buildings/section_ladders/ladder_easy_1
execute if score @p jumpRoll matches 51..100 run function generate:buildings/section_ladders/ladder_easy_2