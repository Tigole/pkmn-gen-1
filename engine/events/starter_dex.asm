; this function temporarily makes the starters (and Ivysaur) owned
; so that the full Pokedex information gets displayed in Oak's lab
macro MACROAddStartDex
	push af
	ld c, \1
	dec c
	ld b, FLAG_SET
	ld hl, wPokedexOwned
	predef FlagActionPredef
	pop af
endm

macro MACROClearStarterDex
	push af
	ld c, \1
	dec c
	ld b, FLAG_RESET
	ld hl, wPokedexOwned
	predef FlagActionPredef
	pop af
endm

StarterDex:
	ld c, DEX_MEWTWO
	MACROAddStartDex DEX_MEWTWO
	MACROAddStartDex DEX_CHARIZARD
	MACROAddStartDex DEX_GLOOM
	predef ShowPokedexData
	MACROClearStarterDex DEX_MEWTWO
	MACROClearStarterDex DEX_CHARIZARD
	MACROClearStarterDex DEX_GLOOM
	ret
