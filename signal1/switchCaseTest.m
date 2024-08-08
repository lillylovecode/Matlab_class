while true
  x = input("please choose 1(BMI) or 2(sum 1 to 100)?");
  switch x
     case 1
          w=input("Enter your weight in kg:");
          h=input("Enter your height in cm:");
          BMI= (w/((h/100)^2)) %kg/m^2
     case 2
        sum = 0;
        for i = 1:100
          sum = sum+i;
        endfor
        sum
     otherwise
        disp('please key in 1 or 2')
  end
end
