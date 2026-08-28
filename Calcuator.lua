-- uguzhub
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local ContentProvider = game:GetService("ContentProvider")
local player = Players.LocalPlayer

-- =====================================================
-- 1. VALUE DATABASE 
-- =====================================================
local Values = {
	["Chroma Traveler's"] = 220000,
	["Chroma Evergreen Set"] = 128000,
	["Chroma Evergun"] = 75000,
	["Chroma Evergreen"] = 48000,
	["Chroma Alien Set"] = 37000,
	["Chroma Ornament Set"] = 35800,
	["Chroma Bauble"] = 34000,
	["Chroma Constellation"] = 29000,
	["Chroma Vampire's"] = 29000,
	["Chroma Alienbeam"] = 24000,
	["Chroma Sun Set"] = 21000,
	["Gingerscope"] = 17750,
	["Chroma Raygun"] = 14000,
	["Traveler's Set"] = 13400,
	["Chroma Sunrise"] = 13250,
	["Chroma Snow Set"] = 12750,
	["Chroma Blizzard Set"] = 12250,
	["Full Small Set"] = 10395,
	["Chroma Sunset"] = 9000,
	["Traveler's Axe"] = 8100,
	["Chroma Snowcannon"] = 7750,
	["Evergreen Set"] = 5950,
	["Traveler's"] = 5600,
	["Chroma Blizzard"] = 5500,
	["Celestial Set"] = 4700,
	["Chroma Sweet Treat Set"] = 4700,
	["Chroma Heart Wand"] = 4250,
	["Chroma Snowstorm"] = 4250,
	["Evergun"] = 3450,
	["Chroma Beach Set"] = 3400,
	["Chroma Watergun"] = 3400,
	["Alien Set"] = 3275,
	["Dark Set"] = 3225,
	["Vampire's Set"] = 3050,
	["Constellation"] = 2700,
	["Evergreen"] = 2650,
	["Alienbeam"] = 2600,
	["Sakura Set"] = 2550,
	["Chroma Snow Dagger"] = 2500,
	["Celestial"] = 2450,
	["Turkey"] = 2450,
	["Chroma Treat"] = 2150,
	["Raygun"] = 2100,
	["Chroma Sweet"] = 2000,
	["Vampire's"] = 1950,
	["Chroma Ornament"] = 1800,
	["Darkshot"] = 1800,
	["Darksword"] = 1775,
	["Sun Set"] = 1750,
	["Vampire's Axe"] = 1500,
	["Blossom"] = 1370,
	["Sakura"] = 1360,
	["Small Set"] = 1315,
	["Chroma Sands"] = 1300,
	["Chroma Beachy"] = 1250,
	["Chroma Icecream"] = 1250,
	["Sunrise"] = 1150,
	["Snow Set"] = 1110,
	["Soul Set"] = 1100,
	["Ornament Set"] = 877,
	["Snowcannon"] = 850,
	["Rainbow Set"] = 830,
	["Bauble"] = 825,
	["Bloom Set"] = 810,
	["Zombie Dog"] = 750,
	["Sunset"] = 650,
	["Elf"] = 625,
	["Soul"] = 615,
	["Spirit"] = 605,
	["Chroma Set"] = 585,
	["Full Chroma Set"] = 570,
	["Ocean Set"] = 555,
	["Chroma Weapon Set"] = 545,
	["Xeno Set"] = 540,
	["Cane"] = 525,
	["Flowerwood Set"] = 525,
	["Blizzard Set"] = 520,
	["Corrupt Set"] = 512,
	["Cane Set"] = 505,
	["Rainbow"] = 420,
	["Bow Set"] = 410,
	["Flora"] = 410,
	["Rainbow"] = 410,
	["Pumpkin Set"] = 405,
	["Bloom"] = 400,
	["Chroma Set"] = 395,
	["Corrupt"] = 375,
	["Heart Wand"] = 340,
	["Latte Set"] = 320,
	["Sweet Treat Set"] = 315,
	["Xenoknife"] = 310,
	["Xenoshot"] = 310,
	["Ancient Set"] = 305,
	["Borealis Set"] = 295,
	["Ocean"] = 285,
	["Waves"] = 280,
	["Beach Set"] = 270,
	["Flowerwood"] = 265,
	["Blizzard"] = 260,
	["Flowerwood"] = 260,
	["Full Ice Set"] = 260,
	["Snowstorm"] = 260,
	["Harvester"] = 250,
	["Bats"] = 240,
	["Snow Dagger"] = 240,
	["Watergun"] = 240,
	["Blue Pumpkin"] = 220,
	["Bones"] = 215,
	["Full Bringer Set"] = 191,
	["Bats Set"] = 186,
	["Full Luger Set"] = 185,
	["Pearl Set"] = 185,
	["Dungeon"] = 175,
	["Icepiercer"] = 160,
	["Bat Set"] = 155,
	["Treat"] = 155,
	["Dogey"] = 150,
	["Sweet"] = 150,
	["Borealis"] = 145,
	["Australis"] = 140,
	["Latte"] = 140,
	["Latte"] = 140,
	["Brains"] = 135,
	["Luger Set"] = 135,
	["Sparkle Set"] = 127,
	["Chroma Bringer Set"] = 125,
	["Zombified Set"] = 125,
	["Bat"] = 120,
	["Full Fire Pet Set"] = 120,
	["Red Pumpkin"] = 120,
	["Zombified"] = 120,
	["Candy Set"] = 113,
	["Beachy"] = 110,
	["Sands"] = 110,
	["Icecream"] = 105,
	["Full Elderwood Set"] = 104,
	["Icebreaker Set"] = 103,
	["Ghoulish"] = 95,
	["Gifts"] = 95,
	["Vampire"] = 90,
	["Gingerbread"] = 85,
	["Pearlshine"] = 85,
	["Pine"] = 85,
	["Candy"] = 80,
	["Pearl"] = 80,
	["Gingerbread Set"] = 76,
	["Chroma Slasher Set"] = 73,
	["Collectible Set"] = 71,
	["Elderwood Set"] = 71,
	["Full Swirly Set"] = 71,
	["Black Cat"] = 70,
	["Darkknife"] = 70,
	["Glitch1"] = 70,
	["Spectre Set"] = 70,
	["Spectral Set"] = 68,
	["Full Virtual Set"] = 67,
	["Bringer Set"] = 66,
	["Chroma Darkbringer"] = 65,
	["Heartblade"] = 65,
	["Icebreaker"] = 65,
	["Vampire Set"] = 63,
	["Silent Night Set"] = 62,
	["Chroma Lightbringer"] = 60,
	["Green Pumpkin"] = 60,
	["Sweater"] = 60,
	["Vintage Set"] = 59,
	["Swirly Set"] = 58,
	["Mr. Reindeer"] = 55,
	["Piggy"] = 55,
	["Pumpkin"] = 55,
	["Snowflake"] = 55,
	["Hallow Set"] = 52,
	["Branches"] = 50,
	["Chroma Luger"] = 50,
	["Ornament"] = 50,
	["Silent Night"] = 50,
	["Spectral"] = 50,
	["Traveler"] = 50,
	["Full Colored Seer Set"] = 46,
	["Aurora"] = 45,
	["Eternal Set"] = 43,
	["Batwing"] = 42,
	["Full Old Glory Set"] = 41,
	["Chroma Candleflame"] = 40,
	["Chroma Laser"] = 40,
	["Chroma Swirly"] = 38,
	["Elderwood Scythe"] = 38,
	["Old Glory Set"] = 38,
	["Slasher Set"] = 38,
	["Swirly Axe"] = 38,
	["Chroma Elderwood Blade"] = 37,
	["Iceflake Set"] = 37,
	["Red Luger"] = 37,
	["Beach"] = 35,
	["Chroma Deathshard"] = 35,
	["Cotton Candy"] = 35,
	["Glitch2"] = 35,
	["Icicles Set"] = 35,
	["Makeshift"] = 35,
	["Mummified"] = 35,
	["Phantom"] = 35,
	["Plasma Set"] = 35,
	["Santa"] = 35,
	["Spectre"] = 35,
	["Candleflame"] = 33,
	["Darkbringer"] = 33,
	["Elderwood Blade"] = 33,
	["Elderwood Revolver"] = 33,
	["Iceblaster"] = 33,
	["Lightbringer"] = 33,
	["Makeshift"] = 33,
	["Chroma Cookiecane"] = 32,
	["Chroma Fang"] = 32,
	["Chroma Gemstone"] = 32,
	["Chroma Shark"] = 32,
	["Chroma Slasher"] = 32,
	["Sugar"] = 32,
	["Xmas Collectible Set"] = 32,
	["Logchopper Set"] = 31,
	["Shadow Set"] = 31,
	["Frosted"] = 30,
	["Ginger Set (Godly)"] = 30,
	["Hallowscythe"] = 30,
	["Luger"] = 30,
	["Skate Set"] = 30,
	["Snowflakes"] = 30,
	["Sparkle9"] = 30,
	["Virtual Set"] = 30,
	["Wrapped"] = 30,
	["Zombified"] = 30,
	["Clockwork Set"] = 29,
	["Chroma Heat"] = 28,
	["Chroma Pet Set"] = 28,
	["Chroma Seer"] = 28,
	["JD"] = 28,
	["Battleaxe Set"] = 27,
	["Chroma Gingerblade"] = 27,
	["Chroma Tides"] = 27,
	["8-Bit Set"] = 26,
	["Cookie Set"] = 26,
	["Eternalcane Set"] = 26,
	["CandyCorn"] = 25,
	["Ecto"] = 25,
	["Elf"] = 25,
	["Snowman"] = 25,
	["Webbed"] = 25,
	["Chroma Saw"] = 23,
	["Green Luger"] = 23,
	["Amerilaser"] = 22,
	["Chroma Boneblade"] = 22,
	["Laser"] = 22,
	["S1 Test"] = 22,
	["Starry"] = 22,
	["Elf"] = 20,
	["Hallowgun"] = 20,
	["Mr. Snowman"] = 20,
	["Mummy"] = 20,
	["Nightblade"] = 20,
	["Red Pumpkin"] = 20,
	["Shark"] = 20,
	["Slimy"] = 20,
	["Sparkle10"] = 20,
	["Sparkle8"] = 20,
	["Swirl"] = 20,
	["Watcher"] = 20,
	["Ice Shard Set"] = 19,
	["Elf Set"] = 18,
	["Full Valentine Set"] = 18,
	["Icebeam"] = 18,
	["Logchopper"] = 18,
	["Plasmabeam"] = 18,
	["Sparkle7"] = 18,
	["Swirly"] = 18,
	["BattleAxe II"] = 17,
	["Blaster"] = 17,
	["Ginger Luger"] = 17,
	["Pixel"] = 17,
	["Red Pumpkin"] = 17,
	["RIP"] = 17,
	["Colored Seer Set"] = 16,
	["Hallow's Set"] = 16,
	["Pals Set"] = 16,
	["Coal"] = 15,
	["Elf"] = 15,
	["Gemstone"] = 15,
	["Iceflake"] = 15,
	["Old Glory"] = 15,
	["Plasmablade"] = 15,
	["Skulls"] = 15,
	["Skully"] = 15,
	["Slasher"] = 15,
	["Vampire's Edge"] = 15,
	["Zombified"] = 15,
	["Wrapping Paper Set"] = 14,
	["Cookiecane"] = 13,
	["Deathshard"] = 13,
	["Eternalcane"] = 13,
	["Frostbite Set"] = 13,
	["Ghost Set (Godly)"] = 13,
	["Gingerblade"] = 13,
	["Halloween Set"] = 13,
	["Icewing"] = 13,
	["Jinglegun"] = 13,
	["Lugercane"] = 13,
	["Magma"] = 13,
	["Minty"] = 13,
	["Nebula"] = 13,
	["Virtual"] = 13,
	["BattleAxe"] = 12,
	["Candy Corn"] = 12,
	["Gingermint"] = 12,
	["Prism"] = 12,
	["Silent Night"] = 12,
	["Snowflakes"] = 12,
	["Sparkle6"] = 12,
	["Swirly Blade"] = 12,
	["Void"] = 12,
	["Wrap"] = 12,
	["Wrap"] = 12,
	["Aurora Set"] = 11,
	["Pumpkin Set"] = 11,
	["Arctic"] = 10,
	["Chill"] = 10,
	["Clockwork"] = 10,
	["Combat II"] = 10,
	["Eye Set"] = 10,
	["Fang"] = 10,
	["Floral"] = 10,
	["Frostsaber"] = 10,
	["Ghostfire"] = 10,
	["Gingerbread"] = 10,
	["Godly Pet Set"] = 10,
	["Green Pumpkin"] = 10,
	["Heat"] = 10,
	["Phantom"] = 10,
	["Sparkle4"] = 10,
	["Spider"] = 10,
	["Tides"] = 10,
	["Wrapped Set"] = 10,
	["Zombie"] = 10,
	["Fire Pet Set"] = 9,
	["Toxic Set"] = 9,
	["Bioblade"] = 8,
	["Blood"] = 8,
	["Cavern Set"] = 8,
	["Eternal III"] = 8,
	["Eternal IV"] = 8,
	["Ghost"] = 8,
	["Hallow's Blade"] = 8,
	["Hallow's Edge"] = 8,
	["Handsaw"] = 8,
	["Laser"] = 8,
	["Skool"] = 8,
	["Sparkle5"] = 8,
	["Steel"] = 8,
	["Zombie Set"] = 8,
	["<3"] = 7,
	["America"] = 7,
	["Aurora"] = 7,
	["Blue Pumpkin"] = 7,
	["Boneblade"] = 7,
	["Broken"] = 7,
	["Cavern"] = 7,
	["Eternal II"] = 7,
	["Eternal"] = 7,
	["Frostbite"] = 7,
	["Ghastly"] = 7,
	["Ghost Set (Legendary)"] = 7,
	["Ghostblade"] = 7,
	["Ginger Set (Legendary)"] = 7,
	["Gothic"] = 7,
	["Ice Dragon"] = 7,
	["Ice Shard"] = 7,
	["Prismatic"] = 7,
	["Pumpking"] = 7,
	["Saw"] = 7,
	["Tailslide"] = 7,
	["Vampire"] = 7,
	["Xmas"] = 7,
	["Zombie"] = 7,
	["Full Elite Set"] = 6,
	["Icecracker Set"] = 6,
	["Prince"] = 6,
	["Santa's Set (Legendary)"] = 6,
	["Scratch Set"] = 6,
	["Shadow"] = 6,
	["Valentine Set"] = 6,
	["Eggblade"] = 5,
	["Flames"] = 5,
	["Ghost"] = 5,
	["Ginger"] = 5,
	["Hazard"] = 5,
	["Icedriller"] = 5,
	["Jack Set"] = 5,
	["Nightsky"] = 5,
	["Nobledragon"] = 5,
	["Phaser"] = 5,
	["Pumpkin Green"] = 5,
	["Pumpkin Patch"] = 5,
	["Shadow Pumpkin"] = 5,
	["Skeleton Key"] = 5,
	["Snowflake"] = 5,
	["Snowman"] = 5,
	["Starry"] = 5,
	["Toxic"] = 5,
	["Winter's Edge"] = 5,
	["Wraith"] = 5,
	["Zombie"] = 5,
	["Alex"] = 4,
	["Bunnies"] = 4,
	["Candy Swirl Set"] = 4,
	["Corl"] = 4,
	["Cowboy"] = 4,
	["Denis"] = 4,
	["Easter Set"] = 4,
	["Euro"] = 4,
	["Frozen Set"] = 4,
	["Golden"] = 4,
	["Marble Set"] = 4,
	["Ollie"] = 4,
	["Peppermint"] = 4,
	["Potion Set"] = 4,
	["Scratch"] = 4,
	["Sidewinder"] = 4,
	["Sketchy"] = 4,
	["Skulls"] = 4,
	["Snakebite Set"] = 4,
	["Sub"] = 4,
	["Vampire Set"] = 4,
	["Apocalypse"] = 3,
	["Aurora"] = 3,
	["Bats"] = 3,
	["Blue Elite"] = 3,
	["Blue Seer"] = 3,
	["Chilly"] = 3,
	["Chroma Fire Bat"] = 3,
	["Chroma Fire Bear"] = 3,
	["Chroma Fire Bunny"] = 3,
	["Chroma Fire Cat"] = 3,
	["Chroma Fire Dog"] = 3,
	["Chroma Fire Fox"] = 3,
	["Chroma Fire Pig"] = 3,
	["Cookieblade"] = 3,
	["Eyeball"] = 3,
	["Fairy"] = 3,
	["Fire Set"] = 3,
	["Frozen"] = 3,
	["Ghosty"] = 3,
	["Gingerbread"] = 3,
	["Grave Set"] = 3,
	["Green Elite"] = 3,
	["Green Pumpkin"] = 3,
	["Icicles"] = 3,
	["Infected"] = 3,
	["Jack"] = 3,
	["Jetstream"] = 3,
	["Lantern"] = 3,
	["Lights Set"] = 3,
	["Magma"] = 3,
	["Mechbug"] = 3,
	["Mummy Set"] = 3,
	["Overseer Eye"] = 3,
	["Pengy"] = 3,
	["Potion"] = 3,
	["Purple Pumpkin"] = 3,
	["Purple Seer"] = 3,
	["Red Pumpkin"] = 3,
	["Red Seer"] = 3,
	["Reindeer"] = 3,
	["Rudolph"] = 3,
	["Santa's Magic"] = 3,
	["Santa's Spirit"] = 3,
	["Seahorsey"] = 3,
	["Seer"] = 3,
	["Slime Set"] = 3,
	["Snakebite"] = 3,
	["Snowbear"] = 3,
	["Sparkle1"] = 3,
	["Sparkle2"] = 3,
	["Sparkle3"] = 3,
	["Spectral"] = 3,
	["Splitter"] = 3,
	["Tankie"] = 3,
	["Traveler"] = 3,
	["UFO"] = 3,
	["Vampire Bat"] = 3,
	["Vampire"] = 3,
	["Webs"] = 3,
	["Witched"] = 3,
	["Zombie"] = 3,
	["Asteroid"] = 2,
	["Bats"] = 2,
	["Blue Scratch"] = 2,
	["Box of Blue Wrapping Paper"] = 2,
	["Box of Fertilizer"] = 2,
	["Box of Gold Wrapping Paper"] = 2,
	["Box of Green Wrapping Paper"] = 2,
	["Box of Purple Wrapping Paper"] = 2,
	["Box of Red Wrapping Paper"] = 2,
	["Box of Ultra Wrapping Paper"] = 2,
	["Candy Swirl"] = 2,
	["Cane Set"] = 2,
	["Energized"] = 2,
	["Frostfade"] = 2,
	["Ghost"] = 2,
	["Green Marble"] = 2,
	["Grind"] = 2,
	["Haunted Set"] = 2,
	["Indy"] = 2,
	["Lights"] = 2,
	["Meltdown"] = 2,
	["Mummy"] = 2,
	["Nutcracker Set"] = 2,
	["Orange Marble"] = 2,
	["Orange Seer"] = 2,
	["Ornament1 Set"] = 2,
	["Ornament2 Set"] = 2,
	["Potion"] = 2,
	["Potion"] = 2,
	["Pumpkin Pie"] = 2,
	["Santa Set"] = 2,
	["Snowman Set"] = 2,
	["Stars"] = 2,
	["Toxic"] = 2,
	["Tree"] = 2,
	["Tree Set"] = 2,
	["Web Set"] = 2,
	["Yellow Seer"] = 2,
	["Aurora"] = 1,
	["Badger"] = 1,
	["Bats"] = 1,
	["Blue Pumpkin"] = 1,
	["Candy Swirl"] = 1,
	["Cavern"] = 1,
	["Chromatic"] = 1,
	["Cookie"] = 1,
	["Darkgun"] = 1,
	["Frozen"] = 1,
	["Ghosty"] = 1,
	["Ginger Set (Rare)"] = 1,
	["Gingerbread"] = 1,
	["Gingerbread"] = 1,
	["Grave"] = 1,
	["Grave"] = 1,
	["Haunted"] = 1,
	["Haunted"] = 1,
	["Holly"] = 1,
	["Icecracker"] = 1,
	["Lights"] = 1,
	["Lil' Alien"] = 1,
	["Monster"] = 1,
	["Moonlight"] = 1,
	["Moons"] = 1,
	["Mummy"] = 1,
	["Mystery Key"] = 1,
	["Red Fire"] = 1,
	["Slashed"] = 1,
	["Slime"] = 1,
	["Slime"] = 1,
	["Snakebite"] = 1,
	["Vampire"] = 1,
	["Vampire"] = 1,
	["Wolf"] = 1,
	["Zombie"] = 1,
	[""] = 0.4,
	["Apocalypse"] = 0.4,
	["Arctic"] = 0.4,
	["Blossom"] = 0.4,
	["Bones"] = 0.4,
	["Brains"] = 0.4,
	["Bunny"] = 0.4,
	["Cane"] = 0.4,
	["Cane"] = 0.4,
	["Carrot"] = 0.4,
	["Choco"] = 0.4,
	["Chromatic"] = 0.4,
	["Cursed"] = 0.4,
	["Egg"] = 0.4,
	["Elf"] = 0.4,
	["Emerald"] = 0.4,
	["Energized"] = 0.4,
	["Frosted"] = 0.4,
	["Frozen"] = 0.4,
	["Gifted"] = 0.4,
	["Ginger"] = 0.4,
	["Ginger"] = 0.4,
	["Gingerbread"] = 0.4,
	["Goo"] = 0.4,
	["Gothic"] = 0.4,
	["Green Fire"] = 0.4,
	["Hearts"] = 0.4,
	["Infected"] = 0.4,
	["Mummy"] = 0.4,
	["Nightstar"] = 0.4,
	["Nutcracker"] = 0.4,
	["Ornament1"] = 0.4,
	["Ornament1"] = 0.4,
	["Ornament2"] = 0.4,
	["Ornament2"] = 0.4,
	["Overseer"] = 0.4,
	["Passion"] = 0.4,
	["Patrick"] = 0.4,
	["Predator"] = 0.4,
	["Reptile"] = 0.4,
	["Ripper"] = 0.4,
	["Roses"] = 0.4,
	["Rupture"] = 0.4,
	["Santa"] = 0.4,
	["Santa"] = 0.4,
	["Snowman"] = 0.4,
	["Snowman"] = 0.4,
	["Snowy"] = 0.4,
	["Starry"] = 0.4,
	["Sunset"] = 0.4,
	["Sweetheart"] = 0.4,
	["Tree"] = 0.4,
	["Tree"] = 0.4,
	["Tulip"] = 0.4,
	["Valentine"] = 0.4,
	["Web"] = 0.4,
	["Webbed"] = 0.4,
	["Witch"] = 0.4,
	["Wrapped"] = 0.4,
	["Wrapped"] = 0.4,
	["Aquarium"] = 0.3,
	["Bubbles"] = 0.3,
	["Cane"] = 0.3,
	["Carrot Bunny"] = 0.3,
	["Cursed"] = 0.3,
	["Deathspeaker"] = 0.3,
	["Electro"] = 0.3,
	["Frostbird"] = 0.3,
	["Frostfade"] = 0.3,
	["Frozen"] = 0.3,
	["Gift Bag"] = 0.3,
	["Hunter"] = 0.3,
	["Ice Phoenix"] = 0.3,
	["Icey"] = 0.3,
	["Icicles"] = 0.3,
	["Infected"] = 0.3,
	["Magma"] = 0.3,
	["Midnight"] = 0.3,
	["Neon"] = 0.3,
	["Nuke"] = 0.3,
	["Palms"] = 0.3,
	["Phoenix"] = 0.3,
	["Sammy"] = 0.3,
	["Skelly"] = 0.3,
	["Snowy"] = 0.3,
	["Sparkle"] = 0.3,
	["Steambird"] = 0.3,
	["TNL"] = 0.3,
	["Traveller"] = 0.3,
	["Watcher"] = 0.3,
	["Aquarium"] = 0.2,
	["Cupid"] = 0.2,
	["Fire Bat"] = 0.2,
	["Fire Bear"] = 0.2,
	["Fire Bunny"] = 0.2,
	["Fire Cat"] = 0.2,
	["Fire Dog"] = 0.2,
	["Fire Fox"] = 0.2,
	["Fire Pig"] = 0.2,
	["Ghastly"] = 0.2,
	["Gifts"] = 0.2,
	["Gifts"] = 0.2,
	["Ginger"] = 0.2,
	["Ice Camo"] = 0.2,
	["Logcutter"] = 0.2,
	["Molten"] = 0.2,
	["Molten"] = 0.2,
	["Palms"] = 0.2,
	["Pumpkin"] = 0.2,
	["Ribbons"] = 0.2,
	["Ripper"] = 0.2,
	["Snowflake Key"] = 0.2,
	["Snowflakes"] = 0.2,
	["Steel"] = 0.2,
	["Butterflies"] = 0.1,
	["Candleflame"] = 0.1,
	["Damp"] = 0.1,
	["Fade"] = 0.1,
	["Frostflame"] = 0.1,
	["Fusion"] = 0.1,
	["Gingerbread"] = 0.1,
	["Heart"] = 0.1,
	["Neon"] = 0.1,
	["Nether"] = 0.1,
	["Overseer"] = 0.1,
	["Painted"] = 0.1,
	["Plasmite"] = 0.1,
	["Pool Noodle"] = 0.1,
	["Predator"] = 0.1,
	["Rune"] = 0.1,
	["Scarecrow"] = 0.1,
	["Shiny"] = 0.1,
	["Snowflake"] = 0.1,
	["Spitfire"] = 0.1,
	["Splash"] = 0.1,
	["Storm"] = 0.1,
	["Teddy"] = 0.1,
	["Universe"] = 0.1,
	["Viper"] = 0.1,
	["Wraith"] = 0.1,
	["Wraiths"] = 0.1,
	["Bio"] = 0.075,
	["Bones"] = 0.075,
	["Curse"] = 0.075,
	["Elite"] = 0.075,
	["Frostflame"] = 0.1,
	["Ghosts"] = 0.075,
	["Gingercookie"] = 0.075,
	["Hazard"] = 0.075,
	["Hologram"] = 0.075,
	["Mistletoe"] = 0.075,
	["Pier"] = 0.075,
	["Pine"] = 0.075,
	["Pop Art"] = 0.075,
	["RB"] = 0.075,
	["Spearmint"] = 0.075,
	["Splash"] = 0.075,
	["Sunny"] = 0.075,
	["Sunset"] = 0.075,
	["Tree"] = 0.075,
	["Tree"] = 0.075,
	["Tropical"] = 0.075,
	["Xeno"] = 0.075,
	["Cane"] = 0.05,
	["Floral"] = 0.05,
	["Gingercookie"] = 0.05,
	["Gingerheart"] = 0.05,
	["Heartbreak"] = 0.05,
	["Hologram"] = 0.05,
	["Kraken"] = 0.05,
	["Love"] = 0.05,
	["Neon"] = 0.05,
	["Pop Art"] = 0.05,
	["Portal"] = 0.05,
	["Ritual"] = 0.05,
	["Robot"] = 0.05,
	["Rose"] = 0.05,
	["Sharky"] = 0.05,
	["Sleigh"] = 0.05,
	["Snowflake"] = 0.05,
	["Snowglobe"] = 0.05,
	["Spearmint"] = 0.05,
	["Spring"] = 0.05,
	["Tree"] = 0.05,
	["Waves"] = 0.05,
	["Xeno"] = 0.05,
	["Yummy"] = 0.05,
	["Abstract"] = 0.025,
	["Ace"] = 0.025,
	["Bacon"] = 0.025,
	["Black"] = 0.025,
	["Canes"] = 0.025,
	["Cookie"] = 0.025,
	["Etched"] = 0.025,
	["Fireplace"] = 0.025,
	["Forest"] = 0.025,
	["Frosty"] = 0.025,
	["Galactic"] = 0.025,
	["Galaxy"] = 0.025,
	["Hacker"] = 0.025,
	["Holly"] = 0.025,
	["Imbued"] = 0.025,
	["iRevolver"] = 0.025,
	["Korblox"] = 0.025,
	["Krypto"] = 0.025,
	["Marble"] = 0.025,
	["Melon"] = 0.025,
	["Mummy"] = 0.025,
	["Musical"] = 0.025,
	["Nightfire"] = 0.025,
	["Nova"] = 0.025,
	["Ornaments"] = 0.025,
	["Purple"] = 0.025,
	["Rainbow"] = 0.025,
	["Rainbow"] = 0.025,
	["Snowflake"] = 0.025,
	["Snowman"] = 0.025,
	["Space"] = 0.025,
	["Spectrum"] = 0.025,
	["Squire"] = 0.025,
	["Vortex"] = 0.025,
	["Wrapped"] = 0.025,
	
}

												local scriptEnabled = false

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UguzHub"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.IgnoreGuiInset = true

