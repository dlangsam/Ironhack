class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end

 ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
 python = ProgrammingLanguage.new("Python", 24, "Dynamic")
 javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
 go = ProgrammingLanguage.new("Go", 6, "Static")
 rust = ProgrammingLanguage.new("Rust", 5, "Static")
 swift = ProgrammingLanguage.new("Swift", 2, "Static")
 java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]

def array_printer(array)
  array.each do | language |
    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
  end
end

#array_printer(array_of_languages)

aged_array = array_of_languages.map do |language|
	#language.age += 1
	language1 = ProgrammingLanguage.new(language.name, language.age + 1, language.type)
end

array_printer(aged_array)
puts "----"
array_printer(array_of_languages)

sorted_array = aged_array.sort_by{|language| -language.age}

#array_printer(sorted_array)

noJava_array = array_of_languages.delete_if { |language| language.name == "Java" }

#array_printer(noJava_array) 

shuffle_array = sorted_array.shuffle

# array_printer(shuffle_array)

permutation_array = array_of_languages.permutation(3).to_a

# array_printer(permutation_array[1])

javaPair_array = noJava_array.product([java])

# array_printer(javaPair_array[3])

sample_array = array_of_languages.sample(1)

# array_printer(sample_array)

array_of_languages.map! do | language |
	language.name += "!!!"
	language
end

# array_printer(array_of_languages)