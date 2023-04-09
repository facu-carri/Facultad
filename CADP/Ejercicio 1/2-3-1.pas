programa heaven
procesos
  proceso recorrerTeamB(ES flores:numero)
  comenzar
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
  areaB : AreaPC(1, 5, 50, 5)
robots
  robot teamB1
  variables
    flores, floresAux : numero
    two : boolean
  comenzar
    flores := 0
    derecha
    repetir 1
      recorrerTeamB(flores)
      EnviarMensaje(flores, b2)
      RecibirMensaje(floresAux, b2)
      floresAux := flores + floresAux
  fin
  robot teamB2
  variables
    flores, floresAux : numero
    two : boolean
  comenzar
    flores := 0
    derecha
    repetir 1
      RecibirMensaje(floresAux, b1)
      flores := flores + floresAux
      recorrerTeamB(flores)
      EnviarMensaje(flores, b1)
  fin
variables
  b1 : teamB1
  b2 : teamB2
comenzar
  AsignarArea(b1, areaB)
  AsignarArea(b2, areaB)
  Iniciar(b1, 1, 5)
  Iniciar(b2, 11, 5)
fin