local parented = false
if typeof(gethui) == "function" then
	local ok = pcall(function()
		screenGui.Parent = gethui()
	end)
	parented = ok
end
if not parented then
	local ok = pcall(function()
		screenGui.Parent = CoreGui
	end)
	parented = ok
end
if not parented then
	screenGui.Parent = player:WaitForChild("PlayerGui")
end

local dim = Instance.new("Frame")
dim.Name = "Dim"
dim.Size = UDim2.new(1, 0, 1, 0)
dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dim.BackgroundTransparency = 0
dim.BorderSizePixel = 0
dim.ZIndex = 10
dim.Parent = screenGui

math.randomseed(tick())
for i = 1, 180 do
	local star = Instance.new("Frame")
	local size = math.random(1, 3)
	star.Size = UDim2.new(0, size, 0, size)
	local startX = math.random(-1000, 1000) / 1000
	local startY = math.random(-1000, 1000) / 1000
	star.Position = UDim2.new(startX, 0, startY, 0)
	star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	star.BackgroundTransparency = math.random(10, 60) / 100
	star.BorderSizePixel = 0
	star.ZIndex = 10
	star.Parent = dim

	local starCorner = Instance.new("UICorner")
	starCorner.CornerRadius = UDim.new(1, 0)
	starCorner.Parent = star

	local speed = math.random(4, 10) / 10000
	task.spawn(function()
		local x, y = startX, startY
		while dim.Parent do
			x = x + speed
			y = y + speed
			if x > 1.05 or y > 1.05 then
				x = -0.05
				y = math.random(-1000, 1000) / 1000
			end
			star.Position = UDim2.new(x, 0, y, 0)
			task.wait(0.03)
		end
	end)
