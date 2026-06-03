execute store result score @p X run data get entity @e[type=marker,tag=block_1,limit=1] Pos[0]
execute store result score @p Y run data get entity @e[type=marker,tag=block_1,limit=1] Pos[1]
execute store result score @p Z run data get entity @e[type=marker,tag=block_1,limit=1] Pos[2]

scoreboard players operation @p jump_id = @e[type=marker,tag=block_1,limit=1] jump_id

scoreboard players operation "SouřadniceX:" zobrazeni = @p X
scoreboard players operation "SouřadniceY:" zobrazeni = @p Y
scoreboard players operation "SouřadniceZ:" zobrazeni = @p Z
scoreboard players operation "Náhoda:" zobrazeni = @p tempRand



scoreboard players operation "ID_Prekazky:" zobrazeni = @p jump_id

# mizení mizejícího bloku

# ==========================================
# 1. DETEKCE STÁNÍ A LÉČENÍ BLOKU
# ==========================================

# A) Pokud hráč STOJÍ na bloku: Resetuj časovač léčení a přičti čas rozpadu
execute as @e[type=marker,tag=old_builder,tag=crumbling] at @s positioned ~ ~1 ~ if entity @a[dx=0,dy=0.5,dz=0] run scoreboard players set @s crumble_heal 0
execute as @e[type=marker,tag=old_builder,tag=crumbling] at @s positioned ~ ~1 ~ if entity @a[dx=0,dy=0.5,dz=0] run scoreboard players add @s crumble_timer 1

# B) Pokud hráč NESTOJÍ na bloku (vyskočil) a blok už je načatý: Přičti časovač léčení
execute as @e[type=marker,tag=old_builder,tag=crumbling] at @s positioned ~ ~1 ~ unless entity @a[dx=0,dy=0.5,dz=0] if score @s crumble_timer matches 1.. run scoreboard players add @s crumble_heal 1

# C) Pokud hráč nestál na bloku 2 vteřiny (40 ticků): UZDRAV BLOK
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_heal matches 40.. at @s run setblock ~ ~ ~ stone_bricks
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_heal matches 40.. run scoreboard players set @s crumble_timer 0
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_heal matches 40.. run scoreboard players set @s crumble_heal 0


# ==========================================
# 2. ILUZE KOPÁNÍ A ROZPAD (Každých 0.5s)
# ==========================================

# FÁZE 1 (10 ticků): Blok popraská, ozve se úder a vyletí částice
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 10 at @s run setblock ~ ~ ~ cracked_stone_bricks
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 10 at @s run playsound minecraft:block.stone.hit master @a ~ ~ ~ 1 0.8
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 10 at @s run particle minecraft:block{block_state:"minecraft:stone_bricks"} ~0.5 ~1.1 ~0.5 0.3 0.1 0.3 0.1 20

# FÁZE 2 (20 ticků): Další úder a víc částic (blok už je cracked)
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 20 at @s run playsound minecraft:block.stone.hit master @a ~ ~ ~ 1 0.6
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 20 at @s run particle minecraft:block{block_state:"minecraft:cracked_stone_bricks"} ~0.5 ~1.1 ~0.5 0.3 0.1 0.3 0.1 40

# FÁZE 3 (30 ticků): Finální ostrý úder před rozbitím
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 30 at @s run playsound minecraft:block.stone.hit master @a ~ ~ ~ 1 0.5
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 30 at @s run particle minecraft:block{block_state:"minecraft:cracked_stone_bricks"} ~0.5 ~1.1 ~0.5 0.3 0.1 0.3 0.1 60

# FÁZE 4 (40 ticků / 2 vteřiny stání): BLOK SE ROZBORTÍ
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 40 at @s run setblock ~ ~ ~ air
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 40 at @s run playsound minecraft:block.stone.break master @a ~ ~ ~ 1 0.8
execute as @e[type=marker,tag=old_builder,tag=crumbling] if score @s crumble_timer matches 40


# výpočet, jestli už hráč spadl dost bloků, aby se provedl teleport zpět
execute as @a[tag=!dev] store result score @s hrac_Y run data get entity @s Pos[1]

execute as @a[tag=!dev] if entity @e[type=marker,tag=old_builder] store result score @s temp_Y run data get entity @e[type=marker,tag=old_builder,limit=1] Pos[1]
execute as @a[tag=!dev] unless entity @e[type=marker,tag=old_builder] store result score @s temp_Y run data get entity @e[type=marker,tag=block_1,limit=1] Pos[1]

execute as @a[tag=!dev] run scoreboard players operation @s hrac_Y -= @s temp_Y

execute as @a[tag=!dev] if score @s hrac_Y matches ..-10 run function generate:player_fail

function generate:jump_check