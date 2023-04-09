programa heaven
procesos
  proceso hacerEscalera(E height:numero; ES escalones : numero)
  variables
    flores, papeles : numero
  comenzar
    flores := 0
    papeles := 0
    repetir height
      takeAll(flores, papeles)
      mover
    takeAll(flores, papeles)
    derecha
    mover
    repetir 3
      derecha
    si (flores > papeles)
      escalones := escalones + 1
  fin
  proceso takeAll(ES flores:numero; ES papeles:numero)
  comenzar
    mientras (HayFlorEnLaEsquina)
      tomarFlor
      flores := flores + 1
    mientras (HayPapelEnLaEsquina)
      tomarPapel
      papeles := papeles + 1
  fin
areas
  areaR1 : AreaPC(2, 1, 6, 21)
  areaR2 : AreaPC(7, 1, 11, 21)
  areaR3 : AreaPC(12, 1, 16, 21)
  areaJefe : AreaP(1, 1, 1, 1)
robots
  robot escalera
  variables
    id, alto, escalones : numero
  comenzar
    RecibirMensaje(id, jefe)
    escalones := 0
    Random(alto, 1, 5)
    repetir 4
      hacerEscalera(alto, escalones)
    EnviarMensaje(escalones, jefe)
  fin
  robot boss
  variables
    papelesRobot, papelesTotal : numero
  comenzar
    EnviarMensaje(1, r1)
    EnviarMensaje(2, r2)
    EnviarMensaje(3, r3)
    repetir 3
      RecibirMensaje(papelesRobot, *)
      papelesTotal := papelesTotal + papelesRobot
    Informar('Total_de_escalones_papeles_mayor_flores_', papelesTotal)
  fin
variables
  r1 : escalera
  r2 : escalera
  r3 : escalera
  jefe : boss
comenzar
  AsignarArea(r1, areaR1)
  AsignarArea(r2, areaR2)
  AsignarArea(r3, areaR3)
  AsignarArea(jefe, areaR1)
  AsignarArea(jefe, areaR2)
  AsignarArea(jefe, areaR3)
  AsignarArea(jefe, areaJefe)
  Iniciar(r1, 2, 1)
  Iniciar(r2, 7, 1)
  Iniciar(r3, 12, 1)
  Iniciar(jefe, 1, 1)
fin
