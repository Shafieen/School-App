--CLASS STRUCTURE, SIMPLE IMPLEMENTATION
--CREATED BY ARDENTKID 2013
--FOR USE IN EDUCATIONAL MATERIALS

local Base --base of the class hierarchy (forward reference)

function Class(Super) --enables inheritance and polymorphism
   Super = Super or Base
   local prototype = setmetatable({}, Super)
   prototype.class = prototype
   prototype.super = Super
   prototype.__index = prototype
   return prototype
end

Base = Class()

function Base:new(...) --for creating Class instances
   local instance = setmetatable({}, self) --decorate instance with class attr
   instance:init(...)
   if (self.Instances) then table.insert(self.Instances, instance) end
   return instance
end

function Base:init() end --override in your Class

function Base:get(config) --get an instance; if none avalable, create a new one
	local Instances = self.Instances
	if (not Instances[1]) then local obj = self:new(config) end
	return table.remove(Instances, 1)
end

function Base:dispose() --return an instance for later use
	table.insert(self.Instances, self)
end
