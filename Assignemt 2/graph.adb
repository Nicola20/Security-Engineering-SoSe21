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
		New_Edge: Edge_Type := (From, To, Weight);
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
		if not Edges.Is_Empty then
			for E of Edges loop
				if E.From = From and E.To = To then
					Ada.Text_IO.Put_Line(Integer'Image(E.Weight));
					return E.Weight;
				end if;
			end loop;
			raise Edge_Not_Found_Exception;
		else
			raise Edge_Not_Found_Exception;
		end if;
	exception
		when Edge_Not_Found_Exception =>
    		Ada.Text_IO.Put_Line("ERROR: The edge does not exist!");
    		return 0;
    	when others =>
    		Ada.Text_IO.Put_Line("Unknown error!");
    		return 0;
	end Get_Edge_Weight;


	function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
	begin
		if not Edges.Is_Empty then
			for E of Edges loop
				if E.From = From and E.To = To then
					Ada.Text_IO.Put_Line("Edge is inside graph");
					return True;
				end if;
			end loop;
			Ada.Text_IO.Put_Line("Edge is not inside graph");
			return False;
		else
			Ada.Text_IO.Put_Line("Edge is not inside graph");
			return False;
		end if;
	end Has_Edge;


	function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
	begin
		if not Edges.Is_Empty then
			for I in Edges.First_Index..Edges.Last_Index loop
				if Edges.Element(I).From = From and Edges.Element(I).To = To then
					Edges.Delete(I);
					Ada.Text_IO.Put_Line("Deleted Edge");
					return True;
				end if;
			end loop;
			raise Edge_Not_Found_Exception;
		else
			raise Edge_Not_Found_Exception;
		end if;
	exception
		when Edge_Not_Found_Exception =>
    		Ada.Text_IO.Put_Line("ERROR: The edge does not exist!");
    		return False;
    	when others =>
    		Ada.Text_IO.Put_Line("Unknown error!");
    		return False;
	end Remove_Edge;


	function To_Vertex_Array return Vertex_Array is
		Graph_Vertices: Vertex_Array(0..Natural(Integer(Vertices.Length) - 1));
	begin
		for I in Graph_Vertices'Range loop
			Graph_Vertices(I) := Vertices.Element(I);
		end loop;
		return Graph_Vertices;
	end To_Vertex_Array;

end Graph;