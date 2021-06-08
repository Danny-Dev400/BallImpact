

class Circulo{
  
  int x,y,xk,yk,r,xi,yi,xtemp,ytemp;
  float p0,pk,pk1;
  color cB,cR;
  int imagen1;
  
  Circulo(int t_xi,int t_yi ,int t_r, int image){
        
    imagen1=image;
    xi=t_xi;
    yi=t_yi;
    r=t_r;
    cB=0;
    cR=1000;
  }
  color getColorB(){
    return cB;
  }
  void setColorB(color a){
    cB=a;
  }
  color getColorR(){
    return cR;
  }
  void setColorR(color a){
    cR=a;
  }
  
  void Graficar(){
    if(xi==0 && yi==0){
      MPC(xi,yi,r,0,0);
    }else{
      xtemp=xi;
      ytemp=yi;
      xi=0;
      yi=0;
      MPC(xi,yi,r,xtemp,ytemp);
    }
    
  }

  void MPC(int xi, int yi, int r,int xtemp,int ytemp){
    stroke(255);
    if(cR==1000){
      stroke(cB);
      p0=(5/4)-r;
      pk=p0;
      xk=xi;
      yk=r;
      point(0+xtemp,r+ytemp);
      point(0+xtemp,-r+ytemp);
      point(r+xtemp,0+ytemp);
      point(-r+xtemp,0+ytemp);
      do{
        if(pk<0){
          pk1=pk+(2*(xk+1))+1;
          xk+=1;
          x=xk;
          y=yk;
          //print(x," ",y);
          stroke(cB);
          point(x+xtemp,y+ytemp);
          point(y+xtemp,x+ytemp);
          point(-x+xtemp,y+ytemp);
          point(-y+xtemp,x+ytemp);
          point(-x+xtemp,-y+ytemp);
          point(-y+xtemp,-x+ytemp);
          point(x+xtemp,-y+ytemp);
          point(y+xtemp,-x+ytemp);
          pk=pk1;
        }else if(pk>=0){
          pk1=pk+2*(xk+1)+1-2*(yk+1);
          xk+=1;
          x=xk;
          yk-=1;
          y=yk;
        //print(x," ",y);
          point(x+xtemp,y+ytemp);
          point(y+xtemp,x+ytemp);
          point(-x+xtemp,y+ytemp);
          point(-y+xtemp,x+ytemp);
          point(-x+xtemp,-y+ytemp);
          point(-y+xtemp,-x+ytemp);
          point(x+xtemp,-y+ytemp);
          point(y+xtemp,-x+ytemp);
          pk=pk1;
        }
        
      }while(x<=y);
      if(imagen1==1){
        
        //piqui.resize(40,40);
        image(piqui,xtemp-r,ytemp-r);
      }else if(imagen1==2){
        
        //piqui.resize(40,40);
        image(piqui2,xtemp-r,ytemp-r);
      }
    }else{
      for(int i= yi;i<r+yi;i++){
        if(i<r+yi-1){
        stroke(cR);
        }else{
        stroke(cB);
        }
        p0=(5/4)-i;
        pk=p0;
        xk=xi;
        yk=i;
        point(0+xtemp,i+ytemp);
        point(0+xtemp,-i+ytemp);
        point(i+xtemp,0+ytemp);
        point(-i+xtemp,0+ytemp);
        do{
          if(pk<0){
            pk1=pk+(2*(xk+1))+1;
            xk+=1;
            x=xk;
            y=yk;
            if(i<r+yi-1){
              stroke(cR);
            }else{
              stroke(cB);
            }
            point(x+xtemp,y+ytemp);
            point(y+xtemp,x+ytemp);
            point(-x+xtemp,y+ytemp);
            point(-y+xtemp,x+ytemp);
            point(-x+xtemp,-y+ytemp);
            point(-y+xtemp,-x+ytemp);
            point(x+xtemp,-y+ytemp);
            point(y+xtemp,-x+ytemp);
            pk=pk1;
          }else if(pk>=0){
            pk1=pk+2*(xk+1)+1-2*(yk+1);
            xk+=1;
            x=xk;
            yk-=1;
            y=yk;
            //print(x," ",y);
            point(x+xtemp,y+ytemp);
            point(y+xtemp,x+ytemp);
            point(-x+xtemp,y+ytemp);
            point(-y+xtemp,x+ytemp);
            point(-x+xtemp,-y+ytemp);
            point(-y+xtemp,-x+ytemp);
            point(x+xtemp,-y+ytemp);
            point(y+xtemp,-x+ytemp);
            pk=pk1;
          }
        }while(x<=y);
      }
    }
    
    
    stroke(0);
  }
  
}
