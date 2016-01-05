# Codeigniter-language-db
Codeigniter library for multi language websites using Codeigniter framework

# install
1. add files to your project
2. import db tabels.
That's it !


# Usage
1. add your pages names to 'page' table
2. add language holders strings to 'content_holder' table
3. add your languages to 'language' table
4. add your languages strings to 'content_view' table.
5. load library in 'autoload.php'.
6. load page in your controller like:
	$this->language->load('page_name');
7. use 'lang("string_holder")' to print your language word.

