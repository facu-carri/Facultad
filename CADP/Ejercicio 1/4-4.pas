programa heaven
procesos
  proceso recogerFlores
  comenzar
    mientras (HayFlorEnLaEsquina)
      tomarFlor
  fin
  proceso recogerPapeles
  comenzar
    mientras (HayPapelEnLaEsquina)
      tomarPapel
  fin
  proceso vaciarBolsa
  comenzar
    mientras (HayFlorEnLaBolsa)
      depositarFlor
    mientras (HayPapelEnLaBolsa)
      depositarPapel
  fin
areas
  areaSlaves : AreaPC(2,2,100,100)
  areaSlave_1 : AreaP(2,1,2,1)
  areaSlave_2 : AreaP(3,1,3,1)
  areaJefe : AreaP(1,1,1,1)
robots
  robot slave
  variables
    workId, av, ca : numero
  comenzar
    RecibirMensaje(workId, jefe)
    mientras (workId <> 4)
      RecibirMensaje(av, jefe)
      RecibirMensaje(ca, jefe)
      Pos(av, ca)
      si (workId = 1)
        recogerFlores
      sino
        si (workId = 2)
          recogerPapeles
        sino
          vaciarBolsa
      EnviarMensaje(workId, jefe)
      RecibirMensaje(workId, jefe)
  fin
  robot master
  variables
    id, workId, av, ca, finish, works : numero
    sindicato1, sindicato2 : boolean
  comenzar
    works := 0
    sindicato1 := F
    sindicato2 := F
    mientras (works < 10)
      Random(id,1,2)
      Random(workId,1,4)
      Random(av,2,100)
      Random(ca,2,100)
      works := works + 1
      si(id = 1) & (sindicato1 <> V)
        EnviarMensaje(workId,trabajador1)
        si(workId <> 4)
          EnviarMensaje(av,trabajador1)
          EnviarMensaje(ca,trabajador1)
          RecibirMensaje(finish,trabajador1)
        sino
          sindicato1 := V
      sino
        si(sindicato2 <> V)
          EnviarMensaje(workId,trabajador2)
          si(workId <> 4)
            EnviarMensaje(av,trabajador2)
            EnviarMensaje(ca,trabajador2)
            RecibirMensaje(finish,trabajador2)
          sino
            sindicato2 := V
    si (sindicato1 = F)
      EnviarMensaje(4,trabajador1)
    si (sindicato2 = F)
      EnviarMensaje(4,trabajador2)
    Informar('end',0)
  fin
variables
  trabajador1 : slave
  trabajador2 : slave
  jefe : master
comenzar
  AsignarArea(trabajador1,areaSlaves)
  AsignarArea(trabajador1,areaSlave_1)
  AsignarArea(trabajador2,areaSlaves)
  AsignarArea(trabajador2,areaSlave_2)
  AsignarArea(jefe,areaJefe)
  Iniciar(trabajador1,2,1)
  Iniciar(trabajador2,3,1)
  Iniciar(jefe,1,1)
fin