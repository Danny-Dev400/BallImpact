class Lineaa{

  ArrayList<Vertice> borde;
  float m;
  float xk,yk,k,x,y;
  Vertice inicial;
  Vertice Final;
  Vertice v;
  int grosor;
  color c; 

  
  Lineaa( int xi, int yi, int xf, int yf){

    borde = new ArrayList<Vertice>();
    

    if(xi<=xf){
      inicial= new Vertice(xi,yi);
      Final = new Vertice(xf,yf);  
    }
    else if(xi>xf){
      inicial= new Vertice(xf,yf);
      Final = new Vertice(xi,yi);
    }
    
    ObtenerBordes();
    
    grosor=1;
    c=0;
    
    
  }
  
  
  Vertice getVi(){
    return inicial;
  }
  Vertice getVf(){
    return Final;
  }
  int getGrosor(){
   return grosor;
  }
  void setVi(Vertice vi){
    inicial=vi;
  }
  void setVf(Vertice vf){
    Final=vf;
  }
  void setGrosor(int g){
    grosor=g;
  }
  color getC(){
    return c;
  }
  void setColor(color a){
    c=a;
  }
  Vertice getAux(){
    return v;
  }

  
  void ObtenerBordes(){
    if(Final.getx()-inicial.getx()==0){
      if(Final.gety()>inicial.gety()){
        x=inicial.getx();
        for(k=inicial.gety();k<Final.gety();k++){
          Vertice v = new Vertice(int(x),int(k));          
          borde.add(v);
        }
      }else{
        x=inicial.getx();
        for(k=inicial.gety();k>Final.gety();k--){
          Vertice v = new Vertice(int(x),int(k));          
          borde.add(v);
        }
      }
      
    }else{
      m=(Final.gety()-inicial.gety())/(Final.getx()-inicial.getx());
      if(abs(m)<1){
        yk=inicial.gety();
        for(k=inicial.getx();k<=Final.getx();k++){
          x=k;
          y=yk+m;
          yk=y;
          Vertice v = new Vertice(int(x),int(y));          
          borde.add(v);
        }
      }else if(abs(m)>=1){
        xk=inicial.getx();
        if(inicial.gety() < Final.gety() && abs(m)>=1){
          for(k=inicial.gety();k<=Final.gety();k++){
            y=k;
            x=xk+(1/m);
            xk=x;
            Vertice v = new Vertice(int(x),int(y));          
            borde.add(v);
          }
        }else if(inicial.gety() > Final.gety() && abs(m)>=1){
          for(k=inicial.gety();k>=Final.gety();k--){
            y=k;
            x=xk+(1/m);
            xk=x;
            Vertice v = new Vertice(int(x),int(y));          
            borde.add(v);
          }
         }
      }
    }
  }
  
  
  
  void Graficar(){
    strokeWeight(5);
    if(Final.getx()-inicial.getx()==0){
      if(Final.gety()>inicial.gety()){
        x=inicial.getx();
        for(k=inicial.gety();k<Final.gety();k++){
          stroke(c);
          point(int(x),int(k));
        }
      }else{
        x=inicial.getx();
        for(k=inicial.gety();k>Final.gety();k--){
          stroke(c);
          point(int(x),int(k));
        }
      }
      
    }else{
      m=(Final.gety()-inicial.gety())/(Final.getx()-inicial.getx());
      if(abs(m)<1){
        yk=inicial.gety();
        for(k=inicial.getx();k<Final.getx();k++){
          x=k;
          y=yk+m;
          yk=y;
          stroke(c);
          point(int(x),int(y));
        }
      }else if(abs(m)>=1){
        xk=inicial.getx();
        if(inicial.gety() < Final.gety() && abs(m)>=1){
          for(k=inicial.gety();k<Final.gety();k++){
            y=k;
            x=xk+(1/m);
            xk=x;
            stroke(c);
            point(int(x),int(y));
          }
        }else if(inicial.gety() > Final.gety() && abs(m)>=1){
          for(k=inicial.gety();k>Final.gety();k--){
            y=k;
            x=xk+(1/m);
            xk=x;
            stroke(c);
            point(int(x+((inicial.getx()-x)*2)),int(y));
          }
         }
      }
    }
    strokeWeight(0);
  }


}
