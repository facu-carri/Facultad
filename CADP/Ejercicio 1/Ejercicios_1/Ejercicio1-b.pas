programa Ejercicio-1-b
procesos
  proceso spin
  comenzar
    mientras(V)
      derecha
      repetir 20
        mientras(HayPapelEnLaEsquina)
          tomarPapel
        mover
  fin
areas
  ciudad : AreaC(1,1,100,100)
robots 
  robot tipo1
  comenzar
    derecha
    derecha
    derecha
    spin
  fin
  robot tipo2
  comenzar
    spin
  fin
  robot tipo3
  comenzar
    derecha
    spin
  fin
  robot tipo4
  comenzar
    derecha
    derecha
    spin
  fin
variables 
  robot1: tipo1
  robot2: tipo2
  robot3: tipo3
  robot4: tipo4 
comenzar 
  AsignarArea(robot1,ciudad)
  AsignarArea(robot2,ciudad)
  AsignarArea(robot3,ciudad)
  AsignarArea(robot4,ciudad)
  Iniciar(robot1, 10, 10)
  Iniciar(robot2, 10, 30)
  Iniciar(robot3, 30, 30)
  Iniciar(robot4, 30, 10)
fin
