#Tellraw load#
tellraw @a {"text":"Phantom Boss DataPack successfully loaded !! §6Version 1.0!!","color":"dark_aqua","hoverEvent":{"action":"show_text","value":"By Kikipunk and Daminator4113"}}

#Scoreboard load#
scoreboard objectives add pb_dummy dummy
scoreboard objectives add pb_time dummy
scoreboard players set 5 pb_dummy 5
scoreboard players set 100 pb_dummy 100

#Bossbar load#
bossbar add phantom_boss {"text":"Phantom Boss"}
bossbar set minecraft:phantom_boss color blue
bossbar set minecraft:phantom_boss max 250
bossbar set minecraft:phantom_boss style progress
