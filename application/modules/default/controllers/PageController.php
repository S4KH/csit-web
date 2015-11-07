<?php

class PageController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

    public function viewAction()
    {
        // action body
                        
        
        if($this->_getParam('pid')){
            $pid = $this->_getParam('pid',-1);
            if($pid!=-1){
                $newstbl = new Model_DbTable_News();
                $where = array('id = ?' => $pid, 'type=?' => 4);
                $news = $newstbl->fetchRow($where);
                $this->view->pages = $news;
                $this->view->identity = Zend_Auth::getInstance()->getStorage()->read();
            }else $this->_redirect('index/index');
        }else $this->_redirect('index/index');
    }


}



