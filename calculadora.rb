class Calculator
  
  class << self
    def calculate(calculation)
      whatToCalculate = calculation.split(/([+\-\/\*])/)
      index = 0

      secondPass = false
      operation = true

      while index < whatToCalculate.size 
        value = whatToCalculate[index]
        if(value == '+' and secondPass)
          whatToCalculate[index+1] = sum(whatToCalculate[index-1],whatToCalculate[index+1])
          operation = true
        elsif(value == '-' and secondPass)
          whatToCalculate[index+1] = subtraction(whatToCalculate[index-1],whatToCalculate[index+1])
          operation = true
        elsif(value == '/' and !secondPass)
          whatToCalculate[index+1] = division(whatToCalculate[index-1],whatToCalculate[index+1])
          operation = true
        elsif(value == '*' and !secondPass)
          whatToCalculate[index+1] = multiplication(whatToCalculate[index-1],whatToCalculate[index+1])
          operation = true
        else
          operation = false
        end
        if operation
          whatToCalculate.delete_at(index)
          whatToCalculate.delete_at(index-1)
          index -= 2
        end
        index+=1
        if index == whatToCalculate.size and !secondPass
          index = 0
          secondPass = true
        end
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


puts Calculator.calculate("1+2*2/4+1")