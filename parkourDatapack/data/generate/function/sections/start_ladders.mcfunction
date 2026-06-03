say START LADDERS SPUSTEN

scoreboard players set @p sectionType 1

# Délka sekce (počet skoků)
execute store result score @p sectionJumpsLeft run random value 10..15

function generate:buildings/section_ladders/ladder_first
