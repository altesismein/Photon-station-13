/obj/item/ashtray
	icon = 'icons/ashtray.dmi'
	var/
		max_butts 	= 0
		empty_desc 	= ""
		icon_empty 	= ""
		icon_half  	= ""
		icon_full  	= ""
		icon_broken	= ""

/obj/item/ashtray/New()
	..()
	src.pixel_y = rand(-5, 5)
	src.pixel_x = rand(-6, 6)
	return

/obj/item/ashtray/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (health < 1)
		return
	if (istype(W,/obj/item/clothing/mask/cigarette) || istype(W, /obj/item/weapon/match) || istype(W,  /obj/item/weapon/cigbutt))
		if(user)
			if (contents.len >= max_butts)
				user << "This ashtray is full."
				return
			user.drop_item(W, src)
			var/obj/item/clothing/mask/cigarette/cig = W
			if(istype(cig, /obj/item/weapon/cigbutt))
				user << "You drop the [cig] into [src]."
			if (istype(W,/obj/item/clothing/mask/cigarette) || istype(W, /obj/item/weapon/match))
				if (cig.lit == 1)
					src.visible_message("[user] crushes [cig] in [src], putting it out.")
				else if (cig.lit == 0)
					user << "You place [cig] in [src] without even lighting it. Why would you do that?"
				else if (cig.lit == -1)
					src.visible_message("[user] places [cig] in [src].")
			add_fingerprint(user)
			if (contents.len == max_butts)
				icon_state = icon_full
				desc = empty_desc + " It's stuffed full."
			else if (contents.len > max_butts/2)
				icon_state = icon_half
				desc = empty_desc + " It's half-filled."
	else
		health = max(0,health - W.force)
		user << "You hit [src] with [W]."
		if (health < 1)
			die()
	return

/obj/item/ashtray/throw_impact(atom/hit_atom)
	if (health > 0)
		health = max(0,health - 3)
		if (health < 1)
			die()
			return
		if (contents.len)
			src.visible_message("<span class='warning'>[src] slams into [hit_atom] spilling its contents!</span>")
		for (var/obj/item/clothing/mask/cigarette/O in contents)
			contents -= O
			O.loc = src.loc
		icon_state = icon_empty
	return ..()

/obj/item/ashtray/proc/die()
	src.visible_message("<span class='warning'>[src] shatters spilling its contents!</span>")
	for (var/obj/item/clothing/mask/cigarette/O in contents)
		contents -= O
		O.loc = src.loc
	icon_state = icon_broken

/obj/item/ashtray/plastic
	name = "plastic ashtray"
	desc = "Cheap plastic ashtray."
	icon_state = "ashtray_bl"
	icon_empty = "ashtray_bl"
	icon_half  = "ashtray_half_bl"
	icon_full  = "ashtray_full_bl"
	icon_broken  = "ashtray_bork_bl"
	max_butts = 14
	health = 24.0
	g_amt = 0
	m_amt = 0
	w_type = RECYK_MISC
	empty_desc = "Cheap plastic ashtray."
	throwforce = 3.0
	die()
		..()
		name = "pieces of plastic"
		desc = "Pieces of plastic with ash on them."
		return


/obj/item/ashtray/bronze
	name = "bronze ashtray"
	desc = "Massive bronze ashtray."
	icon_state = "ashtray_br"
	icon_empty = "ashtray_br"
	icon_half  = "ashtray_half_br"
	icon_full  = "ashtray_full_br"
	icon_broken  = "ashtray_bork_br"
	max_butts = 10
	health = 72.0
	m_amt = 80
	w_type = RECYK_METAL
	empty_desc = "Massive bronze ashtray."
	throwforce = 10.0

	die()
		..()
		name = "pieces of bronze"
		desc = "Pieces of bronze with ash on them."
		return


/obj/item/ashtray/glass
	name = "glass ashtray"
	desc = "Glass ashtray. Looks fragile."
	icon_state = "ashtray_gl"
	icon_empty = "ashtray_gl"
	icon_half  = "ashtray_half_gl"
	icon_full  = "ashtray_full_gl"
	icon_broken  = "ashtray_bork_gl"
	max_butts = 12
	health = 12.0
	g_amt = 60
	empty_desc = "Glass ashtray. Looks fragile."
	throwforce = 6.0

	die()
		..()
		name = "shards of glass"
		desc = "Shards of glass with ash on them."
		playsound(src, "shatter", 30, 1)
		return