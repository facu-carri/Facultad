programa Ejercicio-1-d
procesos
  proceso cleanCornerFlores
  comenzar
    mientras HayFlorEnLaEsquina
      tomarFlor
  fin
  proceso cleanCornerPapeles
  comenzar
    mientras HayPapelEnLaEsquina
      tomarPapel
  fin
  proceso recorrerAvenidas(E av:numero; E flores:boolean)
  comenzar
    repetir 2
      repetir 24
        si flores
          recorreFlores
        sino
          recorrePapeles
        Pos(PosAv + 1, 1)
      Pos(av, 1)
  fin
  proceso recorreFlores
  comenzar
    repetir 99
      cleanCornerFlores
      mover
    cleanCornerFlores
  fin
  proceso recorrePapeles
  comenzar
    repetir 99
      cleanCornerPapeles
      mover
    cleanCornerPapeles
  fin
areas
  area1 : AreaC(1,1,25,100)
  area2 : AreaC(26,1,50,100)
  area3 : AreaC(51,1,75,100)
  area4 : AreaC(76,1,100,100)
robots
  robot areaImpar
  comenzar
    recorrerAvenidas(51, V)
  fin
  robot areaPar
  comenzar
    recorrerAvenidas(76, F)
  fin
variables 
  robot1: areaImpar
  robot2: areaPar
comenzar 
  AsignarArea(robot1,area1)
  AsignarArea(robot1,area3)
  AsignarArea(robot2,area2)
  AsignarArea(robot2,area4)
  Iniciar(robot1,1,1)
  Iniciar(robot2,26,1)
fin
