MtMoonPokecenterScript: ; 492cf (12:52cf)
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

MtMoonPokecenterTextPointers: ; 492d5 (12:52d5)
	dw MtMoonPokecenterText1
	dw MtMoonPokecenterText2
	dw MtMoonPokecenterText3
	dw MtMoonPokecenterText4
	dw MtMoonPokecenterText5
	dw MtMoonPokecenterText6

MtMoonPokecenterText1: ; 492e1 (12:52e1)
	db $ff

MtMoonPokecenterText2: ; 492e2 (12:52e2)
	TX_FAR _MtMoonPokecenterText1
	db "@"

MtMoonPokecenterText3: ; 492e7 (12:52e7)
	TX_FAR _MtMoonPokecenterText3
	db "@"

MtMoonPokecenterText4:
	db $08 ; asm
	ld a, [wMtMoonPokecenterFlags]
	add a
	jp c, .alreadyBoughtMagikarp
	ld hl, MtMoonPokecenterText_4935c
	call PrintText
	ld a, $13
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .choseNo
	ldh [$9f], a
	ldh [$a1], a
	ld a, $5
	ldh [$a0], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, MtMoonPokecenterText_49366
	jr .printText
.enoughMoney
	; this Magikarp is shiny
	ld hl, wExtraFlags
	set 0, [hl]
	lb bc, MAGIKARP, 5
	call GivePokemon
	jr nc, .done
	xor a
	ld [wWhichTrade], a
	ld [wTrainerFacingDirection], a
	ld a, $5
	ld [wTrainerEngageDistance], a
	ld hl, wTrainerFacingDirection
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, $13
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, wMtMoonPokecenterFlags
	set 7, [hl]
	jr .done
.choseNo
	ld hl, MtMoonPokecenterText_49361
	jr .printText
.alreadyBoughtMagikarp
	ld hl, MtMoonPokecenterText_4936b
.printText
	call PrintText
.done
	; reset the shiny flag just in case buying it failed, so the next wildmon isn't accidentally shiny
	ld hl, wExtraFlags
	res 0, [hl]
	jp TextScriptEnd

MtMoonPokecenterText_4935c: ; 4935c (12:535c)
	TX_FAR _MtMoonPokecenterText_4935c
	db "@"

MtMoonPokecenterText_49361: ; 49361 (12:5361)
	TX_FAR _MtMoonPokecenterText_49361
	db "@"

MtMoonPokecenterText_49366: ; 49366 (12:5366)
	TX_FAR _MtMoonPokecenterText_49366
	db "@"

MtMoonPokecenterText_4936b: ; 4936b (12:536b)
	TX_FAR _MtMoonPokecenterText_4936b
	db "@"

MtMoonPokecenterText5: ; 49370 (12:5370)
	TX_FAR _MtMoonPokecenterText5
	db "@"

MtMoonPokecenterText6: ; 49375 (12:5375)
	db $f6
