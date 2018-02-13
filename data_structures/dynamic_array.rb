#https://www.hackerrank.com/challenges/dynamic-array/problem
#completed Oct 2017

# Enter your code here. Read input from STDIN. Print output to STDOUT

n_q = gets.strip.split(' ').map{|x| x.to_i}
lastAnswer = 0

seqList = []
for i in 0...n_q[0]
    seqList << []
end

arr = []
for i in 0...n_q[1]
    arr << gets.strip.split(' ').map{|x| x.to_i}
end

arr.each do |seq|
    pos = (seq[1] ^ lastAnswer) % n_q[0]
    if seq[0] == 1
        seqList[pos] << seq[2]
    else
        seqPos = seq[2] % seqList[pos].length
        lastAnswer = seqList[pos][seqPos]
        puts lastAnswer
    end
end


