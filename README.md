toolua
======

The Object-Oriented Lua, just a OO library for Lua.


Tutorial
--------

### What we gonna do?

We gonna write a simple program that can output the area of a specific rectangle or circle, just like what we read on basic OOP books.

### Set Up toolua

The first thing we need to do is set up toolua. All you need to do is copy the toolua.lua file into your folder, and create a file beside it, and add a line at the top of your file:

```dofile( "toolua.lua" )```

That's all.

### Declare the "Shape" class

If you come from a mainstream OOP language, say C#, you will familiar with this:

```
class Shape
{
}
```

Using toolua, you can do the same:

```toolua.class( "Shape" )```

### Implement the constructor of the Shape class

In C#, writing constructor is like this:

```
Shape( string name )
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
