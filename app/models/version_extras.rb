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
class VersionExtras
  def self.clean_versions(type)
    case type.downcase
      when "circuit"
        count = Circuit.count * VERSION_MAX_ENTRIES_FACTOR_CIRCUIT
        size = CIRCUIT_MIN_VERSION_ENTRIES
        
      when "user_function"
        count = UserFunction.count * VERSION_MAX_ENTRIES_FACTOR_FUNCTION
        size = FUNCTION_MIN_VERSION_ENTRIES
    end
      
    if Version.find_all_by_versioned_type(type).count > count
        #delete oldest version
        version_deleted = false

        Version.find_all_by_versioned_type(type).each do |v|
          if v.versioned
            if v.versioned.versions
              if v.versioned.versions.size > size
                v.delete
                version_deleted = true
                break
              end
            end
          end
        end

        unless version_deleted
          v = Version.first
          v.delete
        end
    end
    
  end
end
