import javax.swing.JOptionPane; 

int areaJuego=300,auxc=0,conteoafuera=0;

Circulo areaDjuego=new Circulo(width/2,height/2,areaJuego,0);

String apostada1,lanza1;
int apostadas1,apostadas2,lanzar1,lanzar2,rescatadas1=0,rescatadas2=0;

PImage piqui;
PImage piqui2;
PImage pantallaInicio;
PImage instrucciones;
PImage pantallajuego;
PImage ganarj;
PImage empate;
PImage boton1;
PImage boton2;


int turno;
int estado=0;
float Velx,vely,acelx,acely;
float rebote=0.5, tamano=15;

int numPiquis;
ArrayList<Vertice> boton=new ArrayList<Vertice>(); 
ArrayList<Bola> piquisT= new ArrayList<Bola>();
ArrayList<Bola> piquisP1= new ArrayList<Bola>();
ArrayList<Bola> piquisP2= new ArrayList<Bola>();
Bola b= new Bola(0, 0,tamano, piquisT,0);
float desac=-0.1;
int contclick=0;

boolean VerificarD=false;
boolean aux=true;
boolean colicionando=false;
int colicionandoP=0;
boolean ganar=true;
boolean detenido =false;
boolean verificacion = true;
boolean PrimeraVez=true;
boolean lanzamiento=false;
boolean lanzar= false;
boolean vel=false;

float auxvx,auxvy,auxposx,auxposy,auxposx2,auxposy2;
int contvel=0;

void setup(){
  textAlign(CENTER, CENTER);
  textSize(64);
  background(200);
  size(1000,700);
  piqui = loadImage("bola 2.png");
  piqui2 = loadImage("Bola 1.png");
  pantallaInicio=loadImage("Pantalla de inicio_Mesa de trabajo 1.png");
  instrucciones=loadImage("Pantalla de reglas.png");;
  pantallajuego=loadImage("Pantalla de juego_Mesa de trabajo 1.png");
  boton1=loadImage("Start buton_Mesa de trabajo 1.png");
  boton2=loadImage("Jugar Buton_Mesa de trabajo 1.png");
  ganarj=loadImage("Pantalla de Ganaste.png");
  empate=loadImage("Pantalla de empate.png");
  frameRate(30);
}

