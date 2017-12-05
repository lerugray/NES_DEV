  .inesprg 2   ; 2x 16KB PRG code
  .ineschr 1   ; 1x  8KB CHR data
  .inesmap 0   ; mapper 0 = UNROM
  .inesmir 1   ; background mirroring
  
;;;;;;;;;;;;;;;

  .org $0000

AddrLow:                  .rs 1   ;00
AddrHigh:                .rs 1
gamestate:            .rs 1   ;02
BG_ptr:                    .rs 1
PAL_ptr:                .rs 1
ATTR_ptr:           .rs 1
SPRITES_ptr:     .rs 1
soft2001:            .rs 1   ;32
sleeping:                 .rs 1
buttons1:              .rs 1
buttons2:             .rs 1
ballx:                        .rs 1   ; ball x (H) axis
ballx0:                    .rs 1
ballx1:                    .rs 1
bally:                       .rs 1   ;ball y(V) axis
bally0:                   .rs 1
bally1:                    .rs 1
ballup:                     .rs 1   ;1 = ball moving up
balldown:               .rs 1   ;1 = ball moving down
ballleft:                .rs 1
ballright:              .rs 1
ballspeedx:         .rs 1
ballspeedy:         .rs 1
score1:                  .rs 1
score2:                  .rs 1
pad1TopX0:      .rs 1
pad1TopX1:       .rs 1
pad1TopY0:      .rs 1
pad1MidX0:       .rs 1
pad1MidX1:       .rs 1
pad1MidY0:       .rs 1
pad1MidY1:       .rs 1
pad1BotX0:     .rs 1
pad1BotX1:     .rs 1
pad1BotY0:     .rs 1
pad1BotY1:     .rs 1
pad2TopX0:   .rs 1
pad2TopX1:    .rs 1
pad2TopY0:   .rs 1
pad2TopY1:   .rs 1
pad2MidX0:    .rs 1
pad2MidX1:     .rs 1
pad2MidY0:     .rs 1
pad2MidY1:     .rs 1
pad2BotX0:    .rs 1
pad2BotX1:    .rs 1
pad2BotY0:    .rs 1
pad2BotY1:    .rs 1
pad1V:                 .rs 1
pad2V:                 .rs 1
hitDetected:   .rs 1
paddle1Stop: .rs 1
paddle2Stop: .rs 1

;;;;;;;;;;;;;;;

;constants

STATETITLE        = $00
STATEPLAYING      = $01
STATEGAMEOVER     = $02

STATELOADTITLE    = $03
STATELOADPLAYING  = $04
STATELOADGAMEOVER = $05

RIGHTWALL      = $F4 ;when ball reaches one of these, do something
TOPWALL        = $08
BOTTOMWALL     = $E0
LEFTWALL       = $04
  
PADDLE1X       = $08  ; horizontal position for paddles, doesnt move
PADDLE2X       = $F0

PADDLE1        = $0300
PADDLE2        = $0310
BALL           = $0314
SCOREP1        = $0318
SCOREP2        = $031C


;;;;;;;;;;;;;;

  .bank 0
  .org $8000

;;;;;;;;;;;;;;

  .bank 1
  .org $A000

;;;;;;;;;;;;;;

  .bank 2
  .org $C000

bkgd_pointer_table:
  .word Title, Playing, GameOver

attr_pointer_table:
  .word TitleAttr, PlayingAttr, GameOverAttr

palette_pointer_table:
  .word TitlePal, PlayingPal, GameOverPal

sprites_pointer_table:
  .word TitleSP, PlayingSP, GameOverSP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;NAMETABLES;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Title:

Playing:

  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

GameOver:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;ATTRIBUTES;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TitleAttr:
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

PlayingAttr:
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

GameOverAttr:
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
  .db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;PALETTES;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TitlePal:
  .db $0E,$3D,$12,$16,  $0E,$18,$20,$12,  $0E,$3D,$12,$18,  $0E,$0F,$2D,$30   ;;background palette
  .db $0E,$0F,$28,$30,  $0E,$0F,$30,$28,  $0E,$00,$00,$00,  $0E,$00,$00,$3D   ;;sprite palette