end

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.AnchorPoint = Vector2.new(0.5, 0.5)
panel.Size = UDim2.new(0.42, 0, 0.5, 0)
panel.Position = UDim2.new(0.5, 0, 0.5, 0)
panel.BackgroundColor3 = Color3.fromRGB(18, 26, 40)
panel.BackgroundTransparency = 0.15
panel.BorderSizePixel = 0
panel.ZIndex = 11
panel.Parent = screenGui

local panelConstraint = Instance.new("UISizeConstraint")
panelConstraint.MinSize = Vector2.new(320, 280)
panelConstraint.MaxSize = Vector2.new(480, 360)
panelConstraint.Parent = panel

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 22)
panelCorner.Parent = panel

local panelStroke = Instance.new("UIStroke")
panelStroke.Color = Color3.fromRGB(90, 150, 255)
panelStroke.Transparency = 0.55
panelStroke.Thickness = 1.5
panelStroke.Parent = panel

local panelGradient = Instance.new("UIGradient")
panelGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 45, 70)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 16, 26)),
})
panelGradient.Rotation = 60
panelGradient.Parent = panel

local kicker = Instance.new("TextLabel")
kicker.Size = UDim2.new(1, 0, 0, 20)
kicker.Position = UDim2.new(0, 0, 0.055, 0)
kicker.BackgroundTransparency = 1
kicker.Text = "DEVICE TYPE"
kicker.TextColor3 = Color3.fromRGB(140, 155, 180)
kicker.Font = Enum.Font.GothamBold
kicker.TextSize = 11
kicker.ZIndex = 12
kicker.Parent = panel

