programa heaven
procesos
  proceso cleanEsquina(E X:numero; E Y:numero; ES total:numero)
  comenzar
    Pos(X,Y)
    mientras (HayPapelEnLaEsquina)
      tomarPapel
      total := total + 1
    mientras (HayFlorEnLaEsquina)
      tomarFlor
      total := total + 1
  fin
areas
  cuadrante : AreaPC(25, 25, 75, 75)
  fiscalArea: AreaP(1,1,1,1)
  areaR1 : AreaP(25,1,25,1)
  areaR2 : AreaP(30,1,30,1)
  areaR3 : AreaP(35,1,35,1)
  areaR4 : AreaP(40,1,40,1)
robots
  robot recolector
  variables
    id, code, pointX, pointY, total, orgX, orgY : numero
  comenzar
    RecibirMensaje(id, fiscal)
    total := 0
    code := 0
    orgX := PosAv
    orgY := PosCa
    mientras (code < 2)
      si (code = 1)
        Random(pointX, 25, 75)
        Random(pointY, 25, 75)
        cleanEsquina(pointX, pointY, total)
        Pos(orgX, orgY)
        EnviarMensaje(total, fiscal)
      RecibirMensaje(code, fiscal)
    si (code = 3)
      Pos(50, 50)
  fin
  robot fiscalizador
  variables
    randId, c1, c1_a, c2, c2_a, c3, c3_a, c4, c4_a : numero
  comenzar
    c1 := 0
    c2 := 0
    c3 := 0
    c4 := 0
    EnviarMensaje(1,r1)
    EnviarMensaje(2,r2)
    EnviarMensaje(3,r3)
    EnviarMensaje(4,r4)
    repetir 10
      Random(randId, 1, 4)
      si (randId = 1)
        EnviarMensaje(1, r1)
        RecibirMensaje(c1_a, r1)
        c1 := c1 + c1_a
      sino
        si (randId = 2)
          EnviarMensaje(1, r2)
          RecibirMensaje(c2_a, r2)
          c2 := c2 + c2_a
        sino
          si (randId = 3)
            EnviarMensaje(1, r3)
            RecibirMensaje(c3_a, r3)
            c3 := c3 + c3_a
          sino
            si (randId = 4)
              EnviarMensaje(1, r4)
              RecibirMensaje(c4_a, r4)
              c4 := c4 + c4_a
    si (c1 > c2) & (c1 > c3) & (c1 > c4)
      EnviarMensaje(3, r1)
      EnviarMensaje(2, r2)
      EnviarMensaje(2, r3)
      EnviarMensaje(2, r4)
    sino
      si (c2 > c1) & (c2 > c3) & (c2 > c4)
        EnviarMensaje(3, r2)
        EnviarMensaje(2, r1)
        EnviarMensaje(2, r3)
        EnviarMensaje(2, r4)
      sino
        si (c3 > c1) & (c3 > c2) & (c3 > c4)
          EnviarMensaje(3, r3)
          EnviarMensaje(2, r1)
          EnviarMensaje(2, r2)
          EnviarMensaje(2, r4)
        sino
          EnviarMensaje(3, r4)
          EnviarMensaje(2, r1)
          EnviarMensaje(2, r2)
          EnviarMensaje(2, r3)
  fin
variables
  r1 : recolector
  r2 : recolector
  r3 : recolector
  r4 : recolector
  fiscal : fiscalizador
comenzar
  AsignarArea(r1,areaR1)
  AsignarArea(r1,cuadrante)
  AsignarArea(r2,areaR2)
  AsignarArea(r2,cuadrante)
  AsignarArea(r3,areaR3)
  AsignarArea(r3,cuadrante)
  AsignarArea(r4,areaR4)
  AsignarArea(r4,cuadrante)
  AsignarArea(fiscal,fiscalArea)
  Iniciar(r1,25,1)
  Iniciar(r2,30,1)
  Iniciar(r3,35,1)
  Iniciar(r4,40,1)
  Iniciar(fiscal,1,1)
fin