
require 'test/unit'

require './board.rb'

class TestBoard < Test::Unit::TestCase

	def setup
		
		# Create a new board with 8 stations and connections from a test board
		
		@board = Board.new(8, 'a_board.csv')
		
	end

	def test_new_board
		
		# Test if new boards have correct number of stations and connections
		
		assert_equal(9, @board.stations.length)
		assert_equal(12, @board.connections.length)

	end
		
	def test_stations_of_board
		
		# Test if the stations of the board have correct values
		
		@board.stations.shift
		
		@board.stations.each do |station|
			assert_equal(-1, station.occupied_by)
		end
		
		@board.stations.each_with_index do |station, index|
			assert_equal(index + 1, station.number)
		end
		
	end
	
	def test_stations_connected_to
		
		# Test if the connections of board have correct values
		
		assert_equal(:underground, @board.connections[11].kind)
		assert_equal(@board.stations[4], @board.connections[11].station_a)
		assert_equal(@board.stations[6], @board.connections[11].station_b)
		
		# Test if one can correctly find which other stations a station is connected to
		
		assert_equal([@board.stations[1], @board.stations[6]], @board.stations_connected_to(4))
		assert_equal([@board.stations[6], @board.stations[7]], @board.stations_connected_to(8))
		assert_equal([@board.stations[2], @board.stations[4], @board.stations[5], @board.stations[7]], @board.stations_connected_to(1))
		
	end

end