local heading = Instance.new("TextLabel")
heading.Size = UDim2.new(1, -40, 0, 46)
heading.Position = UDim2.new(0, 20, 0.13, 0)
heading.BackgroundTransparency = 1
heading.Text = "SELECT YOUR DEVICE"
heading.TextColor3 = Color3.fromRGB(255, 255, 255)
heading.Font = Enum.Font.GothamBlack
heading.TextSize = 24
heading.ZIndex = 12
heading.Parent = panel

local badge = Instance.new("Frame")
badge.AnchorPoint = Vector2.new(0.5, 0)
badge.Size = UDim2.new(0, 108, 0, 22)
badge.Position = UDim2.new(0.5, 0, 0.32, 0)
badge.BackgroundColor3 = Color3.fromRGB(60, 140, 255)
badge.BorderSizePixel = 0
badge.ZIndex = 12
badge.Parent = panel

local badgeCorner = Instance.new("UICorner")
badgeCorner.CornerRadius = UDim.new(1, 0)
badgeCorner.Parent = badge

local badgeGradient = Instance.new("UIGradient")
badgeGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 170, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 100, 220)),
})
badgeGradient.Rotation = 90
badgeGradient.Parent = badge

local badgeText = Instance.new("TextLabel")
badgeText.Size = UDim2.new(1, 0, 1, 0)
badgeText.BackgroundTransparency = 1
badgeText.Text = "UGUZHUB"
badgeText.TextColor3 = Color3.fromRGB(255, 255, 255)
badgeText.Font = Enum.Font.GothamBlack
badgeText.TextSize = 11
badgeText.ZIndex = 13
badgeText.Parent = badge

