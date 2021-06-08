class Poligon2{
  ArrayList<Vertice> vertices = new ArrayList<Vertice>();
  ArrayList<Vertice> bordes = new ArrayList<Vertice>();
  ArrayList<Lineaa> lineas = new ArrayList<Lineaa>();
  color c= color(0,0,0);
  
  Poligon2(ArrayList<Vertice> v){
    
    vertices=v;
    
    for(int i=0;i<vertices.size()-1;i++){
      Lineaa l=new Lineaa(int(vertices.get(i).getx()),int(vertices.get(i).gety()),int(vertices.get(i+1).getx()),int(vertices.get(i+1).gety()));
          lineas.add(l);
    }
    Lineaa l= new Lineaa(int(vertices.get(vertices.size()-1).getx()),int(vertices.get(vertices.size()-1).gety()),int(vertices.get(0).getx()),int(vertices.get(0).gety()));
    lineas.add(l);
    
    for(int i=0;i<lineas.size();i++){
      for(int j=0; j<lineas.get(i).borde.size();j++){
        bordes.add(lineas.get(i).borde.get(j));
      }
    }
    
  }
  
  void setColorB(color a){
    c=a;
  }
  
  
  float Max(){
    float mayor=0;
    for(int i=0;i<vertices.size();i++){
      if(vertices.get(i).gety() > mayor){
        mayor=vertices.get(i).gety();
      }
    }
    return mayor;
  }
  
  float Maxx(){
    float mayor=0;
    for(int i=0;i<vertices.size();i++){
      if(vertices.get(i).getx() > mayor){
        mayor=vertices.get(i).getx();
      }
    }
    return mayor;
  }
  
  float Min(){
    float menor=5000000;
    for(int i=0;i<vertices.size();i++){
      if(vertices.get(i).gety() < menor){
        menor=vertices.get(i).gety();
      }
    }
    return menor;
  }
  
  float Minx(){
    float menor=5000000;
    for(int i=0;i<vertices.size();i++){
      if(vertices.get(i).getx() < menor){
        menor=vertices.get(i).getx();
      }
    }
    return menor;
  }
  
  void Graficar(){
    //println(bordes.size());
    for (int i = 0; i < vertices.size(); i++) {
      if(i+1!=vertices.size()){
        Vertice vaux=vertices.get(i);
        Vertice vaux2=vertices.get(i+1);
        Lineaa l = new Lineaa(int(vaux.getx()),int(vaux.gety()),int(vaux2.getx()),int(vaux2.gety()));
        l.setColor(c);
        l.Graficar();   
        
      }else{
        Vertice vaux=vertices.get(i);
        Vertice vaux2=vertices.get(0);
        Lineaa l = new Lineaa(int(vaux.getx()),int(vaux.gety()),int(vaux2.getx()),int(vaux2.gety()));
        l.setColor(c);
        l.Graficar();
      }
      }
  }
  
  boolean verificarV(Vertice v){
    boolean pintar=false;
    for(int i=0;i<vertices.size();i++){
       if(vertices.get(i).getx()==v.getx() && vertices.get(i).gety()==v.gety()){
         pintar=true;
         break;
       }else{
         pintar=false;
       }
    }
    return pintar;
  }
  
  boolean verificarB(Vertice p){
    boolean pintar=false;
    for(int i=0;i<bordes.size();i++){
       if(bordes.get(i).getx()==p.getx() && bordes.get(i).gety()==p.gety()){
         pintar=true;
         break;
       }else{
         pintar=false;
       }
    }
    return pintar;
  }
  
    Vertice UltimoPuntoEnLinea(int Yactual){
    
    int xMayor=0;
    for(int i=0;i<bordes.size();i++){
      if(bordes.get(i).gety() == Yactual){
        if(bordes.get(i).getx() >= xMayor){
          xMayor=int(bordes.get(i).getx());
        }
      }
    }
    return new Vertice(xMayor,Yactual);
  }
  
  
  void Rellenar(color a){

    boolean pintar=false;
    for(int y=0;y<height;y++){
      pintar=false;
       for(int x=0;x<width;x++){
         
         if(verificarV(new Vertice(int(x),int(y)))==true){
           pintar=false;
         }
         if(verificarB(new Vertice(int(x),int(y)))==true && verificarB(new Vertice(int(x+1),int(y)))==true){
             pintar=false;
         }
         if(verificarB(new Vertice(int(x),int(y)))==true && verificarB(new Vertice(int(x+1),int(y)))==false ){
           pintar=!pintar;
         }
         if(pintar==true && verificarB(new Vertice(int(x),int(y)))==false && x<=UltimoPuntoEnLinea(int(y)).getx()){
           stroke(a);
           point(x,y);
         }
        
       }
    }
  }
  void Relleno2(int t_x,int t_y,color r){
    int x=t_x;
    int y=t_y;
    color Relleno=r;
    color colorAnt  = get(x,y);
    FlodFill(x,y,Relleno,colorAnt);
  }
  
  void FlodFill(int x, int y, color relleno, color anterior){
    
    if(x<0){
      return;
    }
    if(y<0){
      return;
    }
    if(x>width){
      return;
    }
    if(y>height){
      return;
    }
    
    if(get(x,y) != anterior){
      return;
    }
    stroke(relleno);
    point(x,y);
    
    FlodFill(x+1, y, relleno, anterior);
    FlodFill(x-1, y,  relleno, anterior);      
    FlodFill(x, y+1,  relleno, anterior);
    FlodFill(x, y-1,  relleno, anterior);
    
  }
}
