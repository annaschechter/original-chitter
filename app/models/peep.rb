class Peep

	attr_accessor :user
	attr_accessor :reply

	include DataMapper::Resource

	property :id, Serial
	property :message, Text
	property :time_added, Time

	belongs_to :user
	has n, :replies

end