local function drawPhoneIcon(parent)
	local holder = Instance.new("Frame")
	holder.AnchorPoint = Vector2.new(0.5, 0.5)
	holder.Size = UDim2.new(0, 70, 0, 70)
	holder.Position = UDim2.new(0.5, 0, 0.58, 0)
	holder.BackgroundTransparency = 1
	holder.ZIndex = 13
	holder.Parent = parent

	local body = Instance.new("Frame")
	body.AnchorPoint = Vector2.new(0.5, 0.5)
	body.Size = UDim2.new(0, 35, 0, 62)
	body.Position = UDim2.new(0.5, 0, 0.5, 0)
	body.BackgroundTransparency = 1
	body.ZIndex = 13
	body.Parent = holder

	local bodyCorner = Instance.new("UICorner")
	bodyCorner.CornerRadius = UDim.new(0, 10)
	bodyCorner.Parent = body

	local bodyStroke = Instance.new("UIStroke")
	bodyStroke.Color = Color3.fromRGB(230, 235, 245)
	bodyStroke.Thickness = 3
	bodyStroke.Parent = body

	local homeBtn = Instance.new("Frame")
	homeBtn.AnchorPoint = Vector2.new(0.5, 0.5)
	homeBtn.Size = UDim2.new(0, 8, 0, 8)
	homeBtn.Position = UDim2.new(0.5, 0, 0.88, 0)
	homeBtn.BackgroundColor3 = Color3.fromRGB(230, 235, 245)
	homeBtn.BorderSizePixel = 0
	homeBtn.ZIndex = 13
	homeBtn.Parent = body

	local homeCorner = Instance.new("UICorner")
	homeCorner.CornerRadius = UDim.new(1, 0)
	homeCorner.Parent = homeBtn

	return holder
