<?php

class UserController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        if($this->_getParam('uid')){
            $uid = $this->_getParam('uid',-1);           
            if($uid!=-1){
                $newsTBL = new Model_DbTable_News();
                $news = $newsTBL->fetchAll($newsTBL->select()
                                                   ->order('etime DESC')
                                                   ->where('uid=?', $uid));
                $userTBL = new Model_DbTable_Users();        
                $usern = $userTBL->fetchAll();
                $this->view->userinfo = $usern;
                $page=$this->_getParam('page',1);
                $paginator = Zend_Paginator::factory($news);    
                $paginator->setItemCountPerPage(10);
                $paginator->setCurrentPageNumber($page);
                $this->view->news=$paginator;
            }
        }
    }

    public function addAction()
    {
        // action body
        if($this->_getParam('type')){
            $type = $this->_getParam('type',-1);
            if($type!=-1){        
                $news = new Model_DbTable_News();        
                $newsf = new Form_NewsForm();
                
                switch ($type) {
                    case '1':
                        $atype=5;
                        $newsf->setAction('',$type);
                        break;
                    case '2':
                        $atype=6;
                        break;
                    default:
                        
                        break;
                }
                $this->view->newsf = $newsf;                
                $identity = Zend_Auth::getInstance()->getStorage()->read();
                if($this->getRequest()->isPost()){                
                        if($newsf->isValid($_POST)){                    
                            $data = array('title' => $newsf->getValue('title'), 'img_url' => $newsf->getValue('image'), 
                                          'content' => $newsf->getValue('content'),'type' => $atype,'uid' => $identity->uid);
                            $news->insert($data);
                            $this->_redirect('user/index/uid/',$identity->uid);
                        }
                    }
            }else $this->_redirect('index/index');
        }else $this->_redirect('index/index');
    }

    public function editAction()
    {
        // action body
        if($this->_getParam('nid')){
            $id = $this->_getParam('nid',-1);
            if($id!=-1){
                $identity = Zend_Auth::getInstance()->getStorage()->read();                
                switch ($identity->role) {
                    case 'student':
                        $atype=5;
                        break;
                    case 'teacher':
                        $atype=6;
                        break;
                    default:
                        
                        break;
                }
                $newsTBL = new Model_DbTable_News();
                $newsf = new Form_NewsForm(); 
                $newsf->setAction('news/edit');
                
                if($this->getRequest()->isPost()){
                    if($newsf->isValid($_POST)){
                        $nidF = $newsf->getValue('id');
                        $where = array('id = ?' => $nidF);
                        if($newsf->getValue('image')!=NULL)
                            $data = array('title' => $newsf->getValue('title'), 'type' => $atype, 
                                          'img_url' => $newsf->getValue('image'), 'content' => $newsf->getValue('content'));
                        else
                            $data = array('title' => $newsf->getValue('title'), 'type' =>$identity->uid, 
                                          'content' => $newsf->getValue('content'));
                        $newsTBL->update($data, $where);
                        $url = array('user/index/uid/?' => $identity->uid);
                        $this->_redirect($url);
                    }
                }else{       
                  $where = array('id = ?' => $id); 
                  $news = $newsTBL->fetchRow($where);
                  $this->view->value = $news;
                    
                  $newsf->populate(array('id' => $news->id, 'image'=>$news->img_url, 'title' => $news->title, 'content' => $news->content));          
                }    
                $this->view->newsf = $newsf;
           } else $this->_redirect('index/index');
        } else $this->_redirect('index/index');
        
    }

    public function delAction()
    {
        // action body
    }

    public function settAction()
    {
        // action body
    }


}









