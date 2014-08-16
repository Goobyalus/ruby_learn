


#graph represented as hash{string => hash{string => ?}}


def dijkstra(graph, source)
	dist = {}
	dist[source] = 0
	
	queue = [source]
	prev = {}
	
	for v in (graph.keys)-queue
		dist[v] = Float::INFINITY
		prev[v] = nil
		queue.push(v)
	end

	while not queue.empty?
		queue.sort_by!{|o| dist[o]}
		u = queue.delete_at(0)
		
		for v in graph[u].keys
			alt = dist[u] + graph[u][v]
			if nil == alt then alt = Float::INFINITY end
			
			if alt < dist[v]
				dist[v] = alt
				prev[v] = u
			end
		end
	end
	
	return [dist,prev]

end

print "\n"
print dijkstra({1=>{2=>1, 3=>2}, 2=>{3=>2, 4=>1}, 3=>{}, 4=>{}, 5=>{}}, 1)