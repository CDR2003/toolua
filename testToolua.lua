dofile( "toolua.lua" )


toolua.class( "Vector2" )


function Vector2:__init( x, y )
	self.x = x
	self.y = y
end


function Vector2:getLength()
	return math.sqrt( self.x * self.x + self.y * self.y )
end


local pt = Vector2.new( 3, 4 )
print( pt.x )
print( pt.y )
print( pt:getLength() )


----------------------------------------


toolua.class( "Animal" )


function Animal:__init( name )
	self.name = name
end


function Animal:makeSound()
	print( "I'm " .. self.name )
end


toolua.class( "Dog", Animal )


function Dog:__init( name, age )
	Animal.__init( self, name )
	self.age = age
end


function Dog:makeSound()
	print( "WangWang! I'm " .. self.name )
	print( "Wang! And I'm " .. self.age .. " years old" )
end


local snoopy = Dog.new( "Snoopy", 20 )
snoopy:makeSound()
print( "\nIs snoopy an animal? " )
print( tostring( toolua.is( snoopy, Animal ) ) )
print( "\nIs snoopy a dog? " )
print( tostring( toolua.is( snoopy, Dog ) ) )
print( "\nIs snoopy exactly a dog? " )
print( tostring( toolua.getType( snoopy ) == Dog ) )
print( "\nIs snoopy exactly an animal? " )
print( tostring( toolua.getType( snoopy ) == Animal ) )

