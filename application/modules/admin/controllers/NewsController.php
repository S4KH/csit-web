<?php

class Admin_NewsController extends Zend_Controller_Action
{

    private $nid = null;

    public function init()
    {
        /* Initialize action controller here */
        
    }

    public function indexAction()
    {
        // action body
        if($this->_getParam('uid')){
            $nid = $this->_getParam('uid');
        }   
    		$newsTBL = new Model_DbTable_News();
    		$news = $newsTBL->fetchAll($newsTBL->select()->order('etime DESC'));
            $userTBL = new Model_DbTable_Users();        
            $usern = $userTBL->fetchAll();
            $this->view->userinfo = $usern;
            $page=$this->_getParam('page',1);
            $paginator = Zend_Paginator::factory($news); 	
            $paginator->setItemCountPerPage(10);
            $paginator->setCurrentPageNumber($page);
            $this->view->news=$paginator; 
    }

    public function addAction()
    {
        // action body        
		$news = new Model_DbTable_News();        
        $newsf = new Admin_Form_NewsForm();
        $this->view->newsf = $newsf;
        $identity = Zend_Auth::getInstance()->getStorage()->read();
        if($this->getRequest()->isPost()){                
                if($newsf->isValid($_POST)){                   	
                    $data = array('title' => $newsf->getValue('title'), 'img_url' => $newsf->getValue('image'), 'content' => $newsf->getValue('content'),
                    'type' => $newsf->getValue('ncat'), 'uid' => $identity->uid);
                    $news->insert($data);
                    echo "Added Successfully";
                }
            }
    }

    public function delAction()
    {
        // action body
        if($this->_getParam('nid')){
            $nid = $this->_getParam('nid', -1);
            if($nid!=-1){
                $newsTBL = new Model_DbTable_News();
                if($this->getRequest()->isGet()){
                        $where = array('id = ?' => $nid);
                        $newsTBL->delete($where);
                        $this->_redirect('admin/news');
                }
            }
        }      
    }

    public function editAction()
    {
        // action body
        if($this->_getParam('nid')){
        	$id = $this->_getParam('nid',-1);
            if($id!=-1){
        		$newsTBL = new Model_DbTable_News();
                $newsf = new Admin_Form_NewsForm(); 
                $newsf->setAction('news/edit');
                $identity = Zend_Auth::getInstance()->getStorage()->read();
                if($this->getRequest()->isPost()){
                    if($newsf->isValid($_POST)){
                    	$nidF = $newsf->getValue('id');
                    	$where = array('id = ?' => $nidF);
                        if($newsf->getValue('image')!=NULL)
                            $data = array('title' => $newsf->getValue('title'), 'type' =>$newsf->getValue('ncat'),
                                          'img_url' => $newsf->getValue('image'), 'content' => $newsf->getValue('content'));
                        else
                            $data = array('title' => $newsf->getValue('title'), 'type' =>$newsf->getValue('ncat'), 
                                          'content' => $newsf->getValue('content'));
                        $newsTBL->update($data, $where);
                        echo "<h4 style='color:green;'>Updated successfully</h4>";
                    }
                }else{       
        		  $where = array('id = ?' => $id); 
        		  $news = $newsTBL->fetchRow($where);
        		  $this->view->value = $news;
            		
            	  $newsf->populate(array('id' => $news->id, 'image'=>$news->img_url, 
            	  'title' => $news->title, 'content' => $news->content));
                  $newsf->getElement('ncat')->setValue($news->type);                  		  
                }    
                $this->view->newsf = $newsf;
           } else $this->_redirect('index/index');
        } else $this->_redirect('index/index');
    }

    public function formaddAction()
    {
        // action body
    }


}













