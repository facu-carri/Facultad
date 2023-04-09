programa heaven
procesos
  proceso recorrerTeamA(ES papeles:numero)
  comenzar
    derecha
    repetir 9
      takePapeles(papeles)
      mover
    takePapeles(papeles)
  fin
  proceso takePapeles(ES papeles:numero)
  comenzar
    mientras (HayPapelEnLaEsquina)
      tomarPapel
      papeles := papeles + 1
  fin
  proceso recorrerTeamB(ES flores:numero)
  comenzar
    derecha
    repetir 9
      takeFlores(flores)
      mover
    takeFlores(flores)
  fin
  proceso takeFlores(ES flores:numero)
  comenzar
    mientras (HayFlorEnLaEsquina)
      tomarFlor
      flores := flores + 1
  fin
areas
  areaA1 : AreaP(1, 1, 10, 1)
  areaA2 : AreaP(11, 1, 20, 1)
  areaB1 : AreaP(1, 5, 10, 5)
  areaB2 : AreaP(11, 5, 20, 5)
robots
  robot teamA
  variables
    papeles : numero
    two : boolean
  comenzar
    two := F
    papeles := 0
    si (PosAv <> 1)
      RecibirMensaje(papeles, a1)
      two := V
    recorrerTeamA(papeles)
    si (two = F)
      EnviarMensaje(papeles, a2)
    sino
      Informar('Papeles_Recogidas_', papeles)
  fin
  robot teamB
  variables
    flores : numero
    two : boolean
  comenzar
    two := F
    flores := 0
    si (PosAv <> 1)
      RecibirMensaje(flores, b1)
      two := V
    recorrerTeamB(flores)
    si (two = F)
      EnviarMensaje(flores, b2)
    sino
      Informar('Flores_Recogidas_', flores)
  fin
variables
  a1 : teamA
  a2 : teamA
  b1 : teamB
  b2 : teamB
comenzar
  AsignarArea(a1, areaA1)
  AsignarArea(a2, areaA2)
  AsignarArea(b1, areaB1)
  AsignarArea(b2, areaB2)
  Iniciar(a1, 1, 1)
  Iniciar(a2, 11, 1)
  Iniciar(b1, 1, 5)
  Iniciar(b2, 11, 5)
fin
