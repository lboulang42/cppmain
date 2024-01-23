#!/bin/bash
if [ -z "$1" ]; then
	echo "Error: No argument provided, run as ./cppmain.sh ClassName"
	exit 1
fi

variable="$1"
variable_upper=$(echo "$variable"_H | tr '[:lower:]' '[:upper:]')


cat << EOF  > "$variable.hpp"
/*Generated using lboulang42's cppmain.sh*/

#ifndef $variable_upper
# define $variable_upper

# include <iostream>

class $variable
{
  	public:
		/*==========CANONICAL==========*/
		$variable();
		$variable($variable &src);
		$variable &operator=($variable const &src);
		~$variable();
		
		/*==========OPERATORS==========*/
		//$variable operator++(void);
		//$variable operator--(void);
		
		/*==========GETTERS==========*/
		//std::string get() const;
		
		/*==========SETTER==========*/
		//void set(std::string &s);
		
		/*==========EXCEPTIONS==========*/
		//class ExceptionName : public std::exception
		//{
		//	public:
		//		virtual const char *what() const throw();
		//};
	
	private:
		//std::string _var_str;
		//int _var_int;
};

// /*==========OTHER OPERATORS==========*/
// std::ostream &operator<<(std::ostream &out, $variable const &b);

#endif
EOF



cat << EOF > "$variable.cpp"
/*Generated using lboulang42's cppmain.sh*/

#include "$variable.hpp"

/*==========CANONICAL==========*/

/*default constructor*/
$variable::$variable()
{
	std::cout << "[$variable] - ";
	std::cout << "Default constructor called" << std::endl;
	//this->_var_str = "default";
	//this->_var_int = 0;
}

/*copy constructor*/
$variable::$variable($variable &src)
{
	std::cout << "[$variable] - ";
	std::cout << "Copy constructor called" << std::endl;
	(void)src;//remove this
	//this->_var_str = src.get();
}

/*operator = */
$variable &$variable::operator=($variable const &src)
{
	std::cout << "[$variable] - ";
	std::cout << "Assignation operator called" << std::endl;
	(void)src;//remove this
	if (this != &src)
	{
		//this->_var_str = src.get();
	}
	return (*this);
}

$variable::~$variable()
{
	std::cout << "[$variable] - ";
	std::cout << "Destructor called" << std::endl;
}

/*==========OPERATORS==========*/

//$variable $variable::operator++(void)
//{
//	std::cout << "[$variable] - ";
//	std::cout << "Operator ++ called" << std::endl;
//	this->_var_int++;
//	return (*this);
//}

//$variable $variable::operator--(void)
//{
//	std::cout << "[$variable] - ";
//	std::cout << "Operator -- called" << std::endl;
//	this->_var_int--;
//	return (*this);
//}

/*==========GETTERS==========*/

//std::string $variable::get() const
//{
//	std::cout << "[$variable] - ";
//	std::cout << "Function get called" << std::endl;
//	return (this->_var_str);
//}

/*==========SETTER==========*/
		
//void $variable::set(std::string &s)
//{
//	std::cout << "[$variable] - ";
//	std::cout << "setter called" << std::endl;
//	this->_var_str = s;
//}

/*==========EXCEPTIONS==========*/

//const char *$variable::ExceptionName::what() const throw()
//{
//	return ("[EXCEPTION] - ExceptionName");
//}


/*==========OTHER OPERATORS==========*/
//std::ostream &operator<<(std::ostream &out, $variable const &b)
//{
//	std::cout << "[$variable] - ";
//	std::cout << "Operator << called" << std::endl;
//	out << b.get() << std::endl;
// return (out);
//}

EOF

cat << EOF > main1.cpp
/*Generated using lboulang42's cppmain.sh*/

#include "$variable.hpp"

int main(void)
{
	{
		std::cout << "=====================" << std::endl;
		std::cout << "TEST CANONICALL CLASS" << std::endl;
		std::cout << "=====================" << std::endl;

		std::cout << "[TEST] : Default constructor" << std::endl;
		$variable a;
		std::cout << "[TEST] : Copy constructor" << std::endl;
		$variable b(a);
		std::cout << "[TEST] : Assignation operator" << std::endl;
		b = a;
		std::cout << "[TEST] : Destructor" << std::endl;
	}
	{
		std::cout << "[TEST] : ptr, new, delete, deep copy..." << std::endl;    
		$variable *d = new $variable();
		$variable *c = new $variable();
		*c = *d;
		delete c;
		delete d;
	}
}

EOF