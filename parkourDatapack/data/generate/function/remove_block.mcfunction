execute at @e[type=marker,tag=older_builder,tag=regular] run function generate:buildings/regular_del
execute at @e[type=marker,tag=older_builder,tag=neo] run function generate:buildings/neo_del
execute at @e[type=marker,tag=older_builder,tag=up_headhitter] run function generate:buildings/up_headhitter_del
execute at @e[type=marker,tag=older_builder,tag=left_neo] run function generate:buildings/left_neo_del
execute at @e[type=marker,tag=older_builder,tag=right_neo] run function generate:buildings/right_neo_del
execute at @e[type=marker,tag=older_builder,tag=crumbling] run function generate:buildings/crumbling_del
execute as @e[type=marker,tag=older_builder,tag=tag_ladder_easy_1] at @s run function generate:buildings/section_ladders/ladder_easy_1_del
execute as @e[type=marker,tag=older_builder,tag=tag_ladder_easy_2] at @s run function generate:buildings/section_ladders/ladder_easy_2_del
execute as @e[type=marker,tag=older_builder,tag=tag_ladder_first] at @s run function generate:buildings/section_ladders/ladder_first_del



execute as @e[type=marker,tag=older_builder,tag=repeatable] at @s run function generate:buildings/universal_del

kill @e[type=marker,tag=older_builder]


tag @e[type=marker,tag=old_builder] add older_builder
tag @e[type=marker,tag=old_builder] remove old_builder



tag @e[type=marker,tag=block_1] add old_builder
tag @e[type=marker,tag=block_1] remove block_1

tag @e[type=marker,tag=block_2] add block_1
tag @e[type=marker,tag=block_2] remove block_2

tag @e[type=marker,tag=block_3] add block_2
tag @e[type=marker,tag=block_3] remove block_3

tag @e[type=marker,tag=block_4] add block_3
tag @e[type=marker,tag=block_4] remove block_4

function generate:calculate_next_block

tag @e[type=marker,tag=builder] add block_4
tag @e[type=marker,tag=builder] remove builder