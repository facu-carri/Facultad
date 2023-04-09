programa Ejercicio-1-a
procesos
  proceso checkEsquina (ES ft:numero; ES ev:numero)
  comenzar
    si (~HayFlorEnLaEsquina)
      ev := ev + 1
    sino
      mientras(HayFlorEnLaEsquina)
        ft := ft + 1
        tomarFlor
  fin
  proceso recorrerAvenida
  variables
    floresTomadas : numero
    esquinasVacias : numero
  comenzar
    floresTomadas := 0
    esquinasVacias := 0
    repetir (99)
      checkEsquina(floresTomadas, esquinasVacias)
      mover
    checkEsquina(floresTomadas, esquinasVacias)
    Informar(floresTomadas)
    Informar(esquinasVacias)
  fin
areas
  ciudad : AreaC(1,1,100,100)
robots
  robot tipo1
  comenzar
    recorrerAvenida
  fin
  robot tipo2
  comenzar
    recorrerAvenida
  fin
  robot tipo3
  comenzar
    recorrerAvenida
  fin
variables 
  robot1: tipo1
  robot2: tipo2
  robot3: tipo3
comenzar 
  AsignarArea(robot1,ciudad)
  AsignarArea(robot2,ciudad)
  AsignarArea(robot3,ciudad)
  Iniciar(robot1, 1, 1)
  Iniciar(robot2, 3, 1)
  Iniciar(robot3, 5, 1)
fin