void draw(){
  background(128);
  
  switch(estado){
    case 0:
      image(pantallaInicio,0,0);
      //text("PANTALLA DE INICIO", width/2, height/2);
      image(boton1,100,550);
      boton();
      break;
    case 1:
    image(instrucciones,0,0);
      //text("INSTRUCCIONES", width/2, height/2);
      image(boton2,100,550);
      boton();
      break;
    case 2:
    
    image(pantallajuego,0,0);
    
    Circulo areaDjuego=new Circulo(width/2,height/2,areaJuego,0);
    areaDjuego.Graficar();
    
    textAlign(LEFT);
    textSize(32);
    //text("Jugador 1",30, 40);
    textSize(16);
    text("Piquis rescatadas: ", 30, 60);
    text(rescatadas1, 180, 60);
    //text("Piquis para lanzar: ", 30, 80);
    //text(lanzar1, 180, 80);
         
    textAlign(RIGHT);
    textSize(32);
    //text("Jugador 2",970, 40);
    textSize(16);
    text("Piquis rescatadas: ", 950, 60);
    text(rescatadas2, 970, 60);
    //text("Piquis para lanzar: ", 950, 80);
    //text(lanzar2, 970, 80);
    
    if(aux==true){
      apostada1 = JOptionPane.showInputDialog(null,"Numero de piquis para apostar : ","0"); 
      //lanza1 = JOptionPane.showInputDialog(null,"Numero de piquis a lanzar : ", "0"); 
      apostadas1=parseInt(apostada1);
      apostadas2=apostadas1;
      //lanzar1=parseInt(lanza1);
      //lanzar2=lanzar1;
      numPiquis=apostadas1*2;
      turno=1;
      InicializarJuego();
      aux=false;
      
    }
      if(PrimeraVez==true){
        
        
        for(int i=0;i<numPiquis;i++){
            piquisT.get(i).collide();
            
            //println(colicionando);
            if(colicionandoP>0){
            colicionando=true;
            }else if(colicionandoP==0){
            colicionando=false;
            }
            
            if(colicionando==true){
              piquisT.get(i).mover();
            }
            piquisT.get(i).Graficar();
            //println(colicionando);
            colicionandoP=0;
          }
          
          auxc++;
          if(auxc==24){
            for(int i=0;i<numPiquis;i++){
              piquisT.get(i).setvx(0);
              piquisT.get(i).setvy(0);
            }
            PrimeraVez=false;
            ganar=false;
          }
          
      }
    if(ganar == false){
       switch(turno){
         
         case 1:
         
         textAlign(CENTER);
         textSize(32);
         text("<<<<<-TURNO",width/2, 30);
         
          for(int i=0;i<numPiquis;i++){
            piquisT.get(i).collide();
            piquisT.get(i).mover();
            piquisT.get(i).Graficar();
          }
        
          /*if(detenido==false && lanzamiento==false){
            for(int i=0;i<numPiquis;i++){
              if(piquisT.get(i).getvx()==0 && piquisT.get(i).getvy()==0){
                if(contvel==numPiquis){
                  break;
                }
                contvel+=1;
              }else{
                contvel=0;
                break;
              }
            }
          }  
        
          if (contvel==numPiquis){
            detenido=true;
            contvel=0;
            println(detenido);
          }*/
          if(VerificarD==false){
            VerificarDetenido();
            println(detenido);
            VerificarD=true;
          }
          if(detenido == true && lanzamiento ==false){
            b.setpx(mouseX);
            b.setpy(mouseY);
            b.setimagen(1);
            b.Graficar();
          }
          if(lanzamiento == true && detenido==true){
            b.setpx(auxposx);
            b.setpy(auxposy);
            b.setimagen(1);
            b.Graficar();
            if((pow(mouseX-auxposx,2)+pow(mouseY-auxposy,2)) <= pow(150,2)){
              Lineaa apuntador = new Lineaa(int(auxposx), int(auxposy),mouseX, mouseY);
              apuntador.setColor(255);
              apuntador.Graficar();
              Circulo limite= new Circulo(int(auxposx),int(auxposy),150,0);
              limite.Graficar();
              //stroke(0);
            }
          }
           if(lanzamiento == true && detenido==false && contclick==2){
              if (lanzar==true){
                enviarVel();
                lanzar=false;
              }
              b.collideN();
              b.mover();
              b.Graficar();
              VerificarDetenido();
              //println(contvel);
              
         }
         if(detenido==true && lanzamiento==true && contclick==2){
                lanzamiento=false;
                contclick=0;
                VerificarD=false;
                ComprobarPiquis();
                turno=2;
                //println(turno);
         }
         
         
        break;
        case 2:
        
        textAlign(CENTER);
        textSize(32);
        text("TURNO->>>>>",width/2, 30);
         
        for(int i=0;i<numPiquis;i++){
            piquisT.get(i).collide();
            piquisT.get(i).mover();
            piquisT.get(i).Graficar();
          }
        
          /*if(detenido==false && lanzamiento==false){
            for(int i=0;i<numPiquis;i++){
              if(piquisT.get(i).getvx()==0 && piquisT.get(i).getvy()==0){
                if(contvel==numPiquis){
                  break;
                }
                contvel+=1;
              }else{
                contvel=0;
                break;
              }
            }
          }  
        
          if (contvel==numPiquis){
            detenido=true;
            contvel=0;
            println(detenido);
          }*/
          
          if(VerificarD==false){
            VerificarDetenido();
            println(detenido);
            VerificarD=true;
          }
          
          if(detenido == true && lanzamiento ==false){
            b.setpx(mouseX);
            b.setpy(mouseY);
            b.setimagen(2);
            b.Graficar();
          }
          if(lanzamiento == true && detenido==true){
            b.setpx(auxposx);
            b.setpy(auxposy);
            b.setimagen(2);
            b.Graficar();
            if((pow(mouseX-auxposx,2)+pow(mouseY-auxposy,2)) <= pow(150,2)){
              //stroke(255);
              Lineaa apuntador = new Lineaa(int(auxposx), int(auxposy),mouseX, mouseY);
              apuntador.setColor(255);
              apuntador.Graficar();
              Circulo limite= new Circulo(int(auxposx),int(auxposy),150,0);
              limite.Graficar();
              //stroke(0);
            }

          }
           if(lanzamiento == true && detenido==false && contclick==2){
              if (lanzar==true){
                enviarVel();
                lanzar=false;
              }
              b.collideN();
              b.mover();
              b.Graficar();
              VerificarDetenido();
              //println(contvel);
              
         }
         if(detenido==true && lanzamiento==true && contclick==2){
                lanzamiento=false;
                contclick=0;
                VerificarD=false;
                ComprobarPiquis();
                turno=1;
                //println(turno);
         }
         if(numPiquis==0){
           estado++;
         }
        break;
      }
    }

      break;
    case 3:
    textSize(64);
    if(rescatadas1>rescatadas2){
      image(ganarj,0,0);
      image(boton1,100,550);
      //text("GANO JUGADOR 1", width/2, height/2);
    }
    else if(rescatadas2>rescatadas1){
      image(ganarj,0,0);
      image(boton1,100,550);
      //text("GANO JUGADOR 2", width/2, height/2);
    }else if(rescatadas1==rescatadas2){
      image(empate,0,0);
      image(boton1,100,550);
      //text("EMPATE", width/2, height/2);
    }
    
    PrimeraVez=true;
    aux=true;
    ganar=true;
    boton();
    break;
  }
}

