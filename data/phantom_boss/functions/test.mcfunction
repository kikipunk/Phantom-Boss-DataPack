#Attibute tag pb_boss ranmdomly#
tag @e[type=minecraft:phantom,limit=1,tag=!pb_boss,sort=random] add pb_test
execute as @e[type=minecraft:phantom,tag=pb_test] at @s run function phantom_boss:spawn
