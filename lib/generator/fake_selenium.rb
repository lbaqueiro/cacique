 #
 #  @Authors:    
 #      Brizuela Lucia                  lula.brizuela@gmail.com
 #      Guerra Brenda                   brenda.guerra.7@gmail.com
 #      Crosa Fernando                  fernandocrosa@hotmail.com
 #      Branciforte Horacio             horaciob@gmail.com
 #      Luna Juan                       juancluna@gmail.com
 #      
 #  @copyright (C) 2010 MercadoLibre S.R.L
 #
 #
 #  @license        GNU/GPL, see license.txt
 #  This program is free software: you can redistribute it and/or modify
 #  it under the terms of the GNU General Public License as published by
 #  the Free Software Foundation, either version 3 of the License, or
 #  (at your option) any later version.
 #
 #  This program is distributed in the hope that it will be useful,
 #  but WITHOUT ANY WARRANTY; without even the implied warranty of
 #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #  GNU General Public License for more details.
 #
 #  You should have received a copy of the GNU General Public License
 #  along with this program.  If not, see http://www.gnu.org/licenses/.
 #
module FakeSelenium
	class SeleniumDriver
		
		attr_accessor	:call_obj
		
		class << self
			attr_accessor	:init_callback
		end
		
		def initialize ( *x )
			SeleniumDriver.init_callback.call( self )
		end
		
		
		def method_missing(method_name, *x)
			@call_obj.send(method_name,*x)
		end
		
		def select(*p)
			@call_obj.select(*p)
		end
	
		def open( *x )
			@call_obj.open( *x )
		end

		
		def type( input, text)
			@call_obj.type(input,text)
		end
	end
end
