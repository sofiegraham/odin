# Your code here
def prime?(n)
    prime = true
    if n > 3
        (2...n).each do |x|
            if n % x == 0
                prime = false
            end
        end
    elsif n < 2
        prime = false
    else
        prime = true
    end
    return prime
end