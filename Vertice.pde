class Vertice{
  
  private float x,y;
  
  Vertice(){
    x=0;
    y=0;
  }
  
  Vertice(int t_x,int t_y){
    x=t_x;
    y=t_y;
  }
  
  float getx(){
    return x;
  }
  float gety(){
    return y;
  }
  void setx(int t_x){
    x=t_x;
  }
  void sety(int t_y){
    y=t_y;
  }
  void setVertice(int t_x,int t_y){
    x=t_x;
    y=t_y;
  }

}
