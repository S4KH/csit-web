<?php

class Admin_EventsController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body        
        $eveTBL = new Model_DbTable_Event();
        $eves = $eveTBL->fetchAll($eveTBL->select()->order('etime ASC'));
        $userTBL = new Model_DbTable_Users();        
        $usern = $userTBL->fetchAll();
        $this->view->userinfo = $usern;
        $page=$this->_getParam('page',1);
        $paginator = Zend_Paginator::factory($eves);    
        $paginator->setItemCountPerPage(10);
        $paginator->setCurrentPageNumber($page);
        $this->view->news=$paginator;
    }

    public function addAction()
    {
        // action body
        $eventf = new Admin_Form_EventForm();
        $this->view->form = $eventf;
        $message = '';
        $event = new Model_DbTable_Event();
        $identity = Zend_Auth::getInstance()->getStorage()->read();
        if($this->getRequest()->isPost()){
            if($eventf->isValid($_POST)){                                      
                    $data = array('title' => $eventf->getValue('title'), 'etime' => $eventf->getValue('forDate'), 'content' => $eventf->getValue('content'), 
                    'place' => $eventf->getValue('rno'), 'tag' => $eventf->getValue('tag'), 'contact' => $eventf->getValue('cont'), 
                    'audience' => $eventf->getValue('aud'), 'uid' => $identity->uid);
                    $event->insert($data);
                    $message = 'Success'; 
            }
        }
        $this->view->message = $message;
    }

    public function editAction()
    {
        // action body
        if($this->_getParam('nid')){
            $eid = $this->_getParam('nid');
        }
        $message = '';
        $newsTBL = new Model_DbTable_Event();
        $evef = new Admin_Form_EventForm();
        $evef->setAction('events/edit'); 
        $identity = Zend_Auth::getInstance()->getStorage()->read();
        if($this->getRequest()->isPost()){
            if($evef->isValid($_POST)){
                $id = $evef->getValue('id');
                $where = array('id = ?' => $id);
                $data = array('title' => $evef->getValue('title'), 'etime' => $evef->getValue('forDate'), 'content' => $evef->getValue('content'), 
                    'place' => $evef->getValue('rno'), 'tag' => $evef->getValue('tag'), 'contact' => $evef->getValue('cont'), 
                    'audience' => $evef->getValue('aud'));
                $newsTBL->update($data, $where);
                $message = 'Success';
            }
        }else{
        $news = $newsTBL->fetchRow($newsTBL->select()->where('id = ?', $eid));
        $this->view->value = $news;
        
        $evef->populate(array('id' => $news->id, 'title' => $news->title, 'forDate'=> $news->etime,'content' => $news->content, 
                              'rno' => $news->place, 'aud' => $news->audience, 'cont' => $news->contact, 'tag' => $news->tag));
        }
        $this->view->evef = $evef;
        $this->view->message = $message;
    }

    public function delAction()
    {
        // action body
        if($this->_getParam('eid')){
            $id = $this->_getParam('eid', -1);
            if($id!=-1){
                $eveTBL = new Model_DbTable_Event();
                if($this->getRequest()->isGet()){
                        $where = array('id = ?' => $id);
                        $eveTBL->delete($where);
                        $this->_redirect('admin/events');
                }
            }
        }
    }


}







