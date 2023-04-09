programa hell
procesos
  proceso depositarFloresServer(E X:numero; E Y:numero; E N:numero)
  comenzar
    Pos(X,Y)
    repetir N
      depositarFlor
    Pos(100,100)
  fin
areas
  AreaServer : AreaP(100, 100, 100, 100)
  Av1 : AreaPC(1, 1, 1, 100)
  Av2 : AreaPC(2, 1, 2, 100)
  Av3 : AreaPC(3, 1, 3, 100)
robots
  robot server
  variables
    id : numero 
    N : numero 
    Av : numero
    Ca : numero 
    terminados : numero
  comenzar
    terminados := 0
    mientras (terminados < 3)
      RecibirMensaje(id, *)
      si (id = 1)
        RecibirMensaje(N, c1)
        si (N = 0)
          terminados := terminados + 1
        sino
          RecibirMensaje(Av, c1)
          RecibirMensaje(Ca, c1)
          depositarFloresServer(Av, Ca, N)
          EnviarMensaje(0, c1)
      sino
        si (id = 2)
          RecibirMensaje(N, c2)
          si (N = 0)
            terminados := terminados + 1
          sino
            RecibirMensaje(Av, c2)
            RecibirMensaje(Ca, c2)
            depositarFloresServer(Av, Ca, N)
            EnviarMensaje(0, c2)
        sino
          RecibirMensaje(N, c3)
          si (N = 0)
            terminados := terminados + 1
          sino
            RecibirMensaje(Av, c3)
            RecibirMensaje(Ca, c3)
            depositarFloresServer(Av, Ca, N)
            EnviarMensaje(0, c3)
  fin
  robot cliente
  variables
    randFlores, id, avSig, caSig, caPre, avPre, ACK : numero
  comenzar
    id := PosAv
    mientras (PosCa < 100)
      Random(randFlores,1,4)
      EnviarMensaje(id, servidor)
      EnviarMensaje(randFlores, servidor)
      avSig := PosAv
      caSig := PosCa + 1
      EnviarMensaje(avSig, servidor)
      EnviarMensaje(caSig, servidor)
      RecibirMensaje(ACK, servidor)
      avPre := PosAv
      caPre := PosCa
      Pos(avSig, caSig)
      mientras HayFlorEnLaEsquina
        tomarFlor
      Pos(avPre, caPre)
      mientras (HayFlorEnLaBolsa) & (PosCa < 100)
        depositarFlor
        mover
      si (PosCa = 100)
        EnviarMensaje(id,servidor)
        EnviarMensaje(0, servidor)
  fin
variables
  servidor: server
  c1:cliente
  c2:cliente
  c3:cliente
comenzar
  AsignarArea(servidor,AreaServer)
  AsignarArea(servidor,Av1)
  AsignarArea(servidor,Av2)
  AsignarArea(servidor,Av3)
  AsignarArea(c1,Av1)
  AsignarArea(c2,Av2)
  AsignarArea(c3,Av3)
  Iniciar(servidor, 100, 100)
  Iniciar(c1, 1, 1)
  Iniciar(c2, 2, 1)
  Iniciar(c3, 3, 1)
fin