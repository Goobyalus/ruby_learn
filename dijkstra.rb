require 'priority_queue'

q = PriorityQueue.new
nodes = {}
visited = {}
unvisited = {}
dist = {}



def dijkstra(graph, source)

	#initialize distances to infinity
	for node in graph
	
		if node == source
			dist[node] = 0.0
		else
			dist[node] = Float::Infiniity
		end
	
		q[node] = dist[node]
	end
	
	#bf
	while 
	

end
