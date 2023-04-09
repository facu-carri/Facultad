programa Ejercicio-1-c
procesos
  proceso checkEsquina(ES n:numero)
  variables
    i : numero
  comenzar
    i := 0
    mientras HayFlorEnLaEsquina
      tomarFlor
      n := n + 1
    mientras HayFlorEnLaBolsa
      depositarFlor
  fin
areas
  ciudad : AreaC(1,1,100,100)
robots 
  robot tipo1
  variables
    n,esquinas,floresEscalon : numero
  comenzar
    n := 0
    repetir 4
      floresEscalon := 0
      n := n + 1
      repetir n
        checkEsquina(floresEscalon)
        mover
      derecha
      repetir n
        checkEsquina(floresEscalon)
        mover
      checkEsquina(floresEscalon)
      si (floresEscalon > 1)
        esquinas := esquinas + 1
      derecha
      derecha
      derecha
    Informar(esquinas)
  fin
variables 
  robot1: tipo1
  robot2: tipo1
  robot3: tipo1
comenzar 
  AsignarArea(robot1,ciudad)
  AsignarArea(robot2,ciudad)
  AsignarArea(robot3,ciudad)
  Iniciar(robot1, 12, 14)
  Iniciar(robot2, 17, 10)
  Iniciar(robot3, 22, 6)
fin
