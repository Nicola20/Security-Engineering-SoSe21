package body Graph is

	procedure Add_Vertex(Vertex: Vertex_Type) is
	begin
		if Vertices.Find(Vertex) = Vertex_Vectors.No_Element then
			Ada.Text_IO.Put_Line("Added vertex");
			Vertices.Append(Vertex);
		else
			raise Vertex_Already_In_Graph_Exception;
		end if;

	exception
		when Vertex_Already_In_Graph_Exception =>
    		Ada.Text_IO.Put_Line("This vertex already exists inside the graph!");
    	when others =>
    		Ada.Text_IO.Put_Line("Unknown error!");
	end Add_Vertex;

	procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer) is
		New_Edge: Edge_Type := (From => From, To => To, Weight => Weight);
		Edge_Already_Exists: Boolean := False;
	begin
		if not Edges.Is_Empty then
			for E of Edges loop
				if E.From = From and E.To = To then
					Ada.Text_IO.Put_Line("Added New Weight to already existing edge");
					E.Weight := Weight;
					Edge_Already_Exists := True;
					exit;
				end if;
			end loop;
			if Edge_Already_Exists = False then
				Edges.Append(New_Edge);
				Ada.Text_IO.Put_Line("Added New Edge");
			end if;
		else
			Edges.Append(New_Edge);
			Ada.Text_IO.Put_Line("Added New Edge");
		end if;
	end Add_Edge;

	procedure Clear is
	begin
	-- Removes all vertices and edges from the graph.
		Vertices.Clear;
		Edges.Clear;
		Ada.Text_IO.Put_Line("Cleared all");
	end Clear;

	function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer is
	begin
	-- Returns the weight of the edge , if it is stored in the graph.
	-- Raises an Edge_Not_Found_Exception otherwise.
		Ada.Text_IO.Put_Line("Cleared all");
		return 0;
	end Get_Edge_Weight;

	function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
	begin
	-- Returns True if an edge from From to To is stored in the graph.
	-- Returns False otherwise.
		return True;
	end Has_Edge;

	function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
	begin
	-- Removes the edge in the Graph from From to To, if existing;
	-- Raises an Edge_Not_Found_Exception otherwise.
		return True;
	end Remove_Edge;

	function To_Vertex_Array return Vertex_Array is
		Graph_Vertices: Vertex_Array(1..Integer(Vertices.Length));
	begin
	-- Returns an array containing exactly all current vertices of the graph.
		for I in 1..Integer(Vertices.Length) loop
			Graph_Vertices(I) := Vertices.Element(I);
			if Graph_Vertices(I) = Vertices.Element(I) then
				Ada.Text_IO.Put_Line("yessa");
			end if;
		end loop;	
		return Graph_Vertices;
	end To_Vertex_Array;


end Graph;