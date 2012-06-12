/*
 * This file is part of SLPlayer http://www.silexlabs.org/groups/labs/slplayer/
 * 
 * This project is © 2011-2012 Silex Labs and is released under the GPL License:
 * 
 * This program is free software; you can redistribute it and/or modify it under the terms 
 * of the GNU General Public License (GPL) as published by the Free Software Foundation; 
 * either version 2 of the License, or (at your option) any later version. 
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
 * See the GNU General Public License for more details.
 * 
 * To read the license please visit http://www.gnu.org/copyleft/gpl.html
 */
package slplayer.util;

import haxe.macro.Type;

/**
 * Helper tools for macros.
 * 
 * @author Thomas Fétiveau
 */
class MacroTools 
{
	/**
	 * Tells if a given ClassType implements or extends or is <fullName>.
	 * 
	 * @param	classType, the classType to check.
	 * @param	fullName, the full name of the class or interface to compare to.
	 * @return	true if classType extends, implements or is fullname.
	 */
	static public function is( classType : haxe.macro.ClassType , fullName : String ) : Bool
	{
		if ( classType.pack.join(".") + "." + classType.name == fullName )
		{
			return true;
		}
		
		for ( i in classType.interfaces )
		{
			if ( i.t.get().pack.join(".")+"."+i.t.get().name == fullName )
			{
				return true;
			}
		}
		
		if ( classType.superClass != null )
		{
			return is(classType.superClass.t.get(), fullName);
		}
		
		return false;
	}
}