end

local function drawPcTabletIcon(parent)
	local holder = Instance.new("Frame")
	holder.AnchorPoint = Vector2.new(0.5, 0.5)
	holder.Size = UDim2.new(0, 70, 0, 70)
	holder.Position = UDim2.new(0.5, 0, 0.58, 0)
	holder.BackgroundTransparency = 1
	holder.ZIndex = 13
	holder.Parent = parent

	local monitor = Instance.new("Frame")
	monitor.AnchorPoint = Vector2.new(0.5, 0.5)
	monitor.Size = UDim2.new(0, 52, 0, 35)
	monitor.Position = UDim2.new(0.42, 0, 0.4, 0)
	monitor.BackgroundTransparency = 1
	monitor.ZIndex = 13
	monitor.Parent = holder

	local monitorCorner = Instance.new("UICorner")
	monitorCorner.CornerRadius = UDim.new(0, 5)
	monitorCorner.Parent = monitor

	local monitorStroke = Instance.new("UIStroke")
	monitorStroke.Color = Color3.fromRGB(230, 235, 245)
	monitorStroke.Thickness = 2.5
	monitorStroke.Parent = monitor

	local stand = Instance.new("Frame")
	stand.AnchorPoint = Vector2.new(0.5, 0)
	stand.Size = UDim2.new(0, 17, 0, 6)
	stand.Position = UDim2.new(0.42, 0, 0.635, 0)
	stand.BackgroundColor3 = Color3.fromRGB(230, 235, 245)
	stand.BorderSizePixel = 0
	stand.ZIndex = 13
	stand.Parent = holder

	local standCorner = Instance.new("UICorner")
	standCorner.CornerRadius = UDim.new(0, 3)
	standCorner.Parent = stand

	local tablet = Instance.new("Frame")
	tablet.AnchorPoint = Vector2.new(0.5, 0.5)
	tablet.Size = UDim2.new(0, 24, 0, 35)
	tablet.Position = UDim2.new(0.72, 0, 0.58, 0)
	tablet.BackgroundColor3 = Color3.fromRGB(18, 26, 40)
	tablet.BackgroundTransparency = 0.1
	tablet.BorderSizePixel = 0
	tablet.ZIndex = 14
	tablet.Parent = holder

	local tabletCorner = Instance.new("UICorner")
	tabletCorner.CornerRadius = UDim.new(0, 5)
	tabletCorner.Parent = tablet

	local tabletStroke = Instance.new("UIStroke")
	tabletStroke.Color = Color3.fromRGB(230, 235, 245)
	tabletStroke.Thickness = 2.5
	tabletStroke.Parent = tablet

	return holder
end

local function createCard(xPos, title)
	local card = Instance.new(title == "MOBILE" and "TextButton" or "Frame")
	card.Size = UDim2.new(0.42, 0, 0.5, 0)
	card.AnchorPoint = Vector2.new(0.5, 0)
	card.Position = UDim2.new(xPos, 0, 0.44, 0)
	card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	card.BackgroundTransparency = 0.93
	card.BorderSizePixel = 0
	card.ZIndex = 12
	if card:IsA("TextButton") then
		card.AutoButtonColor = false
		card.Text = ""
	end
	card.Parent = panel

	local cardCorner = Instance.new("UICorner")
	cardCorner.CornerRadius = UDim.new(0, 18)
	cardCorner.Parent = card

	local cardStroke = Instance.new("UIStroke")
	cardStroke.Name = "CardStroke"
	cardStroke.Color = Color3.fromRGB(255, 255, 255)
	cardStroke.Transparency = 0.75
	cardStroke.Thickness = 1.5
	cardStroke.Parent = card

	local cardTitle = Instance.new("TextLabel")
	cardTitle.Size = UDim2.new(1, -12, 0, 20)
	cardTitle.Position = UDim2.new(0, 6, 0.06, 0)
	cardTitle.BackgroundTransparency = 1
	cardTitle.Text = title
	cardTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	cardTitle.Font = Enum.Font.GothamBlack
	cardTitle.TextSize = 14
	cardTitle.TextScaled = false
	cardTitle.TextWrapped = false
	cardTitle.ZIndex = 13
	cardTitle.Parent = card

	local titleConstraint = Instance.new("UITextSizeConstraint")
	titleConstraint.MaxTextSize = 14
	titleConstraint.MinTextSize = 9
	titleConstraint.Parent = cardTitle
	cardTitle.TextScaled = true

	return card
