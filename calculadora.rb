class Calculator
  
  class << self
    def calculate(calculation)
      whatToCalculate = calculation.split(/([+\-\/\*])/)
      index = 0

      while index < whatToCalculate.size 
        value = whatToCalculate[index]
        
        if(value == '+')
          whatToCalculate[index+1] = sum(whatToCalculate[index-1],whatToCalculate[index+1])
          whatToCalculate.shift(2)
          index -= 2
        elsif(value == '-')
          whatToCalculate[index+1] = subtraction(whatToCalculate[index-1],whatToCalculate[index+1])
          whatToCalculate.shift(2)
          index -= 2
        elsif(value == '/')
          whatToCalculate[index+1] = division(whatToCalculate[index-1],whatToCalculate[index+1])
          whatToCalculate.shift(2)
          index -= 2
        elsif(value == '*')
          whatToCalculate[index+1] = multiplication(whatToCalculate[index-1],whatToCalculate[index+1])
          whatToCalculate.shift(2)
          index -= 2
        end

        index+=1
      end
      
      return whatToCalculate
    end

    def sum(a,b)
      a.to_f+b.to_f
    end

    def subtraction(a,b)
      a.to_f-b.to_f
    end

    def division(a,b)
      a.to_f/b.to_f
    end

    def multiplication(a,b)
      a.to_f*b.to_f
    end
  end



end


puts Calculator.calculate("4*2/2")