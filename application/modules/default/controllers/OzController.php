<?php

class OzController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    	$this->view->act=$this->_request->getActionName();
    	$this->view->clr='oz';
    }

    public function indexAction()
    {
        // action body
    }

    public function homeAction()
    {
        // action body
    }

    public function newsAction()
    {
        // action body
    }

    public function membersAction()
    {
        // action body
    }


}







