toolua
======

The Object-Oriented Lua, just a OO library for Lua.



Example
-------

To see a whole example for toolua, check out ```testToolua.lua``` inside the repo.



Tutorial
--------

### What are we gonna do?

We're gonna write a simple program that can output the area of a specific rectangle or circle, just like what we read on basic OOP books.

### Set Up toolua

The first thing we need to do is set up toolua. All you need to do is copy the toolua.lua file into your folder, and create a file beside it, and add a line at the top of your file:

```dofile( "toolua.lua" )```

That's all.

### Declare the "Shape" class

If you come from a mainstream OOP language, say C#, you will familiar with this:

```
public class Shape
{
}
```

Using toolua, you can do the same:

```toolua.class( "Shape" )```

### Implement the constructor of the Shape class

In C#, writing constructor is like this:

```
public Shape( string name )
{
    _name = name;
}
```

Using toolua, you do it like this:

```
function Shape:__init( name )
    self.name = name
end
```

### Create a subclass called "Circle"

To create a subclass, we need to implement the constructor, so that it calls the constructor of the base class.

In C#:

```
public class Circle : Shape
{
    public Circle( string name )
        : base( name )
    {
        _radius = 0.0f;
    }

    private float _radius;
}
```

Using toolua:

```
toolua.class( "Circle", Shape )

function Circle:__init( name )
    Shape.__init( self, name )
    self.radius = 0
end
```

Note that using toolua, calling base class constructor should pass "self" in as the first parameter, and you also need to specify the name of the base class "Shape".

### Implement a static function for Circle

In C#, a static function is specified by adding the "static" keyword where in toolua, all you have to do is to change the colon (:) to a dot (.).

C#:

```
public static float GetPi()
{
    return 3.14f;
}
```

toolua:

```
function Circle.getPi()
    return 3.14
end
```

### Implement the getArea() function for Circle

C#:

```
public float GetArea()
{
    return GetPi() * this._radius * this._radius;
}
```

toolua:

```
function Circle:getArea()
    return Circle.getPi() * self.radius * self.radius
end
```

### Create the circle object

C#:

```
var circle = new Circle( "C#Circle" );
circle.Radius = 1;
Console.WriteLine( circle.GetArea() );
```

toolua:

```
local circle = Circle.new( "LuaCircle" )
circle.radius = 1
print( circle:getArea() )
```
