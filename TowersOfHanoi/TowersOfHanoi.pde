

void setup() {
  towersOfHanoi(3,"pole1","pole3","pole2");
} 

void towersOfHanoi(int ndisc,String fromRod,String toRod,String middleRod) {
   if(ndisc==1) {
     println("Move disc "+ndisc+" from "+fromRod+" to "+toRod);
     return;
     
   } 
   towersOfHanoi(ndisc-1,fromRod,middleRod,toRod);
   println("Move disc "+ndisc+" from "+fromRod+" to "+toRod);
   towersOfHanoi(ndisc-1,middleRod,toRod,fromRod);
} 