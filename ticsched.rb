


loc_prop = [:inside, :outside]
loc = [:gym1, :gym2, :field1, :field2, :field3, :wrestling, :tennis]

loc_attr = {:gym1 => 		[:inside],
			:gym2 => 		[:inside],
			:gym3 => 		[:inside],
			:field1 => 		[:outside],
			:field2 => 		[:outside],
			:field3 => 		[:outside],
			:wrestling => 	[:outside],
			:tennis => 		[:outside]
}

class Counselor
	attr_accessor :id, :loc_hist
	
	def initialize(id, loc_hist = [])
		@id = id;
		@loc_hist = loc_hist
	end
	
	#[location, date] (?)
	#nil should be used to represent the absent
	def add_loc_entry(loc_entry)
		@loc_hist << loc_entry
	end
end






