programa heaven
procesos
  proceso hacerEscaleraFlores (E large:numero; ES flores:numero)
  comenzar
    walk(large)
    juntarFlores(flores)
    derecha
    walk(large)
    izquierda
  fin
  proceso hacerEscaleraPapeles (E large:numero; ES papeles:numero)
  comenzar
    walk(large)
    juntarPapeles(papeles)
    izquierda
    walk(large)
    derecha
  fin
  proceso walk(E i:numero)
  comenzar
    repetir i
      mover
  fin
  proceso izquierda
  comenzar
    derecha
    derecha
    derecha
  fin
  proceso juntarFlores(ES flores:numero)
  comenzar
    mientras (HayFlorEnLaEsquina)
      tomarFlor
      flores := flores + 1
  fin
  proceso juntarPapeles(ES papeles:numero)
  comenzar
    mientras (HayPapelEnLaEsquina)
      tomarPapel
      papeles := papeles + 1
  fin
areas
  ciudad : AreaC(1,1,100,100)
robots
  robot robot1
  variables
    n, av, ca flores : numero
  comenzar
    n := 5
    flores := 0
    repetir 5
      hacerEscaleraFlores(n, flores)
      n := n - 1
    Informar(PosAv, PosCa)
    BloquearEsquina(PosAv, PosCa)
    av := PosAv
    ca := PosCa
    izquierda
    mover
    LiberarEsquina(av, ca)
    n := 2
    repetir 4
      hacerEscaleraFlores(n, flores)
      n := n + 1
  fin
  robot robot2
  variables
    n, av, ca papeles : numero
  comenzar
    n := 5
    papeles := 0
    repetir 5
      hacerEscaleraPapeles(n, papeles)
      n := n - 1
    Informar(PosAv, PosCa)
    BloquearEsquina(PosAv, PosCa)
    av := PosAv
    ca := PosCa
    derecha
    mover
    LiberarEsquina(av, ca)
    n := 2
    repetir 4
      hacerEscaleraPapeles(n, papeles)
      n := n + 1
  fin
  robot boss
  comenzar
    mover
  fin
variables
  r1 : robot1
  r2 : robot2
  jefe : boss
comenzar
  AsignarArea(r1, ciudad)
  AsignarArea(r2, ciudad)
  AsignarArea(jefe, ciudad)
  Iniciar(r1,1,1)
  Iniciar(r2,31,1)
  Iniciar(jefe,15,1)
fin
