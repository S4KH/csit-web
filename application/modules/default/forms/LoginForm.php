<?php
class Form_LoginForm extends Zend_Form{
	public function __construct($option = null){
		parent::__construct($option);
		$this->setName('login');
		$username = $this->createElement('text','username');
        $username->setRequired(true)
                 ->addValidator('NotEmpty');
        $this->addElement($username);

        $password = $this->createElement('password','password');                    
        $password->setRequired(true)
                 ->addValidator('NotEmpty');
        $this->addElement($password);	
		
		$rememberMe = $this->createElement('checkbox','rMe');
		$this->addElement($rememberMe);			 
	}
}