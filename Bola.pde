class Bola{
  ArrayList<Bola> piqui= new ArrayList<Bola>();
  float posx,posy,vx,vy,ax,ay;
  float tamano,friccion=-0.8;
  int iterador,imagen;
  
  Bola(float posX,float posY,float tama,int i,ArrayList<Bola> b,int image){
    posx=posX;
    posy=posY;
    tamano=tama;
    iterador=i;
    piqui=b;
    imagen=image;
  }
  
  Bola(float posX,float posY,float tama,ArrayList<Bola> b,int image){
    posx=posX;
    posy=posY;
    tamano=tama;
    piqui=b;
    imagen=image;
  }
  
 int getimagen(){
   return imagen;
 }
 void setimagen(int i){
   imagen=i;
 }
 
 float getpx(){
   return posx;
 }
 float getpy(){
   return posy;
 }
 float getvx(){
   return vx;
 }
 float getvy(){
   return vy;
 }
 void setpx(float Px){
   posx=Px;
 }
 void setpy(float Py){
   posy=Py;
 }
 void setvx(float Vx){
   vx=Vx;
 }
 void setvy(float Vy){
   vy=Vy;
 }
 
 
 void mover(){
    posx += vx;
    posy += vy;
    if (posx + tamano > width) {
      posx = width - tamano;
      vx *= friccion; 
    }
    else if (posx - tamano < 0) {
      posx = tamano;
      vx *= friccion;
    }
    if (posy + tamano > height) {
      posy = height - tamano;
      vy *= friccion; 
    } 
    else if (posy - tamano < 0) {
      posy = tamano;
      vy *= friccion;
    }
    if(vx>-0.1 && vx<0.1 && vy>-0.1 && vy<0.1){
      vx=0;
      vy=0;
    }else{
      if(vx>0 ){
        vx+=desac;
      }else{
        vx-=desac;
      }
      if(vy>0 ){
        vy+=desac;
      }else{
        vy-=desac;
      }
    }
 }
 
 void collide() {
    for (int i = iterador + 1; i < numPiquis; i++) {
      float dx = piqui.get(i).getpx() - posx;
      float dy = piqui.get(i).getpy() - posy;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = piqui.get(i).tamano + tamano;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = posx + cos(angle) * minDist;
        float targetY = posy + sin(angle) * minDist;
        float ax = (targetX - piqui.get(i).posx) * rebote;
        float ay = (targetY - piqui.get(i).posy) * rebote;
        vx -= ax;
        vy -= ay;
        piqui.get(i).vx += ax;
        piqui.get(i).vy += ay;
        colicionandoP+=1;
      }
      /*if(colicionandoP>0){
        colicionando=true;
      }else if(colicionandoP==0){
        colicionando=false;
      }
      //println(colicionando);
      colicionandoP=0;*/
    }   
  }
   void collideN() {
    for (int i = 0; i < numPiquis; i++) {
      float dx = piqui.get(i).getpx() - posx;
      float dy = piqui.get(i).getpy() - posy;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = piqui.get(i).tamano + tamano;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = posx + cos(angle) * minDist;
        float targetY = posy + sin(angle) * minDist;
        float ax = (targetX - piqui.get(i).posx) * rebote;
        float ay = (targetY - piqui.get(i).posy) * rebote;
        vx -= ax;
        vy -= ay;
        piqui.get(i).vx += ax;
        piqui.get(i).vy += ay;
      }
    }   
  }
 color r = color(0,255,0);
 void Graficar(){
   
   Circulo c= new Circulo(int(posx),int(posy),int(tamano),imagen);
   //c.setColorR(r);
   c.Graficar();
 }
 void Graficarb(){
   
   Circulo c= new Circulo(int(posx),int(posy),int(tamano),imagen);
   c.setColorR(r);
   c.Graficar();
 }
 
 
 
 
 
 
 
 
 
}
