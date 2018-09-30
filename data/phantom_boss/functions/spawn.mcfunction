#Random number generator#
execute positioned ~ -1 ~ run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["random"],Age:1}
execute store result score Rand pb_dummy run data get entity @e[type=area_effect_cloud,tag=random,limit=1] UUIDMost 0.0000000000000028306434
scoreboard players operation Rand pb_dummy %= 100 pb_dummy

#Attributes variable and effect to the boss#
execute as @s if score Rand pb_dummy matches 0..14 run say spawn
execute as @s if score Rand pb_dummy matches 0..14 run tag @s add pb_boss
execute as @s if score Rand pb_dummy matches 0..14 run data merge entity @e[type=minecraft:phantom,limit=1,tag=pb_boss] {Tags:["pb_boss","pb_new"],Invulnerable:1b,Size:15,DeathLootTable:"entities/phantom_boss",Health:1f,Attributes:[{Base: 0.699999988079071d,Modifiers:[{UUIDMost:-6746280516851426191L,UUIDLeast:-4986665568836093348L,Amount:5.0d,Operation:0}],Name:"generic.movementSpeed"},{Base: 20.0d,Modifiers:[{UUIDMost:-6746280519451426191L,UUIDLeast:-4986665577836093348L,Amount:230.0d,Operation:0}],Name:"generic.maxHealth"}]}
execute as @s[tag=pb_boss] run playsound minecraft:entity.phantom.death master @a[distance=..80] ~ ~ ~ 2.0 0.3
tag @s remove pb_test
