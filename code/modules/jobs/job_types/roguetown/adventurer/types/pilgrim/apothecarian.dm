/datum/advclass/apothecarian
	name = "Apothecary"
	tutorial = "Not everyone who brews are witches and mages, although make a bad pill and you'll get accused of the former! You're not only an alchemist, but a passable healer as well... in theory. You don't have the education of a proper doctor, but anything you can't stitch up can be solved by a tincture of an eye of an eel and a liver of a goat. Probably."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/apothecarian
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)
	traits_applied = list(TRAIT_EMPATH)
	cmode_music = 'sound/music/combat_physician.ogg'

/datum/outfit/job/roguetown/adventurer/apothecarian
	allowed_patrons = ALL_DIVINE_PATRONS

/datum/outfit/job/roguetown/adventurer/apothecarian/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		switch(H.patron?.type)
			if(/datum/patron/divine/eora)
				head  = /obj/item/clothing/head/peaceflower
			else
		pants = /obj/item/clothing/under/roguetown/trou
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		shoes = /obj/item/clothing/shoes/roguetown/boots
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
		cloak = /obj/item/clothing/cloak/apron/brown
		backl = /obj/item/storage/backpack/rogue/backpack
		backpack_contents = list(
			/obj/item/roguegem/yellow,
			/obj/item/roguegem/yellow,
			/obj/item/roguegem/yellow,
			/obj/item/natural/stone,
			/obj/item/natural/stone,
			/obj/item/natural/stone,
			/obj/item/seeds/pipeweed,
			/obj/item/fertilizer) // Starting supplies for making a millstone and potions.

	else
		switch(H.patron?.type)
			if(/datum/patron/divine/eora)
				head  = /obj/item/clothing/head/peaceflower
			else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen
		pants = /obj/item/clothing/under/roguetown/tights/stockings/black
		shoes = /obj/item/clothing/shoes/roguetown/boots
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
		cloak = /obj/item/clothing/cloak/apron/brown
		backl = /obj/item/storage/backpack/rogue/backpack
		backpack_contents = list(
			/obj/item/roguegem/yellow,
			/obj/item/roguegem/yellow,
			/obj/item/roguegem/yellow,
			/obj/item/natural/stone,
			/obj/item/natural/stone,
			/obj/item/natural/stone,
			/obj/item/seeds/pipeweed,
			/obj/item/fertilizer) // Starting supplies for making a millstone and potions.
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE) // "Good enough" medical skill. Can't stack up to an actual doctor, though.
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE) // Strong alchemist, suitable for any health potions, but needs a bit more practice for mastery. Grinding alchemy is trivial anyway...
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", 1)
