#Clock for boss spawn#
execute unless entity @e[type=phantom,tag=pb_boss] run scoreboard players add time pb_dummy 1
execute if score time pb_dummy matches 3600 run function phantom_boss:test
execute if score time pb_dummy matches 3600 run scoreboard players set time pb_dummy 0


#Kill boss in daytime#
execute store result score daytime pb_time run time query daytime
execute if score daytime pb_time matches 0..13000 run data merge entity @e[type=phantom,tag=pb_boss] {DeathLootTable:"entities/phantom"}
execute if score daytime pb_time matches 0..13000 run kill @e[type=phantom,tag=pb_boss]


#Boss bar#
execute if entity @e[type=phantom,tag=pb_boss] run bossbar set minecraft:phantom_boss visible true
execute unless entity @e[type=phantom,tag=pb_boss] run bossbar set minecraft:phantom_boss visible false
execute as @e[type=phantom,tag=pb_boss] at @s run bossbar set minecraft:phantom_boss players @a[distance=..80]
execute as @e[type=phantom,tag=pb_boss] at @s store result bossbar minecraft:phantom_boss value run data get entity @s Health


#Boss spawn regen phase#
execute as @e[type=phantom,tag=pb_boss,tag=pb_new,nbt={Invulnerable:1b}] at @s store result score @s pb_dummy run data get entity @s Health
execute as @e[type=phantom,tag=pb_boss,tag=pb_new,nbt={Invulnerable:1b}] at @s if score @s pb_dummy matches ..250 run scoreboard players operation @s pb_dummy += 5 pb_dummy
execute as @e[type=phantom,tag=pb_boss,tag=pb_new,nbt={Invulnerable:1b}] at @s store result entity @s Health float 1 run scoreboard players get @s pb_dummy
execute as @e[type=phantom,tag=pb_boss,tag=pb_new,nbt={Invulnerable:1b}] at @s if score @s pb_dummy matches 250.. run data merge entity @s {Tags:["pb_boss"],Invulnerable:0b,ActiveEffects:[{Id:10,Amplifier:2,Duration:2147483647,ShowParticles:0b}]}


#Boss Invulnerable phase#
execute as @e[type=phantom,tag=pb_boss] run scoreboard players add @s pb_time 1
execute as @e[type=phantom,tag=pb_boss,scores={pb_time=400}] run data merge entity @s {Tags:["pb_boss","pb_angry"],Invulnerable:1b,ActiveEffects:[{Id:10,Amplifier:2,Duration:1,ShowParticles:0b}]}
execute as @e[type=phantom,tag=pb_boss,scores={pb_time=400}] run bossbar set minecraft:phantom_boss color red
execute as @e[type=phantom,tag=pb_boss,scores={pb_time=400}] at @s run playsound minecraft:entity.blaze.death master @a[distance=..80] ~ ~ ~ 2 0.5
execute as @e[type=phantom,tag=pb_boss,scores={pb_time=400..700}] at @s run particle minecraft:dust 0.5 0.1 0.5 2 ~ ~ ~ 1 1 1 0.1 3 force
execute as @e[type=phantom,tag=pb_boss,scores={pb_time=700}] run data merge entity @s {Tags:["pb_boss"],Invulnerable:0b,ActiveEffects:[{Id:10,Amplifier:2,Duration:2147483647,ShowParticles:0b}]}
execute as @e[type=phantom,tag=pb_boss,scores={pb_time=700}] run bossbar set minecraft:phantom_boss color blue
execute as @e[type=phantom,tag=pb_boss,scores={pb_time=700}] at @s run playsound minecraft:entity.blaze.death master @a[distance=..80] ~ ~ ~ 2 0.5
execute as @e[type=phantom,tag=pb_boss,scores={pb_time=1200..}] run scoreboard players set @s pb_time 0
