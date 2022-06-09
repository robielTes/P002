require_relative 'WordSearchTree'
tree = WordSearchTree.new

require 'benchmark'

smallArrayQueue = ArrayQueue.new
smallListQueue = ListQueue.new

largeArrayQueue = ArrayQueue.new
largeListQueue = ListQueue.new

def fillQueue(queue, size)
    size.times do
        queue.enqueue(rand(10000))
    end
end


Benchmark.bmbm  do |x|
    x.report("smallArrayQueue") do
        fillQueue(smallArrayQueue, 100)
    end           
    x.report("smallListQueue") do
        fillQueue(smallListQueue, 100)
    end
    x.report("largeArrayQueue") do
        fillQueue(largeArrayQueue, 100000)
    end       
    x.report("largeListQueue") do
        fillQueue(largeListQueue,100000)
    end    
end


