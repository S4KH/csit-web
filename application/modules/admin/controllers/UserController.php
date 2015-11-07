<?php

class Admin_UserController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        $userTBL = new Model_DbTable_Users();
        $users = $userTBL->fetchAll();
        $identity = Zend_Auth::getInstance()->getStorage()->read();
        $this->view->ident = $identity;
        $page = $this->_getParam('page',1);
        $paginator = Zend_Paginator::factory($users);    
        $paginator->setItemCountPerPage(10);
        $paginator->setCurrentPageNumber($page);
        $this->view->users=$paginator; 
    }

    public function delAction()
    {
        // action body
    }

    public function changeAction()
    {
        // action body
    }


}





