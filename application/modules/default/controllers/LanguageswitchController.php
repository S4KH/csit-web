<?php
class LanguageswitchController extends Zend_Controller_Action
{
    public function init(){        
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }
    public function switchAction(){
        $session = new Zend_Session_Namespace('sit');
        $session->language = $this->_getParam('lang');
        
        $this->_redirect('index/index');
    }
}
