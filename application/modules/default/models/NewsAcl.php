<?php
class Model_NewsAcl extends Zend_Acl{
	public function __construct(){

		$this->addRole(new Zend_Acl_Role('guests'));
		$this->addRole(new Zend_Acl_Role('student'), 'guests');
        $this->addRole(new Zend_Acl_Role('teacher'), 'student');
		$this->addRole(new Zend_Acl_Role('admin'), 'teacher');	

		$this->add(new Zend_Acl_Resource('admin'))
			 ->add(new Zend_Acl_Resource('admin:news'), 'admin')
             ->add(new Zend_Acl_Resource('admin:events'), 'admin')
             ->add(new Zend_Acl_Resource('admin:ann'), 'admin')
             ->add(new Zend_Acl_Resource('admin:user'), 'admin');

		$this->add(new Zend_Acl_Resource('default'))
			 ->add(new Zend_Acl_Resource('default:authentication'), 'default')
			 ->add(new Zend_Acl_Resource('default:oz'), 'default')
			 ->add(new Zend_Acl_Resource('default:newsl'), 'default')
			 ->add(new Zend_Acl_Resource('default:index'), 'default')
			 ->add(new Zend_Acl_Resource('default:error'), 'default')
             ->add(new Zend_Acl_Resource('default:page'), 'default')
             ->add(new Zend_Acl_Resource('default:user'), 'default')
             ->add(new Zend_Acl_Resource('default:languageswitch'), 'default');

		$this->allow('guests', 'default:authentication' ,'login');
        $this->allow('guests', 'default:index' ,'index');
		$this->allow('guests', 'default:error' ,'error');
		$this->allow('guests', 'default:oz',array('index', 'home', 'news', 'memebers'));
		$this->allow('guests', 'default:newsl' ,array('index', 'listn', 'shown', 'ajax'));
        $this->allow('guests', 'default:languageswitch' ,'switch');
        $this->allow('guests', 'default:page' ,array('view', 'index'));
		$this->deny('guests','admin:news', array('add', 'edit', 'del', 'index', 'formadd'))
             ->deny('guests', 'admin:events' ,array('add', 'edit', 'del', 'index',))
             ->deny('guests', 'admin:ann' ,array('add', 'edit', 'del', 'index','retr'));
		$this->deny('student', 'default:authentication' ,'login');
		$this->allow('student', 'default:authentication' ,'logout');
        $this->allow('student', 'default:user' ,array('add', 'edit', 'del', 'index','sett'));
        $this->allow('teacher', 'admin:ann',array('add', 'edit', 'del', 'index','retr'));
		$this->allow('admin', 'admin:events' ,array('add', 'edit', 'del', 'index'));        
        $this->allow('admin', 'admin:news' ,array('add', 'edit', 'del', 'index'));
        $this->allow('admin', 'admin:user' ,array('change', 'del', 'index'));
        $this->deny('admin', 'default:user' ,array('add', 'edit', 'del', 'index'));
	}
}