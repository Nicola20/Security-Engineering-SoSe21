-- ------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Package specification for graph package
-- ------------------------------------------------------------

with Ada.Containers.Vectors;

generic
	type Vertex_Type is private;
	with function "="(Left: Vertex_Type; Right: Vertex_Type) return Boolean;
package Graph is
	Edge_Not_Found_Exception: exception;
	Vertex_Already_In_Graph_Exception: exception;
	Vertex_Not_In_Graph_Exception: exception;

	type Edge_Type is record
		From: Vertex_Type;
		To: Vertex_Type;
		Weight: Integer := 0;
	end record;

	type Vertex_Array is array(Natural range <>) of Vertex_Type;
	type Edge_Array is array(Natural range <>) of Edge_Type;

	procedure Add_Vertex(Vertex: Vertex_Type);
	-- Stores the Vertex in the Graph. Raises a
	-- Vertex_Already_In_Graph_Exception if it is already in the graph.
	procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer);
	-- Stores a new edge in the Graph from From to To that has the given
	-- Weight assigned to it . If an edge from From to To is already stored
	-- in the Graph, this function only re-assigns the given Weight to it
	-- and does nothing beyond.
	-- Before storing it the existence of the two vertices inside the graph
	-- is checked. If one or both do not exist, an Vertex_Not_In_Graph_Exception
	-- is raised.
	procedure Clear;
	-- Removes all vertices and edges from the graph.
	function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer;
	-- Returns the weight of the edge , if it is stored in the graph.
	-- Raises an Edge_Not_Found_Exception otherwise.
	function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean;
	-- Returns True if an edge from From to To is stored in the graph.
	-- Returns False otherwise.
	function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean;
	-- Removes the edge in the Graph from From to To, if existing;
	-- Raises an Edge_Not_Found_Exception otherwise.
	function To_Vertex_Array return Vertex_Array;
	-- Returns an array containing exactly all current vertices of the graph.
	function To_Edge_Array return Edge_Array;
	-- Returns an array containing exactly all current edges of the graph.
	procedure Put_Vert(Vert : in Vertex_Type);
	procedure Put_Edge(Edge : in Edge_Type);

	function Get_Index_Of(Vert : in Vertex_Type) return Integer;
	-- Returns the index of an unique vertex, -1 if not doesn't exist
	-- needed for union find, due to Generic declaration to allow any type


private

	package Edge_Vectors is new Ada.Containers.Vectors(
		Element_Type => Edge_Type,
		Index_Type => Natural);
	package Vertex_Vectors is new Ada.Containers.Vectors(
		Element_Type => Vertex_Type,
		Index_Type => Natural);
	use Edge_Vectors;
	use Vertex_Vectors;

	Edges: Edge_Vectors.Vector;
	Vertices: Vertex_Vectors.Vector;

end Graph;