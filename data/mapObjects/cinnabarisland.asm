CinnabarIslandObject: ; 0x1c022 (size=71)
	db $43 ; border block

	db $5 ; warps
	db $3, $6, $1, MANSION_1
	db $3, $12, $0, CINNABAR_GYM
	db $9, $6, $0, CINNABAR_LAB_1
	db $b, $b, $0, CINNABAR_POKECENTER
	db $b, $f, $0, CINNABAR_MART

	db $5 ; signs
	db $5, $9, $3 ; CinnabarIslandText3
	db $b, $10, $4 ; MartSignText
	db $b, $c, $5 ; PokeCenterSignText
	db $b, $9, $6 ; CinnabarIslandText6
	db $3, $d, $7 ; CinnabarIslandText7

	db $2 ; people
	db SPRITE_GIRL, $7 + 4, $c + 4, $fe, $2, $1 ; person
	db SPRITE_GAMBLER, $5 + 4, $7 + 4, $ff, $ff, $2 ; person

	; warp-to
	EVENT_DISP CINNABAR_ISLAND_WIDTH, $3, $6 ; MANSION_1
	EVENT_DISP CINNABAR_ISLAND_WIDTH, $3, $12 ; CINNABAR_GYM
	EVENT_DISP CINNABAR_ISLAND_WIDTH, $9, $6 ; CINNABAR_LAB_1
	EVENT_DISP CINNABAR_ISLAND_WIDTH, $b, $b ; CINNABAR_POKECENTER
	EVENT_DISP CINNABAR_ISLAND_WIDTH, $b, $f ; CINNABAR_MART
