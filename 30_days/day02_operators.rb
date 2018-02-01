#https://www.hackerrank.com/challenges/30-operators/problem

def get_total_cost_of_meal()
    # original meal price
    meal_cost = gets.to_f
    # tip percentage
    tip_percent = gets.to_i
    # tax percentage
    tax_percent = gets.to_i

    # Write your calculation code here
    tip = meal_cost*tip_percent/100# calculate tip
    tax = meal_cost*tax_percent/100# caclulate tax

    # cast the result of the rounding operation to an int and save it as total_cost 
    total_cost = (meal_cost + tip + tax).round.to_i
    
    return total_cost
end

# Print your result
print("The total meal cost is ", get_total_cost_of_meal(), " dollars.")
