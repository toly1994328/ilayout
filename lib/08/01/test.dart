main(){
  int min=10;
  int max=15;
  print(6.clamp(min, max)); // 10
  print(9.clamp(min, max)); // 10
  print(14.clamp(min, max)); // 14
  print(16.clamp(min, max)); // 15
  print(18.clamp(min, max)); // 15
}