end

local mobileCard = createCard(0.28, "MOBILE")
local pcCard = createCard(0.72, "PC & TABLET")

drawPhoneIcon(mobileCard)
drawPcTabletIcon(pcCard)

mobileCard.MouseEnter:Connect(function()
	TweenService:Create(mobileCard, TweenInfo.new(0.2), {BackgroundTransparency = 0.85}):Play()
	TweenService:Create(mobileCard.CardStroke, TweenInfo.new(0.2), {Transparency = 0.2, Color = Color3.fromRGB(90, 170, 255)}):Play()
end)
mobileCard.MouseLeave:Connect(function()
	TweenService:Create(mobileCard, TweenInfo.new(0.2), {BackgroundTransparency = 0.93}):Play()
	TweenService:Create(mobileCard.CardStroke, TweenInfo.new(0.2), {Transparency = 0.75, Color = Color3.fromRGB(255, 255, 255)}):Play()
end)

local ribbon = Instance.new("Frame")
ribbon.AnchorPoint = Vector2.new(0.5, 0.5)
ribbon.Size = UDim2.new(0, 200, 0, 22)
ribbon.Position = UDim2.new(0.5, 0, 0.5, 0)
ribbon.BackgroundColor3 = Color3.fromRGB(225, 230, 240)
ribbon.BackgroundTransparency = 0.05
ribbon.BorderSizePixel = 0
ribbon.ZIndex = 15
ribbon.Parent = pcCard

local ribbonCorner = Instance.new("UICorner")
ribbonCorner.CornerRadius = UDim.new(1, 0)
ribbonCorner.Parent = ribbon

local ribbonText = Instance.new("TextLabel")
ribbonText.Size = UDim2.new(1, 0, 1, 0)
ribbonText.BackgroundTransparency = 1
ribbonText.Text = "COMING SOON"
ribbonText.TextColor3 = Color3.fromRGB(18, 26, 40)
ribbonText.Font = Enum.Font.GothamBlack
ribbonText.TextSize = 12
ribbonText.ZIndex = 16
ribbonText.Parent = ribbon

local function fitRibbonToCard()
	local w, h = pcCard.AbsoluteSize.X, pcCard.AbsoluteSize.Y
	if w > 0 and h > 0 then
		local angle = -math.deg(math.atan(h / w))
		local diagonal = math.sqrt(w * w + h * h)
		ribbon.Rotation = angle
		ribbon.Size = UDim2.new(0, diagonal * 0.88, 0, ribbon.Size.Y.Offset)
	end
end

fitRibbonToCard()
pcCard:GetPropertyChangedSignal("AbsoluteSize"):Connect(fitRibbonToCard)

pcCard.ClipsDescendants = true

local function fadeOutAndDestroy(duration)
	local tweens = {}
	local tInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	table.insert(tweens, TweenService:Create(dim, tInfo, {BackgroundTransparency = 1}))
	table.insert(tweens, TweenService:Create(panel, tInfo, {BackgroundTransparency = 1}))

	for _, d in ipairs(panel:GetDescendants()) do
		if d:IsA("TextLabel") or d:IsA("TextButton") then
			table.insert(tweens, TweenService:Create(d, tInfo, {TextTransparency = 1}))
			if d:IsA("TextButton") or d:IsA("Frame") then
				pcall(function()
					table.insert(tweens, TweenService:Create(d, tInfo, {BackgroundTransparency = 1}))
				end)
			end
		elseif d:IsA("Frame") then
			pcall(function()
				table.insert(tweens, TweenService:Create(d, tInfo, {BackgroundTransparency = 1}))
			end)
		elseif d:IsA("UIStroke") then
			table.insert(tweens, TweenService:Create(d, tInfo, {Transparency = 1}))
		end
	end

	for _, t in ipairs(tweens) do
		t:Play()
	end

	task.wait(duration)
	dim:Destroy()
	panel:Destroy()
end

local function showActiveNotification()
	local notif = Instance.new("Frame")
	notif.Name = "NotifyBar"
	notif.AnchorPoint = Vector2.new(1, 1)
	notif.Size = UDim2.new(0, 280, 0, 78)
	notif.Position = UDim2.new(1, 320, 1, -20)
	notif.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
	notif.BorderSizePixel = 0
	notif.ZIndex = 20
	notif.Parent = screenGui

	local notifCorner = Instance.new("UICorner")
	notifCorner.CornerRadius = UDim.new(0, 12)
	notifCorner.Parent = notif

	local notifStroke = Instance.new("UIStroke")
	notifStroke.Color = Color3.fromRGB(45, 45, 52)
	notifStroke.Thickness = 1
	notifStroke.Parent = notif

	local dot = Instance.new("Frame")
	dot.Size = UDim2.new(0, 10, 0, 10)
	dot.Position = UDim2.new(0, 14, 0, 12)
	dot.BackgroundColor3 = Color3.fromRGB(0, 255, 110)
	dot.BorderSizePixel = 0
	dot.ZIndex = 21
	dot.Parent = notif

	local dotCorner = Instance.new("UICorner")
	dotCorner.CornerRadius = UDim.new(1, 0)
	dotCorner.Parent = dot

	local topText = Instance.new("TextLabel")
	topText.Size = UDim2.new(1, -40, 0, 18)
	topText.Position = UDim2.new(0, 34, 0, 6)
	topText.BackgroundTransparency = 1
	topText.Text = "Value Calculator Online!"
	topText.TextColor3 = Color3.fromRGB(235, 235, 235)
	topText.Font = Enum.Font.GothamBold
	topText.TextSize = 13
	topText.TextXAlignment = Enum.TextXAlignment.Left
	topText.ZIndex = 21
	topText.Parent = notif

	local divider = Instance.new("Frame")
	divider.Size = UDim2.new(1, -28, 0, 1)
	divider.Position = UDim2.new(0, 14, 0, 30)
	divider.BackgroundColor3 = Color3.fromRGB(50, 50, 58)
	divider.BorderSizePixel = 0
	divider.ZIndex = 21
	divider.Parent = notif

	local bottomText = Instance.new("TextLabel")
	bottomText.Size = UDim2.new(1, -40, 0, 18)
	bottomText.Position = UDim2.new(0, 34, 0, 36)
	bottomText.BackgroundTransparency = 1
	bottomText.Text = "Value Hesaplayıcı Şuanda Aktif!"
	bottomText.TextColor3 = Color3.fromRGB(190, 190, 195)
	bottomText.Font = Enum.Font.Gotham
	bottomText.TextSize = 12
	bottomText.TextXAlignment = Enum.TextXAlignment.Left
	bottomText.ZIndex = 21
	bottomText.Parent = notif

	local track = Instance.new("Frame")
	track.Size = UDim2.new(1, -28, 0, 4)
	track.Position = UDim2.new(0, 14, 1, -12)
	track.BackgroundColor3 = Color3.fromRGB(40, 40, 46)
	track.BorderSizePixel = 0
	track.ZIndex = 21
	track.Parent = notif

	local trackCorner = Instance.new("UICorner")
	trackCorner.CornerRadius = UDim.new(1, 0)
	trackCorner.Parent = track

	local fill = Instance.new("Frame")
	fill.Size = UDim2.new(1, 0, 1, 0)
	fill.BackgroundColor3 = Color3.fromRGB(0, 255, 110)
	fill.BorderSizePixel = 0
	fill.ZIndex = 22
	fill.Parent = track

	local fillCorner = Instance.new("UICorner")
	fillCorner.CornerRadius = UDim.new(1, 0)
	fillCorner.Parent = fill

	local leadDot = Instance.new("Frame")
	leadDot.Size = UDim2.new(0, 8, 0, 8)
	leadDot.AnchorPoint = Vector2.new(1, 0.5)
	leadDot.Position = UDim2.new(1, 0, 0.5, 0)
	leadDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	leadDot.BorderSizePixel = 0
	leadDot.ZIndex = 23
	leadDot.Parent = fill

	local leadDotCorner = Instance.new("UICorner")
	leadDotCorner.CornerRadius = UDim.new(1, 0)
	leadDotCorner.Parent = leadDot

	TweenService:Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 1, -20)}):Play()

	task.wait(0.5)

	local fillTween = TweenService:Create(fill, TweenInfo.new(15, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)})
	fillTween:Play()

	task.wait(15)

	local exitTween = TweenService:Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, 320, 1, -20)})
	exitTween:Play()
	exitTween.Completed:Wait()
	notif:Destroy()
