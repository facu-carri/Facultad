programa Ejercicio-1-e
procesos
  proceso recogerFlores(ES flores:numero)
  comenzar
    mientras (HayFlorEnLaEsquina)
      tomarFlor
      flores := flores + 1
  fin
  proceso recorrerCalle(ES flores:numero)
  comenzar
    repetir 9
      recogerFlores(flores)
      mover
    recogerFlores(flores)
  fin
areas
  areaRobot1 : AreaPC(1, 1, 1, 10)
  areaRobot2 : AreaPC(2, 11, 2, 20)
  areaFiscal : AreaP(2, 1, 2, 1)
robots 
  robot jugador
  variables
    num, id, num2 : numero
  comenzar
    num := 0
    RecibirMensaje(id, fiscal)
    recorrerCalle(num)
    EnviarMensaje(id, fiscal)
    EnviarMensaje(num, fiscal)
  fin
  robot fiscalizador
  variables
    id, flores1, flores2, dif : numero
  comenzar
    EnviarMensaje(1, jugador1)
    EnviarMensaje(2, jugador2)
    repetir 2
      RecibirMensaje(id, *)
      si (id = 1)
        RecibirMensaje(flores1, jugador1)
      sino
        RecibirMensaje(flores2, jugador2)
    si flores1 > flores2
      dif := flores1 - flores2
      Informar('Gana_robot_1_diferencia_', dif)
    sino
      si (flores2 < flores1)
        dif := flores2 - flores1
        Informar('Gana_robotito_2_diferencia_', dif)
      sino
        Informar('Empate_de_puntos_', flores1)
  fin
variables 
  jugador1 : jugador
  jugador2 : jugador
  fiscal : fiscalizador
comenzar 
  AsignarArea(jugador1, areaRobot1)
  AsignarArea(jugador2, areaRobot2)
  AsignarArea(fiscal, areaRobot1)
  AsignarArea(fiscal, areaRobot2)
  AsignarArea(fiscal, areaFiscal)
  Iniciar(jugador1, 1, 1)
  Iniciar(jugador2, 2, 11)
  Iniciar(fiscal, 2, 1)
fin