PlayingPal:
  .db $0F,$30,$06,$27,  $0E,$18,$20,$12,  $0E,$3D,$12,$18,  $0E,$0F,$2D,$30   ;;background palette
  .db $0E,$29,$35,$30,  $0E,$0F,$30,$28,  $0E,$00,$00,$00,  $0E,$00,$00,$3D   ;;sprite palette

GameOverPal:
  .db $0E,$16,$3D,$18,  $0E,$16,$12,$3D,  $0E,$16,$3D,$18,  $0E,$0F,$2D,$30   ;;background palette
  .db $0E,$0F,$28,$30,  $0E,$0F,$23,$28,  $0E,$0F,$37,$28,  $0E,$0F,$18,$28   ;;sprite palette

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;SPRITES;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TitleSP:
     ;vert tile attr horiz
  .db $37, $37, $37, $37   ;end

PlayingSP:
     ;vert tile atr/pal horiz
    .db $08, $02, $00, PADDLE1X   ; p1 start
    .db $10, $02, $00, PADDLE1X
    .db $18, $02, $00, PADDLE1X
    .db $20, $02, $00, PADDLE1X
    .db $08, $02, $00, PADDLE2X   ; p2 start
    .db $10, $02, $00, PADDLE2X 
    .db $18, $02, $00, PADDLE2X
    .db $20, $02, $00, PADDLE2X
    .db $80, $01, $00, $80  ;ball
    .db $06, $03, $00, $0C ; p1 score
    .db $06, $03, $00, $EC ; p2 score 
    .db $37, $37, $37, $37   ;end
GameOverSP:
     ;vert tile attr horiz
  .db $37, $37, $37, $37   ;end

;;;;;;;;;;;;;;

  .bank 3
  .org $E000

RESET:
  SEI          ; disable IRQs
  CLD          ; disable decimal mode
  LDX #$40
  STX $4017    ; disable APU frame IRQ
  LDX #$FF
  TXS          ; Set up stack
  INX          ; now X = 0
  STX $2000    ; disable NMI
  STX $2001    ; disable rendering
  STX $4010    ; disable DMC IRQs

  JSR vblankwait

clrmem:
  LDA #$00
  STA $0000, x
  STA $0100, x
  STA $0200, x
  STA $0400, x
  STA $0500, x
  STA $0600, x
  STA $0700, x
  LDA #$FE
  STA $0300, x
  INX
  BNE clrmem
   
  JSR vblankwait
  
;;;initializing stuff ;;;

  LDA #$01
  STA balldown
  STA ballright
  LDA #$00
  STA ballup
  STA ballleft

  LDA #$80
  STA bally

  LDA #$80
  STA ballx

  LDA #$02
  STA ballspeedx
  STA ballspeedy

  LDA #$00
  STA score1
  STA score2

;;starting state;;
  LDA #STATELOADPLAYING
  STA gamestate

;;;;;;;;;;;;;;;;;;;;;;;;;

  LDA #%10001000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
  STA $2000

  LDA #%00011110   ; enable sprites, enable background, no clipping on left side
  STA soft2001
  STA $2001

Forever:
  INC sleeping
.loop             ; NMI will return in the loop with sleeping set to #$00
  LDA sleeping
  BNE .loop
  
  JSR ReadController1  ;;get the current button data for player 1
  JSR ReadController2
  
