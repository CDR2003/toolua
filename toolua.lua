function table.copy( t )
	local ret = {}
	for k, v in pairs( t ) do
		ret[k] = v
	end
	return ret
end


toolua = {}


function toolua.class( className, baseClass )
	local classObj = nil

	if baseClass ~= nil then
		classObj = table.copy( baseClass )
		classObj.__base = baseClass
	else
		classObj = {}
	end
	
	classObj.__name = className
	classObj.__index = classObj

	classObj.new = function( ... )
		local obj = {}
		setmetatable( obj, classObj )
		obj:__init( ... )
		return obj
	end

	_G[className] = classObj
	return classObj
end


function toolua.struct( structName )
	local structObj = toolua.class( structName )

	structObj.clone = function( obj )
		return table.copy( obj )
	end

	return structObj
end


function toolua.is( obj, class )
	local metatable = getmetatable( obj )
	local curClass = metatable
	repeat
		if curClass == class then
			return true
		end
		curClass = curClass.__base
	until curClass == nil
	return false
end


function toolua.getType( obj )
	return getmetatable( obj )
end

