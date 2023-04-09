programa hell
areas
  AreaServer : AreaP(100, 100, 100, 100)
  Av1 : AreaPC(1, 1, 1, 100)
  Av2 : AreaPC(2, 1, 2, 100)
  Av3 : AreaPC(3, 1, 3, 100)
robots
  robot servidor
  variables
    terminados, id, N, Av, Ca : numero
  comenzar
    terminados := 0
    mientras terminados < 3
      RecibirMensaje(id, *)
      RecibirMensaje(N, *)
      si (N = 0)
        terminados := terminados + 1
      sino
        RecibirMensaje(Av, *)
        RecibirMensaje(Ca, *)
        Pos(Av,Ca)
        mientras (HayFlorEnLaBolsa) & (N <> 0)
          depositarFlor
          N := N - 1
        Pos(100,100)
        EnviarMensaje(0, cliente1)
    Informar('FIN', 0)
  fin
  robot cliente
  variables
    randFlores, id, sigAv, sigCa, preAv, preCa, ACK : numero
  comenzar
    id := PosAv
    mientras (PosCa < 100)
      Random(randFlores,1,4)
      EnviarMensaje(id, server)
      EnviarMensaje(randFlores, server)
      sigAv := PosAv
      sigCa := PosCa + 1
      EnviarMensaje(sigAv, server)
      EnviarMensaje(sigCa, server)
      RecibirMensaje(ACK, server)
      preAv := PosAv
      preCa := PosCa
      Pos(sigAv, sigCa)
      mientras (HayFlorEnLaEsquina)
        tomarFlor
      Pos(preAv, preCa)
      mientras (HayFlorEnLaBolsa) & (PosCa < 100)
        depositarFlor
        mover
      si (PosCa = 100)
        EnviarMensaje(id, server)
        EnviarMensaje(0, server)
  fin
variables
  server : servidor
  cliente1 : cliente
comenzar
  AsignarArea(server, AreaServer)
  AsignarArea(server, Av1)
  AsignarArea(server, Av2)
  AsignarArea(server, Av3)
  AsignarArea(cliente1, Av1)
  Iniciar(server, 100, 100)
  Iniciar(cliente1, 1, 1)
fin