GameEngine:
  LDA gamestate
  CMP #STATELOADTITLE
  BNE NotLoadTitle
  JSR EngineLoadTitle     ;run the EngineLoadTitle subroutine
  JMP GameEngineDone      ;Jump to the end of the game engine when done (skipping code we don't want to run)
NotLoadTitle:
  CMP #STATETITLE
  BNE NotTitle
  JSR EngineTitle
  JMP GameEngineDone
NotTitle:
  CMP #STATELOADPLAYING
  BNE NotLoadPlaying
  JSR EngineLoadPlaying
  JMP GameEngineDone
NotLoadPlaying:
  CMP #STATEPLAYING
  BNE NotPlaying
  JSR EnginePlaying
  JMP GameEngineDone
NotPlaying:
  CMP #STATELOADGAMEOVER
  BNE NotLoadGameOver
  JSR EngineLoadGameOver
  JMP GameEngineDone
NotLoadGameOver:
  CMP #STATEGAMEOVER
  BNE NotGameOver
  JSR EngineGameOver
  JMP GameEngineDone
NotGameOver:
GameEngineDone:
 
;;;;;;;;

  JMP Forever     ;jump back to Forever, infinite loop, waiting for NMI
  
NMI:
  PHA
  TXA
  PHA
  TYA
  PHA

  LDA #$00
  STA $2003       ; set the low byte (00) of the RAM address
  LDA #$03
  STA $4014       ; set the high byte (03) of the RAM address, start the transfer

  ;;This is the PPU clean up section, so rendering the next frame starts properly.
  LDA #%10001000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
  STA $2000
  LDA soft2001     ; enable sprites, enable background, no clipping on left side
  STA $2001        ;tell the ppu there is no background scrolling
  LDA #$00
  STA $2005
  STA $2005
  
  DEC sleeping     ; set sleeping variable to #$00 so your main loop will run once

  PLA
  TYA
  PLA
  TAX
  PLA

  ;;;all graphics updates done by here, run game engine

  RTI             ; return from interrupt

  ;;;;;;;;;

EngineLoadTitle:
  LDA #STATETITLE
  STA gamestate
  RTS

EngineTitle:
  ;;if start button pressed
  ;;  turn screen off
  ;;  load game screen
  ;;  set starting paddle/ball position
  ;;  go to Playing State
  ;;  turn screen on
  LDA #STATELOADPLAYING
  STA gamestate
  RTS

;;;;;;;;;

EngineLoadPlaying:
  LDA #$00
  STA $2000
  STA $2001

;;bank setup;;

  LDA #$01
  STA PAL_ptr
  STA BG_ptr
  STA ATTR_ptr
  STA SPRITES_ptr

  JSR LoadNametable
  JSR LoadPalette
  JSR LoadAttribute
  JSR LoadSprites

  LDA #STATEPLAYING
  STA gamestate

  JSR vblankwait

  LDA #%10001000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
  STA $2000

  LDA #%00011110   ; enable sprites, enable background, no clipping on left side
  STA soft2001

  RTS

;;;;;;;;;

EnginePlaying:
  JSR movePaddle1Down
  JSR movePaddle1Up
  JSR movePaddle2Down
  JSR movePaddle2Up
  RTS

;;;;;;;;;

EngineLoadGameOver:
  RTS

;;;;;;;;;

EngineGameOver:
  RTS

;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; subroutines go here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

updatePaddle1Collision:
  LDA #PADDLE1
  CLC
  ADC #$05
  STA pad1TopX0 ;only checking one side 
  STA pad1TopX1
  STA pad1MidX0
  STA pad1MidX1
  STA pad1BotX0
  STA pad1BotX1

  LDA PADDLE1;this will update the top part of paddle
  STA pad1TopY0
  CLC 
  ADC #$03
  STA pad1TopY1

  LDA PADDLE1+4
  STA pad1MidY0
  CLC
  ADC #$0F
  STA pad1MidY1

  LDA PADDLE1+12 ; bottom part of paddle
  CLC
  ADC #$04
  STA pad1BotY0 ;top
  CLC 
  ADC #$03
  STA pad1BotY1 ; bottom

  RTS

  updatePaddle2Collision:
    LDA #PADDLE2
    CLC
    ADC #$05
    STA pad2TopX0
    STA pad2TopX1
    STA pad2MidX0
    STA pad2MidX1
    STA pad2BotX0
    STA pad2BotX1

    LDA PADDLE2
    STA pad2TopY0
    CLC
    ADC #$03
    STA pad2TopY1

    LDA PADDLE2+4
    STA pad2MidY0
    CLC
    ADC #$0F
    STA pad2MidY1

    LDA PADDLE2+12
    CLC
    ADC #$04
    STA pad1BotY0
    CLC
    ADC #$03
    STA pad2TopY1

    RTS

detPad1ColTop: ;detect collision with paddle1 top
  LDA ballx1
  CMP pad1TopX0
  BCC .noHit
  LDA bally1
  CMP pad1TopY0
  BCC .noHit
  LDA pad1TopX1
  CMP ballx0
  BCC .noHit
  LDA pad1TopY1
  CMP bally0
  BCC .noHit

  .hit:
    LDA #$01
    STA hitDetected
    RTS

  .noHit:
    LDA #$00
    STA hitDetected
    RTS

detPad1ColMid: ; same as above with mid
  LDA ballx1
  CMP pad1MidX0
  BCC .noHit
  LDA bally1
  CMP pad1MidY0
  BCC .noHit
  LDA pad1MidX1
  CMP ballx0
  BCC .noHit
  LDA pad1MidY1
  CMP bally0
  BCC .noHit

  .hit:
    LDA #$01
    STA hitDetected
    RTS

  .noHit:
    LDA #$00
    STA hitDetected
    RTS

detPad1ColBot:
  LDA ballx1
  CMP pad1BotX0
  BCC .noHit
  LDA bally1
  CMP pad1BotY0
  BCC .noHit
  LDA pad1BotX1
  CMP ballx0
  BCC .noHit
  LDA pad1BotY1
  CMP bally0
  BCC .noHit

  .hit:
    LDA #$01
    STA hitDetected
    RTS

  .noHit:
    LDA #$00
    STA hitDetected
    RTS

detPad2ColTop:
  LDA ballx1
  CMP pad2TopX0
  BCC .noHit
  LDA bally1
  CMP pad2TopY0
  BCC .noHit
  LDA pad2TopX1
  CMP ballx0
  BCC .noHit
  LDA pad2TopY1
  CMP bally0
  BCC .noHit

  .hit:
    LDA #$01
    STA hitDetected
    RTS

  .noHit:
    LDA #$00
    STA hitDetected
    RTS

detPad2ColMid:
  LDA ballx1
  CMP pad2MidX0
  BCC .noHit
  LDA bally1
  CMP pad2MidY0
  BCC .noHit
  LDA pad2MidX1
  CMP ballx0
  BCC .noHit
  LDA pad2MidY1
  CMP bally0
  BCC .noHit

  .hit:
    LDA #$01
    STA hitDetected
    RTS

  .noHit:
    LDA #$00
    STA hitDetected
    RTS

detPad2ColBot:
  LDA ballx1
  CMP pad2BotX0
  BCC .noHit
  LDA bally1
  CMP pad2BotY0
  BCC .noHit
  LDA ballx0
  CMP pad2BotX1
  BCC .noHit
  LDA bally0
  CMP pad2BotY1
  BCC .noHit

  .hit:
    LDA #$01
    STA hitDetected
    RTS

  .noHit:
    LDA #$00
    STA hitDetected
    RTS

updateBallTrajectory:
  JSR detPad1ColTop
  LDA hitDetected
  BNE .changeDirA

  JSR detPad1ColMid
  LDA hitDetected
  BNE .changeDirB

  JSR detPad1ColBot
  LDA hitDetected
  BNE .changeDirC

  JSR detPad2ColTop
  LDA hitDetected
  BNE .changeDirAA

  JSR detPad2ColMid
  LDA hitDetected
  BNE .changeDirBA

  JSR detPad2ColBot
  LDA hitDetected
  BNE .changeDirCA

  .changeDirA:      ;top
    LDA #$03
    STA ballspeedx
    LDA #$01
    STA ballx1
    STA bally0
    LDA #$00
    STA ballx0
    STA bally0
    JMP .End

  .changeDirB:      ;mid
    LDA paddle1Stop
    BNE .next
    LDA pad


updateBallCollision:
  LDA bally
  STA bally0
  CLC
  ADC #$08
  STA bally1
  
  LDA ballx
  STA ballx0
  CLC
  ADC #$08
  STA ballx1
  RTS

moveBallDown:
  LDA balldown ;load if balldown == 1
  BEQ .End ; if not, end the program

  LDA bally ;load y posistion
  CLC 
  ADC ballspeedy ;add speed to y posistion
  STA bally ; store new y posistion

  LDA bally ; if bally pos hits
  CMP #BOTTOMWALL ;bottom wall location
  BCC .End ; if not, dont do this
  LDA #$00  ; ball is now not going down
  STA balldown
  LDA #$01
  STA ballup ; ballup is now 1
  .End:
    RTS

moveBallUp:
  LDA ballup
  BEQ .End

  LDA bally
  SEC
  SBC ballspeedy
  STA bally

  LDA bally 
  CMP #TOPWALL
  BCS .End
  LDA #$01
  STA ballup
  LDA #$00
  STA balldown
  .End:
    RTS

moveBallLeft:
  LDA ballleft
  BEQ .End

  LDA ballx
  SEC
  SBC ballspeedx
  STA ballx

  LDA ballx
  CMP #RIGHTWALL
  BCS .End
  LDA #$01
  STA ballleft
  LDA #$00
  STA ballright
  .End: ;WE STILL NEED TO ADD POINTS AFTER COLLISION
  RTS

moveBallRight:
  LDA ballright
  BEQ .End

  LDA ballx
  CMP #RIGHTWALL
  BCC .End
  LDA #$01
  STA ballleft
  LDA #$00
  STA ballright
  .End:
    RTS

updateBallLocation:
  LDA bally
  STA BALL
  LDA ballx
  STA BALL+3
  RTS

movePaddle1Down:
  LDA buttons1
  AND #%00000100
  BEQ .End
  INC pad1V
  LDA #$00 
  STA paddle1Stop
  JSR updatePaddle1Location
  .End:
    LDA #$01
    STA paddle1Stop
    RTS


movePaddle1Up:
  LDA buttons1
  AND #%00001000
  BEQ .End
  DEC pad1V
  LDA #$00 
  STA paddle1Stop
  JSR updatePaddle1Location
  .End:
    LDA #$01
    STA paddle1Stop
    RTS

updatePaddle1Location:
  LDA pad1V
  STA PADDLE1
  CLC
  ADC #$08
  STA PADDLE1+4
  CLC
  ADC #$08
  STA PADDLE1+8
  CLC
  ADC #$08
  STA PADDLE1+12

  LDA #PADDLE1X
  STA PADDLE1+3
  STA PADDLE1+7
  STA PADDLE1+11
  STA PADDLE1+15
  RTS

movePaddle2Down:
  LDA buttons2
  AND #%00000100
  BEQ .End
  INC pad2V
  LDA #$00 
  STA paddle2Stop
  JSR updatePaddle2Location
  .End:
    LDA #$01
    STA paddle2Stop
    RTS


movePaddle2Up:
  LDA buttons2
  AND #%00001000
  BEQ .End
  DEC pad2V
  LDA #$00 
  STA paddle2Stop
  JSR updatePaddle2Location
  .End:
    LDA #$01
    STA paddle2Stop
    RTS

updatePaddle2Location:
  LDA pad2V
  STA PADDLE2
  CLC
  ADC #$08
  STA PADDLE2+4
  CLC
  ADC #$08
  STA PADDLE2+8
  CLC
  ADC #$08
  STA PADDLE2+12

  LDA #PADDLE2X
  STA PADDLE2+3
  STA PADDLE2+7
  STA PADDLE2+11
  STA PADDLE2+15

  RTS

vblankwait:       ; First wait for vblank to make sure PPU is ready
  BIT $2002
  BPL vblankwait
  RTS

ReadController1:
  LDA #$01
  STA $4016
  LDA #$00
  STA $4016
  LDX #$08
ReadControllerLoop:
  LDA $4016
  LSR A           ; bit0 -> Carry
  ROL buttons1     ; bit0 <- Carry
  DEX
  BNE ReadControllerLoop
  RTS

  ReadController2:
  LDA #$01
  STA $4016
  LDA #$00
  STA $4016
  LDX #$08
ReadController2Loop:
  LDA $4017
  LSR A            ; bit0 -> Carry
  ROL buttons2     ; bit0 <- Carry
  DEX
  BNE ReadController2Loop
  RTS  

 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LoadAttribute: 
  LDA $2002 
  LDA #$23 
  STA $2006 
  LDA #$C0 
  STA $2006

  LDA ATTR_ptr
  ASL A
  TAY
  LDA attr_pointer_table, y
  STA AddrLow
  LDA attr_pointer_table+1, y
  STA AddrHigh

  LDY #$00 
LoadAttributeLoop: 
  LDA [AddrLow], y
  STA $2007 
  INY
  CPY #$40 
  BNE LoadAttributeLoop
  RTS

LoadNametable:
  LDA $2002
  LDA #$20
  STA $2006
  LDA #$00
  STA $2006

  LDA BG_ptr
  ASL A
  TAY
  LDA bkgd_pointer_table, y
  STA AddrLow
  LDA bkgd_pointer_table+1, y
  STA AddrHigh

  LDX #$04
  LDY #$00
LoadBackgroundsLoop:
  LDA [AddrLow], y               ;load nametable
  STA $2007                      ;draw tile
  INY                            ;X is 0, so move on to get new counter number
  BNE LoadBackgroundsLoop
;;Outer Loop
  INC AddrHigh
  DEX
  BNE LoadBackgroundsLoop
  RTS

LoadPalette:
  LDA $2002             ; read PPU status to reset the high/low latch
  LDA #$3F
  STA $2006             ; write the high byte of $3F00 address
  LDA #$00
  STA $2006             ; write the low byte of $3F00 address

  LDA PAL_ptr
  ASL A
  TAY

  LDA palette_pointer_table, y
  STA AddrLow
  LDA palette_pointer_table+1, y
  STA AddrHigh

  LDY #$00              ; start out at 0
LoadPalettesLoop:
  LDA [AddrLow], y        ; load data from address (palette + the value in x)
                          ; 1st time through loop it will load palette+0
                          ; 2nd time through loop it will load palette+1
                          ; 3rd time through loop it will load palette+2
                          ; etc
  STA $2007             ; write to PPU
  INY                   ; X = X + 1
  CPY #$20              ; Compare X to hex $10, decimal 16 - copying 16 bytes = 4 sprites
  BNE LoadPalettesLoop  ; Branch to LoadPalettesLoop if compare was Not Equal to zero
                        ; if compare was equal to 32, keep going down
  RTS

LoadSprites:
  LDX #$00

  LDA SPRITES_ptr
  ASL A
  TAY

  LDA sprites_pointer_table,y
  STA AddrLow
  LDA sprites_pointer_table+1,y
  STA AddrHigh

  LDY #$00
LoadSpritesLoop:
  LDA [AddrLow], y
  CMP #$37
  BEQ .End
  STA $0300, y
  INY
  CPY #$FF
  BNE LoadSpritesLoop
.End:
  RTS

  .org $FFFA     ;first of the three vectors starts here
  .dw NMI        ;when an NMI happens (once per frame if enabled) the 
                   ;processor will jump to the label NMI:
  .dw RESET      ;when the processor first turns on or is reset, it will jump
                   ;to the label RESET:
  .dw 0          ;external interrupt IRQ is not used in this tutorial  

;;;;;;;;;;;;;;

  .bank 4
  .org $0000
  .incbin "Graphics/blank.chr"   ;includes 8KB graphics file from LSL