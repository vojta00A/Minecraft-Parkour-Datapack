# vytvoření scoreboardu s proměnnými
say "Initialization started!"
scoreboard objectives add X dummy
scoreboard objectives add Y dummy
scoreboard objectives add Z dummy

scoreboard objectives add prevX dummy
scoreboard objectives add prevY dummy
scoreboard objectives add prevZ dummy

scoreboard objectives add randX dummy
scoreboard objectives add randY dummy
scoreboard objectives add randZ dummy
scoreboard objectives add absX dummy
scoreboard objectives add absZ dummy
scoreboard objectives add soucet dummy

scoreboard objectives add hrac_Y dummy

scoreboard objectives add building_type dummy

scoreboard objectives add opakovani dummy


scoreboard objectives add testY dummy



scoreboard players set @p prevX -24
scoreboard players set @p prevY -37
scoreboard players set @p prevZ 32

scoreboard objectives add minus1 dummy
scoreboard players set @p minus1 -1

scoreboard objectives add dificulty dummy
scoreboard objectives add jump_select dummy

scoreboard objectives add crumble_timer dummy

scoreboard objectives add temp_Y dummy

scoreboard objectives add crumble_heal dummy

scoreboard objectives add jump_id dummy

scoreboard objectives add sectionType dummy
scoreboard objectives add sectionJumpsLeft dummy
scoreboard objectives add difficultyLevel dummy
scoreboard objectives add gapRoll dummy

scoreboard objectives add jumpRoll dummy


scoreboard players set @p sectionJumpsLeft 0
scoreboard players set @p sectionType 0

kill @e[type=marker]

# přiřadí se souřadnice, ve kterých se to může generovat. Něco jak hranice (pro testování tam nebudou)

function generate:calculate_next_block
tag @e[type=marker,tag=builder] add old_builder
tag @e[type=marker,tag=builder] remove builder

function generate:calculate_next_block
tag @e[type=marker,tag=builder] add block_1
tag @e[type=marker,tag=builder] remove builder

function generate:calculate_next_block
tag @e[type=marker,tag=builder] add block_2
tag @e[type=marker,tag=builder] remove builder

function generate:calculate_next_block
tag @e[type=marker,tag=builder] add block_3
tag @e[type=marker,tag=builder] remove builder

function generate:calculate_next_block
tag @e[type=marker,tag=builder] add block_4
tag @e[type=marker,tag=builder] remove builder