end

mobileCard.MouseButton1Click:Connect(function()
	mobileCard.Active = false

	task.spawn(function()
		fadeOutAndDestroy(1.2)
		scriptEnabled = true
		showActiveNotification()
	end)
end)

local function round(val, decimal)
	local mult = 10^(decimal or 0)
	return math.floor(val * mult + 0.5) / mult
end

local function isActuallyVisible(inst, root)
	local current = inst
	while current and current ~= root do
		if current:IsA("GuiObject") and not current.Visible then
			return false
		end
		current = current.Parent
	end
	return true
end

local function getOrCreateHeaderTotal(gui, headerText)
	for _, d in ipairs(gui:GetDescendants()) do
		if d:IsA("TextLabel") and d.Text:upper():find(headerText) then
			local existing = d:FindFirstChild("HeaderTotalTag")
			if existing then
				return d.Parent, existing
			end

			local tag = Instance.new("TextLabel")
			tag.Name = "HeaderTotalTag"
			tag.Size = UDim2.new(0, 160, 1, 0)
			tag.Position = UDim2.new(1, 10, 0, 0)
			tag.BackgroundTransparency = 1
			tag.Text = "Toplam: 0"
			tag.TextColor3 = Color3.fromRGB(0, 255, 100)
			tag.TextStrokeTransparency = 0
			tag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			tag.TextSize = 14
			tag.TextXAlignment = Enum.TextXAlignment.Left
			tag.Font = Enum.Font.GothamBold
			tag.ZIndex = d.ZIndex + 5
			tag.Parent = d
			return d.Parent, tag
		end
	end
	return nil, nil
end

task.spawn(function()
	while screenGui.Parent do
		task.wait(0.3)
		if scriptEnabled then
			local playerGui = player:FindFirstChild("PlayerGui")
			if playerGui then
				for _, gui in ipairs(playerGui:GetChildren()) do
					if gui:IsA("ScreenGui") and gui.Enabled and (gui.Name:lower():find("trade") or gui.Name:lower():find("takas")) then
						local yourOfferFrame, yourTotalTag = getOrCreateHeaderTotal(gui, "YOUR OFFER")
						local theirOfferFrame, theirTotalTag = getOrCreateHeaderTotal(gui, "THEIR OFFER")
						local yourTotal, theirTotal = 0, 0

						for _, desc in ipairs(gui:GetDescendants()) do
							if desc:IsA("TextLabel") and desc.Text ~= "" and desc.Name ~= "HeaderTotalTag" and isActuallyVisible(desc, gui) then
								local rawText = desc.Text

								if rawText:lower():find("live total value") then
									desc.Visible = false
								end

								if not rawText:find("Val") then
									local count = 1
									local cleanName = rawText:match("^(.-)%s*x(%d+)$")
									if cleanName then
										count = tonumber(rawText:match("x(%d+)$")) or 1
										cleanName = cleanName:gsub("^%s*(.-)%s*$", "%1")
									else
										cleanName = rawText:match("^(.-)%s*%(") or rawText
										cleanName = cleanName:gsub("^%s*(.-)%s*$", "%1")
									end

									local baseVal = (cleanName ~= "" and Values[cleanName]) or nil
									if baseVal then
										local totalItemVal = baseVal * count

										if not desc:FindFirstChild("CleanTag") then
											local tag = Instance.new("TextLabel")
											tag.Name = "CleanTag"
											tag.Size = UDim2.new(1, 0, 0, 20)
											tag.Position = UDim2.new(0, 0, -0.35, 0)
											tag.BackgroundTransparency = 1
											tag.Text = tostring(round(totalItemVal, 2)) .. " Val"
											tag.TextColor3 = Color3.fromRGB(0, 255, 100)
											tag.TextStrokeTransparency = 0
											tag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
											tag.TextSize = 12
											tag.Font = Enum.Font.GothamBold
											tag.ZIndex = desc.ZIndex + 5
											tag.Parent = desc
										else
											desc.CleanTag.Text = tostring(round(totalItemVal, 2)) .. " Val"
										end

										if yourOfferFrame and desc:IsDescendantOf(yourOfferFrame) then
											yourTotal = yourTotal + totalItemVal
										elseif theirOfferFrame and desc:IsDescendantOf(theirOfferFrame) then
											theirTotal = theirTotal + totalItemVal
										end
									end
								end
							end
						end

						if yourTotalTag then
							yourTotalTag.Text = "Toplam: " .. tostring(round(yourTotal, 2))
						end
						if theirTotalTag then
							theirTotalTag.Text = "Toplam: " .. tostring(round(theirTotal, 2))
						end
					end
				end
			end
		end
	end
end)
