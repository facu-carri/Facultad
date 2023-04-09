programa practica4
procesos
  proceso juntarFlores(ES f:numero; E av:numero ; E ca:numero)
  variables
    rAv,rCa,f:numero 
  comenzar
    Random(rAv,1,5)
    Random(rCa,1,10)
    BloquearEsquina(rAv,rCa)
    Pos(rAv,rCa)
    mientras HayFlorEnLaEsquina
      f:=f+1
      tomarFlor
    Pos(av,ca)
    LiberarEsquina(rAv,rCa)
  fin
  proceso juntarPapeles(ES p:numero; E av:numero; E ca:numero)
  variables
    rAv,rCa,f:numero 
  comenzar
    Random(rAv,6,10)
    Random(rCa,1,9)
    BloquearEsquina(rAv,rCa)
    Pos(rAv,rCa)
    mientras HayPapelEnLaEsquina
      p:=p+1
      tomarPapel
    Pos(av,ca)
    LiberarEsquina(rAv,rCa)
  fin
areas
  floreros:AreaPC(1,1,5,10)
  area1:AreaPC(6,10,7,10)
  papeleros:AreaPC(6,1,10,9)
  area2:AreaPC(8,10,9,10)
  area10:AreaC(10,10,10,10)
robots
  robot tipo1
  variables
    f,av,ca:numero
  comenzar
    f:=0
    av:=PosAv
    ca:=PosCa
    repetir 5
      juntarFlores(f,av,ca)
    BloquearEsquina(10,10)
    Pos(10,10)
    repetir f
      depositarFlor
    Pos(av,ca)
    LiberarEsquina(10,10)
  fin
  robot tipo2
  variables
    p,av,ca:numero
  comenzar
    p:=0
    av:=PosAv
    ca:=PosCa
    repetir 5
      juntarPapeles(p, av, ca)    
    BloquearEsquina(10,10)
    Pos(10,10)
    repetir p
      depositarPapel
    Pos(av,ca)
    LiberarEsquina(10,10)
  fin
variables
  f1:tipo1
  f2:tipo1
  p1:tipo2
  p2:tipo2
comenzar
  AsignarArea(f1,floreros)
  AsignarArea(f1,area1)
  AsignarArea(f1,area10)
  AsignarArea(f2,floreros)
  AsignarArea(f2,area1)
  AsignarArea(f2,area10)
  AsignarArea(p1,papeleros)
  AsignarArea(p1,area2)
  AsignarArea(p1,area10)
  AsignarArea(p2,papeleros)
  AsignarArea(p2,area2)
  AsignarArea(p2,area10)
  Iniciar(f1,6,10)
  Iniciar(f2,7,10)
  Iniciar(p1,8,10)
  Iniciar(p2,9,10)
fin