boolean VerificarDetenido(){
   //if(detenido==false && lanzamiento==false){
            for(int i=0;i<numPiquis;i++){
              if(piquisT.get(i).getvx()==0 && piquisT.get(i).getvy()==0){
                if(contvel==numPiquis){
                  break;
                }
                contvel+=1;
              }else{
                contvel=0;
                break;
              }
              //println(contvel);
            }
          //}  
        
          if (contvel==numPiquis && b.getvx()==0 && b.getvy()==0){
            contvel=0;
            return detenido=true;
          }else{
            contvel=0;
            return detenido=false;
          }
}


void boton(){
  boton.clear();
  boton.add(new Vertice(100,550));
  boton.add(new Vertice(100,650));
  boton.add(new Vertice(300,650));
  boton.add(new Vertice(300,550));
  Poligon2 p=new Poligon2(boton);
  p.Graficar();
  
  
}

void ComprobarPiquis(){
  for(int i =0;i<numPiquis;i++){
    if((pow(piquisT.get(i).getpx()-(width/2),2)+pow(piquisT.get(i).getpy()-(height/2),2)) >= pow(areaJuego,2)){
      if(turno==1){
        rescatadas1+=1;
      }else if(turno==2){
        rescatadas2+=1;
      }
      piquisT.remove(i);
      numPiquis-=1;
    }
  }
  //println(conteoafuera);
  //conteoafuera=0;
}
void mousePressed(){
  
  /*if(detenido && lanzamiento){
    auxposx=mouseX;
    auxposy=mouseY;
    
  }*/
}

void InicializarJuego(){
  
  for (int i = 0; i < apostadas1; i++) {
    float r1=random(300,700);
    float r2=random(140,570);
    
    Bola p =new Bola(r1, r2,tamano, 2*i, piquisT,1);
    
    //piquisP1.get(i).setvx(r1);
    //piquisP1.get(i).setvy(r2);
    
    float r3=random(300,700);
    float r4=random(140,570);
    Bola p2 =new Bola(r3, r4,tamano, (2*i)+1, piquisT,2);
    
    piquisP1.add(p);
    piquisP2.add(p2);
    piquisT.add(p);
    piquisT.add(p2);
   
  }
  strokeWeight(1);
} 
void enviarVel(){
  b.setvx(auxvx);
  b.setvy(auxvy);
}

void mouseClicked(){
  
  
  if(verificacion==true){
    if(mouseX>100 && mouseX<300 && mouseY>550 && mouseY<650){
        if(estado==2){
          verificacion=false;
        }
        else if(estado==0 || estado==1){
          estado++;
        }
        if (estado==3){
          estado=0;
        }
    }
  }
  if(lanzamiento == true && detenido==true ){
    if((pow(mouseX-auxposx,2)+pow(mouseY-auxposy,2)) <= pow(150,2)){
            auxposx2=mouseX;
            auxposy2=mouseY;
            b.setpx(auxposx);
            b.setpy(auxposy);
            b.Graficar();
            stroke(255);
            Lineaa apuntador = new Lineaa(int(auxposx), int(auxposy),mouseX, mouseY);
            apuntador.Graficar();
            stroke(0);
            detenido=false;
            lanzar=true;
            contclick+=1;
            auxvx=(auxposx2-auxposx)/5;
            auxvy=(auxposy2-auxposy)/5;
            println(contclick); 
    }
            
  }
  if( detenido==true && lanzamiento ==false){
    if((pow(mouseX-(width/2),2)+pow(mouseY-(height/2),2)) >= pow(areaJuego+tamano,2)){
            lanzamiento=true;
            auxposx=mouseX;
            auxposy=mouseY;
            contclick+=1;
            println(contclick); 
          }
  }
  
  
}
